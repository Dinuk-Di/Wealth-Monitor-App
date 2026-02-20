import 'package:isar/isar.dart';

part 'stock_position_model.g.dart';

@collection
class StockPositionModel {
  Id id = Isar.autoIncrement;

  late String symbol; // Ticker (e.g. TEEJ)

  late String companyName; // From "Investments" column

  late String broker; // From "Where" column (e.g. CAL)

  late double totalQuantity;

  late double averagePrice; // Bought Price

  late double currentPrice; // For real-time valuation

  late String sector; // e.g. Manufacturing, Banking

  late DateTime boughtDate;

  double boughtCommission = 0;

  double? soldPrice;

  DateTime? soldDate;

  double? soldCommission;

  String? comments;

  @Enumerated(EnumType.name)
  late StockStatus status;

  @ignore
  double get totalInvested => (totalQuantity * averagePrice) + boughtCommission;

  @ignore
  double get currentValue => totalQuantity * currentPrice;

  @ignore
  double get soldValue => (status == StockStatus.sold && soldPrice != null) 
      ? (totalQuantity * soldPrice!) - (soldCommission ?? 0) 
      : 0;

  @ignore
  double get realizedProfit => (status == StockStatus.sold) ? soldValue - totalInvested : 0;

  @ignore
  double get unrealizedProfit => (status == StockStatus.open) ? currentValue - totalInvested : 0;

  @ignore
  double get profitPercentage {
    if (totalInvested == 0) return 0;
    if (status == StockStatus.sold) {
      return (realizedProfit / totalInvested) * 100;
    } else {
      return (unrealizedProfit / totalInvested) * 100;
    }
  }

  late DateTime lastUpdated;
}

enum StockStatus {
  open,
  sold,
}
