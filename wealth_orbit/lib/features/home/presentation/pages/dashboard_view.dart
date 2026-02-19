import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import '../../../../core/providers/isar_provider.dart';
import '../../../../features/portfolio/presentation/providers/portfolio_provider.dart';
import '../../../../features/trans/presentation/providers/transaction_provider.dart';
import '../../../../features/trans/data/models/transaction_model.dart';

class DashboardView extends ConsumerWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final netWorthAsync = ref.watch(totalNetWorthProvider);
    final stocksAsync = ref.watch(stockPositionsProvider);
    final fixedAsync = ref.watch(fixedInstrumentsProvider);
    final transactionsAsync = ref.watch(transactionListProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNetWorthCard(netWorthAsync),
          const SizedBox(height: 24),
          
          // Asset Allocation Chart
          if (stocksAsync.hasValue && fixedAsync.hasValue)
             _buildAssetAllocationChart(stocksAsync.value!, fixedAsync.value!),
          
          const SizedBox(height: 24),
          const Text('Recent Activity', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _buildRecentActivityList(transactionsAsync),
        ],
      ),
    );
  }

  Widget _buildNetWorthCard(AsyncValue<double> netWorthAsync) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [const Color(0xFF1E1E1E), Colors.grey.shade900],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(color: const Color(0xFFC6FF00).withOpacity(0.1), blurRadius: 20, offset: const Offset(0, 10)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Total Net Worth', style: TextStyle(color: Colors.grey, fontSize: 14)),
          const SizedBox(height: 8),
          netWorthAsync.when(
            data: (value) => Text(
              NumberFormat.currency(symbol: 'LKR ', decimalDigits: 0).format(value),
              style: const TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold, letterSpacing: -1),
            ),
            loading: () => const SizedBox(height: 40, width: 200, child: LinearProgressIndicator(color:  Color(0xFFC6FF00))),
            error: (_, __) => const Text('NV', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildAssetAllocationChart(List<dynamic> stocks, List<dynamic> fixed) {
      double stockTotal = 0;
      for (var s in stocks) stockTotal += (s.totalQuantity * s.currentPrice);
      
      double fixedTotal = 0;
      for (var f in fixed) fixedTotal += f.principalAmount;

      double total = stockTotal + fixedTotal;

      if (total == 0) return const SizedBox.shrink();

      return Container(
        padding: const EdgeInsets.all(24),
         decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            const Text('Asset Allocation', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            SizedBox(
              height: 200,
              child: PieChart(
                PieChartData(
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: [
                    PieChartSectionData(
                      color: const Color(0xFFC6FF00),
                      value: stockTotal,
                      title: '${((stockTotal/total)*100).toStringAsFixed(0)}%',
                      radius: 50,
                      titleStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                     PieChartSectionData(
                      color: const Color(0xFF2962FF),
                      value: fixedTotal,
                      title: '${((fixedTotal/total)*100).toStringAsFixed(0)}%',
                      radius: 50,
                       titleStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLegendItem(const Color(0xFFC6FF00), 'Stocks'),
                const SizedBox(width: 16),
                _buildLegendItem(const Color(0xFF2962FF), 'Fixed Income'),
              ],
            ),
          ],
        ),
      );
  }
  
  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }

  Widget _buildRecentActivityList(AsyncValue<List<TransactionModel>> transactionsAsync) {
    return transactionsAsync.when(
      data: (transactions) {
        if (transactions.isEmpty) return const Text('No recent activity', style: TextStyle(color: Colors.grey));
        
        final recents = transactions.take(5).toList(); // Show top 5
        
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: recents.length,
          separatorBuilder: (_, __) => Divider(color: Colors.grey.shade900),
          itemBuilder: (context, index) {
            final t = recents[index];
            final isIncome = t.type == TransactionType.income;
            return ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundColor: isIncome ? const Color(0xFFC6FF00).withOpacity(0.2) : const Color(0xFFFF5252).withOpacity(0.2),
                child: Icon(
                  isIncome ? Icons.arrow_upward : Icons.arrow_downward, 
                  color: isIncome ? const Color(0xFFC6FF00) : const Color(0xFFFF5252),
                ),
              ),
              title: Text(t.category, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              subtitle: Text(DateFormat('MMM d').format(t.date), style: const TextStyle(color: Colors.grey)),
              trailing: Text(
                '${isIncome ? '+' : '-'} ${NumberFormat.simpleCurrency(name: 'LKR ', decimalDigits: 0).format(t.amount)}',
                style: TextStyle(color: isIncome ? const Color(0xFFC6FF00) : const Color(0xFFFF5252), fontWeight: FontWeight.bold),
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => const Text('Error loading activity', style: TextStyle(color: Colors.red)),
    );
  }
}
