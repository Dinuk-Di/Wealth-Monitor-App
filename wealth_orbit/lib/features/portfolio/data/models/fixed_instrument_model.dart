import 'package:isar/isar.dart';

part 'fixed_instrument_model.g.dart';

@collection
class FixedInstrumentModel {
  Id id = Isar.autoIncrement;

  late String name;

  late String institution;

  late double principalAmount;

  late double interestRate;

  late DateTime startDate;

  late DateTime maturityDate;

  @Enumerated(EnumType.name)
  late FixedInstrumentType type;

  bool get isMatured => DateTime.now().isAfter(maturityDate);
}

enum FixedInstrumentType {
  fixedDeposit,
  treasuryBond,
  treasuryBill,
  unitTrust,
}
