import 'package:isar/isar.dart';

part 'transaction_model.g.dart';

@collection
class TransactionModel {
  Id id = Isar.autoIncrement;

  late double amount;

  @Enumerated(EnumType.name)
  late TransactionType type;

  late String category;

  late DateTime date;

  String? note;
}

enum TransactionType {
  income,
  expense,
}
