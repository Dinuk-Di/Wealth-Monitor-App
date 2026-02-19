import '../../data/models/transaction_model.dart';

abstract class TransactionRepository {
  Future<void> addTransaction(TransactionModel transaction);
  Future<void> deleteTransaction(int id);
  Future<List<TransactionModel>> getTransactions();
  Stream<List<TransactionModel>> watchTransactions();
}
