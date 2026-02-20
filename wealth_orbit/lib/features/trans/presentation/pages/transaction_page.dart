import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';
import '../../data/models/transaction_model.dart';
import '../providers/transaction_provider.dart';
import '../widgets/add_transaction_sheet.dart';

class TransactionPage extends ConsumerWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionsAsync = ref.watch(transactionListProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Wallet History', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),
      body: transactionsAsync.when(
        data: (transactions) {
          if (transactions.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Container(
                     padding: const EdgeInsets.all(32),
                     decoration: BoxDecoration(color: const Color(0xFF1E1E1E), borderRadius: BorderRadius.circular(100)),
                     child: const Icon(Icons.receipt_long, size: 64, color: Colors.grey),
                   ),
                   const SizedBox(height: 24),
                   const Text('No transactions yet', style: TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold)),
                   const SizedBox(height: 8),
                   const Text('Tap the + button to add one', style: TextStyle(color: Colors.grey)),
                ],
              ),
            );
          }
           
          // Sort descending
          final sorted = List<TransactionModel>.from(transactions)..sort((a, b) => b.date.compareTo(a.date));
          
          // Group by Month/Year
          final grouped = groupBy(sorted, (t) {
            return DateTime(t.date.year, t.date.month);
          });
          
          final groupKeys = grouped.keys.toList();

          return ListView.builder(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 100),
            itemCount: groupKeys.length,
            itemBuilder: (context, groupIndex) {
              final monthDate = groupKeys[groupIndex];
              final monthTransactions = grouped[monthDate]!;
              
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      DateFormat('MMMM yyyy').format(monthDate).toUpperCase(),
                      style: const TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.bold, letterSpacing: 1.2),
                    ),
                  ),
                  ...monthTransactions.map((transaction) {
                    final isIncome = transaction.type == TransactionType.income;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Dismissible(
                        key: ValueKey(transaction.id),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(color: Colors.red.withOpacity(0.2), borderRadius: BorderRadius.circular(20)),
                          child: const Icon(Icons.delete, color: Colors.red),
                        ),
                        onDismissed: (_) {
                          ref.read(transactionNotifierProvider.notifier).deleteTransaction(transaction.id);
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Transaction deleted', style: TextStyle(color: Colors.white)), backgroundColor: Color(0xFF1E1E1E)));
                        },
                        child: Container(
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
                                    Text(transaction.category, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                                    const SizedBox(height: 6),
                                    Text(transaction.note, 
                                      style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(DateFormat('MMMM d, y • h:mm a').format(transaction.date), style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '${isIncome ? '+' : '-'} ${NumberFormat.simpleCurrency(name: 'LKR ', decimalDigits: 2).format(transaction.amount)}',
                                style: TextStyle(
                                  color: isIncome ? const Color(0xFFC6FF00) : const Color(0xFFFF5252),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ],
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator(color: Color(0xFFC6FF00))),
        error: (err, stack) => Center(child: Text('Error: $err', style: const TextStyle(color: Colors.red))),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: const Color(0xFF1E1E1E),
            builder: (context) => const AddTransactionSheet(),
          );
        },
        backgroundColor: const Color(0xFFC6FF00),
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
