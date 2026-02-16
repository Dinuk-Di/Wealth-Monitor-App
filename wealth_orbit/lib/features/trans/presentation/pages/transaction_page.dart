import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.wallet, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text('Transactions Module', style: TextStyle(color: Colors.white, fontSize: 24)),
            SizedBox(height: 8),
            Text('Income & Expense tracking coming soon.', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFFC6FF00),
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
