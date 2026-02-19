
import 'package:isar/isar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/portfolio_repository.dart';
import '../../data/models/fixed_instrument_model.dart';
import '../../data/models/stock_position_model.dart';


class PortfolioRepositoryImpl implements PortfolioRepository {
  final Isar _isar;

  PortfolioRepositoryImpl(this._isar);

  // --- Stocks ---
  @override
  Future<void> addStockPosition(StockPositionModel stock) async {
    await _isar.writeTxn(() async {
      await _isar.stockPositionModels.put(stock);
    });
  }

  @override
  Future<void> updateStockPosition(StockPositionModel stock) async {
     await _isar.writeTxn(() async {
      await _isar.stockPositionModels.put(stock);
    });
  }

  @override
  Future<void> deleteStockPosition(int id) async {
    await _isar.writeTxn(() async {
      await _isar.stockPositionModels.delete(id);
    });
  }

  @override
  Stream<List<StockPositionModel>> watchStockPositions() {
    return _isar.stockPositionModels.where().watch(fireImmediately: true);
  }

  // --- Fixed Instruments ---
  @override
  Future<void> addFixedInstrument(FixedInstrumentModel instrument) async {
    await _isar.writeTxn(() async {
      await _isar.fixedInstrumentModels.put(instrument);
    });
  }

  @override
  Future<void> updateFixedInstrument(FixedInstrumentModel instrument) async {
    await _isar.writeTxn(() async {
      await _isar.fixedInstrumentModels.put(instrument);
    });
  }

  @override
  Future<void> deleteFixedInstrument(int id) async {
    await _isar.writeTxn(() async {
      await _isar.fixedInstrumentModels.delete(id);
    });
  }

  @override
  Stream<List<FixedInstrumentModel>> watchFixedInstruments() {
    return _isar.fixedInstrumentModels.where().watch(fireImmediately: true);
  }

  // --- Metrics ---
  @override
  Future<double> getTotalNetWorth() async {
     final stocks = await _isar.stockPositionModels.where().findAll();
     final fixed = await _isar.fixedInstrumentModels.where().findAll();

     double stockTotal = stocks.fold(0, (sum, item) => sum + item.currentValue);
     double fixedTotal = fixed.fold(0, (sum, item) => sum + item.principalAmount); // Simplified: Principal only

     return stockTotal + fixedTotal;
  }
}
