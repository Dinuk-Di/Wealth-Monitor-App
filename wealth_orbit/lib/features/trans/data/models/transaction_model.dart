import 'package:isar/isar.dart';

part 'transaction_model.g.dart';

@collection
class TransactionModel {
  Id id = Isar.autoIncrement;

  late double amount;

  late DateTime date;

  late String note;

  @Enumerated(EnumType.name)
  late TransactionType type;

  late String category;
}

enum TransactionType {
  income,
  expense,
}
