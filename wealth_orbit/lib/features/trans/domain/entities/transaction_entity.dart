import 'package:equatable/equatable.dart';

class TransactionEntity extends Equatable {
  final int? id;
  final double amount;
  final String category;
  final DateTime date;
  final String type; // 'income' or 'expense'
  final String? note;

  const TransactionEntity({
    this.id,
    required this.amount,
    required this.category,
    required this.date,
    required this.type,
    this.note,
  });

  @override
  List<Object?> get props => [id, amount, category, date, type, note];
}
