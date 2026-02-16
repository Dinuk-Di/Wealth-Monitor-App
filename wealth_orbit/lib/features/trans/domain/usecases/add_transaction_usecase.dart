import '../entities/transaction_entity.dart';
import '../repositories/transaction_repository.dart';

class AddTransactionUseCase {
  final TransactionRepository repository;

  AddTransactionUseCase(this.repository);

  Future<void> execute(TransactionEntity transaction) async {
    await repository.addTransaction(transaction);
  }
}
