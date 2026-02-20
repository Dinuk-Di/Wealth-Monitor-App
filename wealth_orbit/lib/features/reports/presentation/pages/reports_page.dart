
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:wealth_orbit/features/home/presentation/providers/cash_flow_provider.dart';

class ReportsPage extends ConsumerWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cashFlowAsync = ref.watch(cashFlowSummaryProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Financial Reports', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: cashFlowAsync.when(
        data: (data) {
          if (data.history.isEmpty) {
             return const Center(child: Text('No history available', style: TextStyle(color: Colors.grey)));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(20),
            itemCount: data.history.length,
            separatorBuilder: (_, __) => const SizedBox(height: 24),
            itemBuilder: (context, index) {
              final monthStats = data.history[index];
              return _buildMonthCard(monthStats);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator(color: Color(0xFFC6FF00))),
        error: (err, _) => Center(child: Text('Error: $err', style: const TextStyle(color: Colors.red))),
      ),
    );
  }

  Widget _buildMonthCard(MonthlyStats stats) {
    final date = DateTime(stats.year, stats.month);
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat('MMMM yyyy').format(date).toUpperCase(),
            style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.5),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: _buildStatItem('Income', stats.income, const Color(0xFFC6FF00), Icons.arrow_downward)),
              const SizedBox(width: 16),
              Expanded(child: _buildStatItem('Expense', stats.expense, const Color(0xFFFF5252), Icons.arrow_upward)),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(color: Colors.white10),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: _buildStatItem('Invested', stats.invested, const Color(0xFF2962FF), Icons.pie_chart)),
              const SizedBox(width: 16),
              Expanded(child: _buildStatItem('Remaining', stats.remaining, Colors.white, Icons.account_balance_wallet)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, double amount, Color color, IconData icon) {
     return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Row(
           children: [
             Icon(icon, color: color.withOpacity(0.7), size: 16),
             const SizedBox(width: 8),
             Text(label, style: TextStyle(color: Colors.grey.shade400, fontSize: 12)),
           ],
         ),
         const SizedBox(height: 8),
         FittedBox(
           fit: BoxFit.scaleDown,
           child: Text(
             NumberFormat.simpleCurrency(name: 'LKR ', decimalDigits: 2).format(amount),
             style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.bold),
           ),
         ),
       ],
     );
  }
}
