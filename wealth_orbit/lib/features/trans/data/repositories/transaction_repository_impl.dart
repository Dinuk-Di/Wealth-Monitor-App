import '../../domain/entities/transaction_entity.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../datasources/transaction_local_data_source.dart';
import '../models/transaction_model.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionLocalDataSource localDataSource;

  TransactionRepositoryImpl(this.localDataSource);

  @override
  Future<void> addTransaction(TransactionEntity transaction) async {
    final model = TransactionModel()
      ..amount = transaction.amount
      ..category = transaction.category
      ..date = transaction.date
      ..type = TransactionType.values.firstWhere((e) => e.name == transaction.type)
      ..note = transaction.note;
    
    await localDataSource.addTransaction(model);
  }

  @override
  Future<List<TransactionEntity>> getTransactions() async {
    final models = await localDataSource.getTransactions();
    return models.map((model) => TransactionEntity(
      id: model.id,
      amount: model.amount,
      category: model.category,
      date: model.date,
      type: model.type.name,
      note: model.note,
    )).toList();
  }

  @override
  Future<void> deleteTransaction(int id) async {
    await localDataSource.deleteTransaction(id);
  }
}
