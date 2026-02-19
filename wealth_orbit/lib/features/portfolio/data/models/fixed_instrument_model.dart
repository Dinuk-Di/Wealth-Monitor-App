import 'package:isar/isar.dart';

part 'fixed_instrument_model.g.dart';

@collection
class FixedInstrumentModel {
  Id id = Isar.autoIncrement;

  late String name; // e.g. "HNB FD - 12 Months"

  late String institution; // From "Where" column

  late double principalAmount; // "Added to Equity"

  late double interestRate; // Annual Rate %

  late DateTime startDate;

  late DateTime maturityDate;

  bool isAutoRenewal = false;

  @Enumerated(EnumType.name)
  late FixedInstrumentType type;

  bool get isMatured => DateTime.now().isAfter(maturityDate);

  // Estimation
  @ignore
  double get estimatedInterest => (principalAmount * (interestRate / 100) * (maturityDate.difference(startDate).inDays / 365));
}

enum FixedInstrumentType {
  fixedDeposit,
  treasuryBill, // 3M, 6M, 12M
  treasuryBond, // > 1 Year
  unitTrust,
  realEstate, // For "Overseas Real" type
  other,
}
