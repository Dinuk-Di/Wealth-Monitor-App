
import '../../data/models/fixed_instrument_model.dart';
import '../../data/models/stock_position_model.dart';

abstract class PortfolioRepository {
  // Stocks
  Future<void> addStockPosition(StockPositionModel stock);
  Future<void> updateStockPosition(StockPositionModel stock);
  Future<void> deleteStockPosition(int id);
  Stream<List<StockPositionModel>> watchStockPositions();
  
  // Fixed Instruments (FD, TBills, Real Estate)
  Future<void> addFixedInstrument(FixedInstrumentModel instrument);
  Future<void> updateFixedInstrument(FixedInstrumentModel instrument);
  Future<void> deleteFixedInstrument(int id);
  Stream<List<FixedInstrumentModel>> watchFixedInstruments();

  // Metrics
  Future<double> getTotalNetWorth();
}
