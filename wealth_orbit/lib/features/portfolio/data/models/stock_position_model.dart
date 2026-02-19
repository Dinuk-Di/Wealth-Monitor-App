import 'package:isar/isar.dart';

part 'stock_position_model.g.dart';

@collection
class StockPositionModel {
  Id id = Isar.autoIncrement;

  late String symbol; // Ticker (e.g. TEEJ)

  late String companyName; // From "Investments" column

  late String broker; // From "Where" column (e.g. CAL)

  late double totalQuantity;

  late double averagePrice;

  late double currentPrice; // For real-time valuation

  late String sector; // e.g. Manufacturing, Banking

  @ignore
  double get totalInvested => totalQuantity * averagePrice;

  @ignore
  double get currentValue => totalQuantity * currentPrice;

  @ignore
  double get unrealizedProfit => currentValue - totalInvested;

  @ignore
  double get profitPercentage => totalInvested == 0 ? 0 : (unrealizedProfit / totalInvested) * 100;

  late DateTime lastUpdated;
}
