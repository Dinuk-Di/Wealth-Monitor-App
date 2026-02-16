import 'package:isar/isar.dart';
import '../../../../core/data/isar_service.dart';
import '../models/transaction_model.dart';

abstract class TransactionLocalDataSource {
  Future<void> addTransaction(TransactionModel transaction);
  Future<List<TransactionModel>> getTransactions();
  Future<void> deleteTransaction(int id);
}

class TransactionLocalDataSourceImpl implements TransactionLocalDataSource {
  final IsarService isarService;

  TransactionLocalDataSourceImpl(this.isarService);

  @override
  Future<void> addTransaction(TransactionModel transaction) async {
    final isar = await isarService.db;
    await isar.writeTxn(() async {
      await isar.transactionModels.put(transaction);
    });
  }

  @override
  Future<List<TransactionModel>> getTransactions() async {
    final isar = await isarService.db;
    return await isar.transactionModels.where().findAll();
  }

  @override
  Future<void> deleteTransaction(int id) async {
    final isar = await isarService.db;
    await isar.writeTxn(() async {
      await isar.transactionModels.delete(id);
    });
  }
}
