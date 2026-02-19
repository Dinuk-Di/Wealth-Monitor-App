
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import '../../../../features/trans/presentation/providers/transaction_provider.dart';
import '../../../../features/trans/data/models/transaction_model.dart';

class ReportsPage extends ConsumerWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionsAsync = ref.watch(transactionListProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Financial Reports', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
      ),
      body: transactionsAsync.when(
        data: (transactions) => _buildBody(transactions),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err', style: const TextStyle(color: Colors.red))),
      ),
    );
  }

  Widget _buildBody(List<TransactionModel> transactions) {
    if (transactions.isEmpty) {
      return const Center(child: Text('No Data available for reports', style: TextStyle(color: Colors.grey)));
    }

    // Process Data
    double totalIncome = 0;
    double totalExpense = 0;
    for (var t in transactions) {
      if (t.type == TransactionType.income) totalIncome += t.amount;
      if (t.type == TransactionType.expense) totalExpense += t.amount;
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSummaryCards(totalIncome, totalExpense),
          const SizedBox(height: 32),
          const Text('Income vs Expense', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _buildBarChart(totalIncome, totalExpense),
          const SizedBox(height: 32),
          const Text('Detailed Activity', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _buildTransactionList(transactions),
        ],
      ),
    );
  }

  Widget _buildSummaryCards(double income, double expense) {
    return Row(
      children: [
        Expanded(child: _buildCard('Income', income, const Color(0xFFC6FF00), Icons.arrow_upward)),
        const SizedBox(width: 16),
        Expanded(child: _buildCard('Expense', expense, const Color(0xFFFF5252), Icons.arrow_downward)),
      ],
    );
  }

  Widget _buildCard(String title, double amount, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(color: Colors.grey)),
              Icon(icon, color: color, size: 20),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            NumberFormat.compactSimpleCurrency(name: 'LKR').format(amount),
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildBarChart(double income, double expense) {
    final maxY = (income > expense ? income : expense) * 1.2;
    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          gridData: const FlGridData(show: false),
          titlesData: FlTitlesData(
            leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  if (value.toInt() == 0) return const Padding(padding: EdgeInsets.only(top: 8), child: Text('Income', style: TextStyle(color: Colors.grey)));
                  if (value.toInt() == 1) return const Padding(padding: EdgeInsets.only(top: 8), child: Text('Expense', style: TextStyle(color: Colors.grey)));
                  return const Text('');
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          barGroups: [
            BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: income, color: const Color(0xFFC6FF00), width: 40, borderRadius: BorderRadius.circular(4))]),
            BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: expense, color: const Color(0xFFFF5252), width: 40, borderRadius: BorderRadius.circular(4))]),
          ],
          maxY: maxY == 0 ? 100 : maxY,
        ),
      ),
    );
  }

  Widget _buildTransactionList(List<TransactionModel> transactions) {
    // Sort by date descending
    final sorted = List<TransactionModel>.from(transactions)..sort((a, b) => b.date.compareTo(a.date));
    
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: sorted.length,
      itemBuilder: (context, index) {
        final t = sorted[index];
        final isIncome = t.type == TransactionType.income;
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            backgroundColor: const Color(0xFF1E1E1E),
            child: Icon(
              isIncome ? Icons.arrow_upward : Icons.arrow_downward, 
              color: isIncome ? const Color(0xFFC6FF00) : const Color(0xFFFF5252),
              size: 20,
            ),
          ),
          title: Text(t.category, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          subtitle: Text('${DateFormat('MMM d').format(t.date)} • ${t.note}', style: const TextStyle(color: Colors.grey, fontSize: 12)),
          trailing: Text(
            NumberFormat.simpleCurrency(name: 'LKR ', decimalDigits: 0).format(t.amount),
            style: TextStyle(color: isIncome ? const Color(0xFFC6FF00) : const Color(0xFFFF5252), fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}
