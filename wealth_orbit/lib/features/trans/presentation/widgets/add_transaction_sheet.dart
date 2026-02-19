import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/transaction_model.dart';
import '../providers/transaction_provider.dart';

class AddTransactionSheet extends ConsumerStatefulWidget {
  const AddTransactionSheet({super.key});

  @override
  ConsumerState<AddTransactionSheet> createState() => _AddTransactionSheetState();
}

class _AddTransactionSheetState extends ConsumerState<AddTransactionSheet> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _noteController = TextEditingController();
  TransactionType _type = TransactionType.expense;
  DateTime _date = DateTime.now();
  String _selectedCategory = 'Food';

  final List<String> _expenseCategories = ['Food', 'Transport', 'Shopping', 'Bills', 'Entertainment', 'Health', 'Other'];
  final List<String> _incomeCategories = ['Salary', 'Freelance', 'Dividends', 'Interest', 'Gift', 'Other'];

  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      final amount = double.tryParse(_amountController.text);
      if (amount == null) return;

      final transaction = TransactionModel()
        ..amount = amount
        ..type = _type
        ..date = _date
        ..note = _noteController.text.isNotEmpty ? _noteController.text : 'No Note'
        ..category = _selectedCategory;

      await ref.read(transactionNotifierProvider.notifier).addTransaction(transaction);
      if (mounted) Navigator.pop(context);
    }
  }

  void _addAmount(int value) {
    double current = double.tryParse(_amountController.text) ?? 0;
    _amountController.text = (current + value).toStringAsFixed(0);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final categories = _type == TransactionType.expense ? _expenseCategories : _incomeCategories;
    
    // Ensure selected category is valid for type
    if (!categories.contains(_selectedCategory)) {
        _selectedCategory = categories.first;
    }

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Add Transaction', style: theme.textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              // Type Selector
              SegmentedButton<TransactionType>(
                segments: const [
                  ButtonSegment(value: TransactionType.expense, label: Text('Expense'), icon: Icon(Icons.arrow_downward)),
                  ButtonSegment(value: TransactionType.income, label: Text('Income'), icon: Icon(Icons.arrow_upward)),
                ],
                selected: {_type},
                onSelectionChanged: (Set<TransactionType> newSelection) {
                  setState(() {
                    _type = newSelection.first;
                    _selectedCategory = _type == TransactionType.expense ? _expenseCategories.first : _incomeCategories.first;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.selected)) {
                       return _type == TransactionType.income ? const Color(0xFFC6FF00) : const Color(0xFFFF5252);
                    }
                    return Colors.grey[900];
                  }),
                  foregroundColor: MaterialStateProperty.resolveWith((states) {
                     if (states.contains(MaterialState.selected)) return Colors.black;
                     return Colors.white;
                  }),
                ),
              ),
              const SizedBox(height: 16),
              
              // Quick Amounts
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [100, 500, 1000, 5000].map((amount) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ActionChip(
                        label: Text('+$amount'),
                        backgroundColor: const Color(0xFF1E1E1E),
                        labelStyle: const TextStyle(color: Colors.white),
                        side: BorderSide(color: Colors.grey.shade800),
                        onPressed: () => _addAmount(amount),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 8),

              // Amount Field
              TextFormField(
                controller: _amountController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  labelText: 'Amount',
                  labelStyle: const TextStyle(color: Colors.grey),
                  prefixText: 'LKR ',
                  prefixStyle: const TextStyle(color: Colors.grey, fontSize: 24),
                  enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: _type == TransactionType.income ? const Color(0xFFC6FF00) : const Color(0xFFFF5252))),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Please enter amount';
                  if (double.tryParse(value) == null) return 'Invalid number';
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Category Selector
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                dropdownColor: const Color(0xFF1E1E1E),
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Category',
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                ),
                items: categories.map((cat) {
                    return DropdownMenuItem(value: cat, child: Text(cat));
                }).toList(),
                onChanged: (val) => setState(() => _selectedCategory = val!),
              ),
              const SizedBox(height: 16),

              // Note Field
              TextFormField(
                controller: _noteController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Note (Optional)',
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 16),

              // Date Picker Button
              OutlinedButton.icon(
                onPressed: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _date,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData.dark().copyWith(
                           colorScheme: const ColorScheme.dark(
                             primary: Color(0xFFC6FF00),
                             onPrimary: Colors.black,
                             surface: Color(0xFF1E1E1E),
                             onSurface: Colors.white,
                           ),
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (picked != null) setState(() => _date = picked);
                },
                icon: const Icon(Icons.calendar_today, color: Colors.grey),
                label: Text('${_date.year}-${_date.month}-${_date.day}', style: const TextStyle(color: Colors.white)),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.grey),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _type == TransactionType.income ? const Color(0xFFC6FF00) : const Color(0xFFFF5252),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('SAVE TRANSACTION', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
