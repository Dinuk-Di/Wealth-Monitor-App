import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../../data/repositories/transaction_repository_impl.dart';
import '../../data/models/transaction_model.dart';
import '../../../../core/data/isar_service.dart';
import 'package:isar/isar.dart';

final isarServiceProvider = Provider<IsarService>((ref) {
  return IsarService();
});

final isarProvider = FutureProvider<Isar>((ref) async {
  final isarService = ref.watch(isarServiceProvider);
  return isarService.db;
});

final transactionRepositoryProvider = Provider<TransactionRepository>((ref) {
  // This is tricky because Repository needs Isar, but Isar is async.
  // We can make the repository methods async (which they are), but the constructor needs the instance.
  // Alternatively, we can use a FutureProvider for the repository.
  throw UnimplementedError('Provider overridden in UI or handled via FutureProvider');
});

// Let's use a class that awaits Isar internally or use a FutureProvider for the repo.
final transactionRepositoryFutureProvider = FutureProvider<TransactionRepository>((ref) async {
  final isar = await ref.watch(isarProvider.future);
  return TransactionRepositoryImpl(isar);
});

final transactionListProvider = StreamProvider<List<TransactionModel>>((ref) async* {
  final repository = await ref.watch(transactionRepositoryFutureProvider.future);
  yield* repository.watchTransactions();
});

// A notifier for adding/deleting that handles the async repository lookup
class TransactionNotifier extends StateNotifier<AsyncValue<void>> {
  final Ref ref;

  TransactionNotifier(this.ref) : super(const AsyncValue.data(null));

  Future<void> addTransaction(TransactionModel transaction) async {
    state = const AsyncValue.loading();
    try {
      final repository = await ref.read(transactionRepositoryFutureProvider.future);
      await repository.addTransaction(transaction);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> deleteTransaction(int id) async {
    state = const AsyncValue.loading();
    try {
      final repository = await ref.read(transactionRepositoryFutureProvider.future);
      await repository.deleteTransaction(id);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final transactionNotifierProvider = StateNotifierProvider<TransactionNotifier, AsyncValue<void>>((ref) {
  return TransactionNotifier(ref);
});
