import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
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
        title: const Text('Wallet History', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: transactionsAsync.when(
        data: (transactions) {
          if (transactions.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Container(
                     padding: const EdgeInsets.all(24),
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

          return ListView.separated(
            padding: const EdgeInsets.only(bottom: 80),
            itemCount: sorted.length,
            separatorBuilder: (_, __) => Divider(color: Colors.grey.shade900),
            itemBuilder: (context, index) {
              final transaction = sorted[index];
              final isIncome = transaction.type == TransactionType.income;
              return Dismissible(
                key: ValueKey(transaction.id),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red, 
                  alignment: Alignment.centerRight, 
                  padding: const EdgeInsets.only(right: 20), 
                  child: const Icon(Icons.delete, color: Colors.white)
                ),
                onDismissed: (_) {
                  ref.read(transactionNotifierProvider.notifier).deleteTransaction(transaction.id);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Transaction deleted')));
                },
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: isIncome ? const Color(0xFFC6FF00).withOpacity(0.2) : const Color(0xFFFF5252).withOpacity(0.2),
                    child: Icon(
                      isIncome ? Icons.arrow_upward : Icons.arrow_downward,
                      color: isIncome ? const Color(0xFFC6FF00) : const Color(0xFFFF5252),
                    ),
                  ),
                  title: Text(transaction.category, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  subtitle: Text('${DateFormat('MMM d').format(transaction.date)} • ${transaction.note}', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  trailing: Text(
                    '${isIncome ? '+' : '-'} ${NumberFormat.simpleCurrency(name: 'LKR ', decimalDigits: 0).format(transaction.amount)}',
                    style: TextStyle(
                      color: isIncome ? const Color(0xFFC6FF00) : const Color(0xFFFF5252),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
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
