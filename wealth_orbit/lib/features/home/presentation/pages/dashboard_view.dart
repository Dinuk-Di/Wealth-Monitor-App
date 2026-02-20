import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import '../../../../core/providers/isar_provider.dart';
import '../../../../features/portfolio/presentation/providers/portfolio_provider.dart';
import '../../../../features/trans/presentation/providers/transaction_provider.dart';
import '../../../../features/trans/data/models/transaction_model.dart';
import 'dart:math';
import '../providers/cash_flow_provider.dart';

class DashboardView extends ConsumerWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final netWorthAsync = ref.watch(totalNetWorthProvider);
    final stocksAsync = ref.watch(stockPositionsProvider);
    final fixedAsync = ref.watch(fixedInstrumentsProvider);
    final transactionsAsync = ref.watch(transactionListProvider);
    final cashFlowAsync = ref.watch(cashFlowSummaryProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cash Flow Summary (Hero)
          _buildCashFlowHero(cashFlowAsync),
          
          const SizedBox(height: 20),
          
          // Monthly Overview
          cashFlowAsync.when(
            data: (data) => Column(
              children: [
                _buildMonthlyOverview(data.currentMonth),
                const SizedBox(height: 32),
                 _buildAllTimeSummary(data),
              ],
            ),
            loading: () => const SizedBox(height: 100, child: Center(child: CircularProgressIndicator())),
            error: (_, __) => const SizedBox.shrink(),
          ),

          const SizedBox(height: 20),
          
          // Net Worth Card (Secondary)
          _buildNetWorthCard(netWorthAsync),

          const SizedBox(height: 32),
          
          // Asset Allocation Chart
          if (stocksAsync.hasValue && fixedAsync.hasValue) ...[
             const Text('Portfolio Breakdown', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0.5)),
             const SizedBox(height: 16),
             _buildAssetAllocationChart(stocksAsync.value!, fixedAsync.value!),
             const SizedBox(height: 32),
          ],
          
          const Text('Recent Activity', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0.5)),
          const SizedBox(height: 16),
          _buildRecentActivityList(transactionsAsync),
        ],
      ),
    );
  }

  Widget _buildCashFlowHero(AsyncValue<CashFlowSummary> cashFlowAsync) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1E1E1E), Color(0xFF121212)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFC6FF00).withOpacity(0.05),
            blurRadius: 30,
            offset: const Offset(0, 10),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('AVAILABLE CASH BALANCE', 
            style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.5)
          ),
          const SizedBox(height: 12),
          cashFlowAsync.when(
            data: (data) => Text(
              NumberFormat.currency(symbol: 'LKR ', decimalDigits: 2).format(data.totalBalance),
              style: const TextStyle(
                color: Colors.white, 
                fontSize: 40, 
                fontWeight: FontWeight.w800, 
                letterSpacing: -1.5,
                height: 1.1,
              ),
              textAlign: TextAlign.center,
            ),
            loading: () => const SizedBox(height: 48, width: 200, child: Center(child: CircularProgressIndicator(color: Color(0xFFC6FF00)))),
            error: (_, __) => const Text('NV', style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
             decoration: BoxDecoration(
              color: const Color(0xFFC6FF00).withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFC6FF00).withOpacity(0.2)),
            ),
            child: Text('Based on Income - (Expense + Investments)', 
                  style: const TextStyle(color: Color(0xFFC6FF00), fontSize: 10, fontWeight: FontWeight.bold)
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMonthlyOverview(MonthlyStats stats) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         const Text('This Month', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0.5)),
         const SizedBox(height: 16),
         Row(
           children: [
             Expanded(child: _buildSummaryCard('Income', stats.income, const Color(0xFFC6FF00), Icons.arrow_downward)),
             const SizedBox(width: 12),
             Expanded(child: _buildSummaryCard('Expense', stats.expense, const Color(0xFFFF5252), Icons.arrow_upward)),
           ],
         ),
         const SizedBox(height: 12),
         Row(
           children: [
             Expanded(child: _buildSummaryCard('Invested', stats.invested, const Color(0xFF2962FF), Icons.pie_chart)),
             const SizedBox(width: 12),
             Expanded(child: _buildSummaryCard('Remaining', stats.remaining, Colors.white, Icons.account_balance_wallet)),
           ],
         ),
      ],
    );
  }

  Widget _buildAllTimeSummary(CashFlowSummary data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         const Text('All Time History', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0.5)),
         const SizedBox(height: 16),
         Container(
           padding: const EdgeInsets.all(24),
           decoration: BoxDecoration(
             color: const Color(0xFF1E1E1E),
             borderRadius: BorderRadius.circular(24),
             border: Border.all(color: Colors.white.withOpacity(0.05)),
           ),
           child: Column(
             children: [
               _buildAllTimeRow('Total Income', data.totalIncome, const Color(0xFFC6FF00)),
               const Padding(padding: EdgeInsets.symmetric(vertical: 16), child: Divider(color: Colors.white10)),
               _buildAllTimeRow('Total Expenses', data.totalExpense, const Color(0xFFFF5252)),
               const Padding(padding: EdgeInsets.symmetric(vertical: 16), child: Divider(color: Colors.white10)),
               _buildAllTimeRow('Total Invested', data.totalInvested, const Color(0xFF2962FF)),
               const Padding(padding: EdgeInsets.symmetric(vertical: 16), child: Divider(color: Colors.white10)),
               _buildAllTimeRow('All Time Remaining', data.totalBalance, Colors.white, isBold: true),
             ],
           ),
         ),
      ],
    );
  }

  Widget _buildAllTimeRow(String label, double amount, Color color, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(color: Colors.grey.shade400, fontSize: 14)),
        Text(
          NumberFormat.simpleCurrency(name: 'LKR ', decimalDigits: 2).format(amount),
          style: TextStyle(color: color, fontSize: isBold ? 18 : 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildNetWorthCard(AsyncValue<double> netWorthAsync) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('NET WORTH', style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.0)),
              SizedBox(height: 4),
              Text('Total Assets', style: TextStyle(color: Colors.grey, fontSize: 10)),
            ],
          ),
          netWorthAsync.when(
            data: (value) => Text(
              NumberFormat.currency(symbol: 'LKR ', decimalDigits: 2).format(value),
              style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            loading: () => const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)),
            error: (_, __) => const Text('NV', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(String title, double amount, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Icon(icon, color: color, size: 20),
           const SizedBox(height: 12),
           Text(title.toUpperCase(), style: TextStyle(color: Colors.grey.shade400, fontSize: 10, fontWeight: FontWeight.bold)),
           const SizedBox(height: 4),
           FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              NumberFormat.simpleCurrency(name: '', decimalDigits: 2).format(amount),
              style: TextStyle(color: color == Colors.white ? Colors.white : color.withOpacity(0.9), fontSize: 20, fontWeight: FontWeight.bold),
            ),
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
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: Colors.white.withOpacity(0.05)),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: PieChart(
                PieChartData(
                  sectionsSpace: 4,
                  centerSpaceRadius: 40,
                  startDegreeOffset: -90,
                  sections: [
                    PieChartSectionData(
                      color: const Color(0xFFC6FF00),
                      value: stockTotal,
                      title: '${((stockTotal/total)*100).toStringAsFixed(0)}%',
                      radius: 60,
                      titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                      borderSide: const BorderSide(color: Colors.black, width: 2),
                    ),
                     PieChartSectionData(
                      color: const Color(0xFF2962FF),
                      value: fixedTotal,
                      title: '${((fixedTotal/total)*100).toStringAsFixed(0)}%',
                      radius: 50,
                       titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                       borderSide: const BorderSide(color: Colors.black, width: 2),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLegendItem(const Color(0xFFC6FF00), 'Stocks', stockTotal),
                const SizedBox(width: 24),
                _buildLegendItem(const Color(0xFF2962FF), 'Fixed', fixedTotal),
              ],
            ),
          ],
        ),
      );
  }
  
  Widget _buildLegendItem(Color color, String label, double amount) {
    return Column(
      children: [
        Row(
          children: [
            Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
            const SizedBox(width: 6),
            Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          NumberFormat.simpleCurrency(name: 'LKR ', decimalDigits: 2).format(amount), 
          style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)
        ),
      ],
    );
  }

  Widget _buildRecentActivityList(AsyncValue<List<TransactionModel>> transactionsAsync) {
    return transactionsAsync.when(
      data: (transactions) {
        if (transactions.isEmpty) {
           return Container(
             padding: const EdgeInsets.all(24),
             width: double.infinity,
             decoration: BoxDecoration(
               color: const Color(0xFF1E1E1E),
               borderRadius: BorderRadius.circular(24),
               border: Border.all(color: Colors.white.withOpacity(0.05)),
             ),
             child: const Center(child: Text('No recent activity', style: TextStyle(color: Colors.grey))),
           );
        }
        
        final recents = transactions.take(5).toList(); // Show top 5
        
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: recents.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final t = recents[index];
            final isIncome = t.type == TransactionType.income;
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withOpacity(0.02)),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isIncome ? const Color(0xFFC6FF00).withOpacity(0.1) : const Color(0xFFFF5252).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isIncome ? Icons.arrow_upward : Icons.arrow_downward, 
                      color: isIncome ? const Color(0xFFC6FF00) : const Color(0xFFFF5252),
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(t.category, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(height: 4),
                        Text(DateFormat('MMM d, y').format(t.date), style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                      ],
                    ),
                  ),
                  Text(
                    '${isIncome ? '+' : '-'} ${NumberFormat.simpleCurrency(name: '', decimalDigits: 0).format(t.amount)}',
                    style: TextStyle(color: isIncome ? const Color(0xFFC6FF00) : const Color(0xFFFF5252), fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
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
