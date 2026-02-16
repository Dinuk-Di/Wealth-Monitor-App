import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../../features/trans/data/models/transaction_model.dart';
import '../../features/portfolio/data/models/stock_position_model.dart';
import '../../features/portfolio/data/models/fixed_instrument_model.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDb();
  }

  Future<Isar> openDb() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [
          TransactionModelSchema,
          StockPositionModelSchema,
          FixedInstrumentModelSchema,
        ],
        directory: dir.path,
        inspector: true,
      );
    }
    return Future.value(Isar.getInstance());
  }
}
