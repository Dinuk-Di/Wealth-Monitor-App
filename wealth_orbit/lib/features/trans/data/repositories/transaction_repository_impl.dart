import 'package:isar/isar.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../../data/models/transaction_model.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final Isar _isar;

  TransactionRepositoryImpl(this._isar);

  @override
  Future<void> addTransaction(TransactionModel transaction) async {
    await _isar.writeTxn(() async {
      await _isar.transactionModels.put(transaction);
    });
  }

  @override
  Future<void> deleteTransaction(int id) async {
    await _isar.writeTxn(() async {
      await _isar.transactionModels.delete(id);
    });
  }

  @override
  Future<List<TransactionModel>> getTransactions() async {
    return await _isar.transactionModels.where().sortByDateDesc().findAll();
  }

  @override
  Stream<List<TransactionModel>> watchTransactions() {
    return _isar.transactionModels.where().sortByDateDesc().watch(fireImmediately: true);
  }
}
