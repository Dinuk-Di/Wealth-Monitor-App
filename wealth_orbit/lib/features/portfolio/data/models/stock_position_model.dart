import 'package:isar/isar.dart';

part 'stock_position_model.g.dart';

@collection
class StockPositionModel {
  Id id = Isar.autoIncrement;

  late String symbol;

  late double totalQuantity;

  late double averagePrice;

  @ignore
  double get totalInvested => totalQuantity * averagePrice;

  late DateTime lastUpdated;
}
