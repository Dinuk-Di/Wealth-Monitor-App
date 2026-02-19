
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wealth_orbit/features/portfolio/data/models/fixed_instrument_model.dart';
import 'package:wealth_orbit/features/portfolio/data/models/stock_position_model.dart';
import 'package:wealth_orbit/features/portfolio/data/repositories/portfolio_repository_impl.dart';
import 'package:wealth_orbit/features/portfolio/domain/repositories/portfolio_repository.dart';
import 'package:wealth_orbit/core/providers/isar_provider.dart';

part 'portfolio_provider.g.dart';

@riverpod
Future<PortfolioRepository> portfolioRepository(PortfolioRepositoryRef ref) async {
  final isar = await ref.watch(isarProvider.future);
  return PortfolioRepositoryImpl(isar);
}

// Stocks
@riverpod
Stream<List<StockPositionModel>> stockPositions(StockPositionsRef ref) async* {
  final repo = await ref.watch(portfolioRepositoryProvider.future);
  yield* repo.watchStockPositions();
}

// Fixed Instruments
@riverpod
Stream<List<FixedInstrumentModel>> fixedInstruments(FixedInstrumentsRef ref) async* {
    final repo = await ref.watch(portfolioRepositoryProvider.future);
    yield* repo.watchFixedInstruments();
}

// Net Worth
@riverpod
Future<double> totalNetWorth(TotalNetWorthRef ref) async {
  final repo = await ref.watch(portfolioRepositoryProvider.future);
  return repo.getTotalNetWorth();
}
