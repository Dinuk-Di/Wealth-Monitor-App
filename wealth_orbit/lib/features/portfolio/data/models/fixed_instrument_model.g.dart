// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fixed_instrument_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFixedInstrumentModelCollection on Isar {
  IsarCollection<FixedInstrumentModel> get fixedInstrumentModels =>
      this.collection();
}

const FixedInstrumentModelSchema = CollectionSchema(
  name: r'FixedInstrumentModel',
  id: 1910360711149150405,
  properties: {
    r'institution': PropertySchema(
      id: 0,
      name: r'institution',
      type: IsarType.string,
    ),
    r'interestRate': PropertySchema(
      id: 1,
      name: r'interestRate',
      type: IsarType.double,
    ),
    r'isMatured': PropertySchema(
      id: 2,
      name: r'isMatured',
      type: IsarType.bool,
    ),
    r'maturityDate': PropertySchema(
      id: 3,
      name: r'maturityDate',
      type: IsarType.dateTime,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'principalAmount': PropertySchema(
      id: 5,
      name: r'principalAmount',
      type: IsarType.double,
    ),
    r'startDate': PropertySchema(
      id: 6,
      name: r'startDate',
      type: IsarType.dateTime,
    ),
    r'type': PropertySchema(
      id: 7,
      name: r'type',
      type: IsarType.string,
      enumMap: _FixedInstrumentModeltypeEnumValueMap,
    )
  },
  estimateSize: _fixedInstrumentModelEstimateSize,
  serialize: _fixedInstrumentModelSerialize,
  deserialize: _fixedInstrumentModelDeserialize,
  deserializeProp: _fixedInstrumentModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _fixedInstrumentModelGetId,
  getLinks: _fixedInstrumentModelGetLinks,
  attach: _fixedInstrumentModelAttach,
  version: '3.1.0+1',
);

int _fixedInstrumentModelEstimateSize(
  FixedInstrumentModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.institution.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.type.name.length * 3;
  return bytesCount;
}

void _fixedInstrumentModelSerialize(
  FixedInstrumentModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.institution);
  writer.writeDouble(offsets[1], object.interestRate);
  writer.writeBool(offsets[2], object.isMatured);
  writer.writeDateTime(offsets[3], object.maturityDate);
  writer.writeString(offsets[4], object.name);
  writer.writeDouble(offsets[5], object.principalAmount);
  writer.writeDateTime(offsets[6], object.startDate);
  writer.writeString(offsets[7], object.type.name);
}

FixedInstrumentModel _fixedInstrumentModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FixedInstrumentModel();
  object.id = id;
  object.institution = reader.readString(offsets[0]);
  object.interestRate = reader.readDouble(offsets[1]);
  object.maturityDate = reader.readDateTime(offsets[3]);
  object.name = reader.readString(offsets[4]);
  object.principalAmount = reader.readDouble(offsets[5]);
  object.startDate = reader.readDateTime(offsets[6]);
  object.type = _FixedInstrumentModeltypeValueEnumMap[
          reader.readStringOrNull(offsets[7])] ??
      FixedInstrumentType.fixedDeposit;
  return object;
}

P _fixedInstrumentModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (_FixedInstrumentModeltypeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          FixedInstrumentType.fixedDeposit) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _FixedInstrumentModeltypeEnumValueMap = {
  r'fixedDeposit': r'fixedDeposit',
  r'treasuryBond': r'treasuryBond',
  r'treasuryBill': r'treasuryBill',
  r'unitTrust': r'unitTrust',
};
const _FixedInstrumentModeltypeValueEnumMap = {
  r'fixedDeposit': FixedInstrumentType.fixedDeposit,
  r'treasuryBond': FixedInstrumentType.treasuryBond,
  r'treasuryBill': FixedInstrumentType.treasuryBill,
  r'unitTrust': FixedInstrumentType.unitTrust,
};

Id _fixedInstrumentModelGetId(FixedInstrumentModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _fixedInstrumentModelGetLinks(
    FixedInstrumentModel object) {
  return [];
}

void _fixedInstrumentModelAttach(
    IsarCollection<dynamic> col, Id id, FixedInstrumentModel object) {
  object.id = id;
}

extension FixedInstrumentModelQueryWhereSort
    on QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QWhere> {
  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FixedInstrumentModelQueryWhere
    on QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QWhereClause> {
  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FixedInstrumentModelQueryFilter on QueryBuilder<FixedInstrumentModel,
    FixedInstrumentModel, QFilterCondition> {
  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> institutionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'institution',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> institutionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'institution',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> institutionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'institution',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> institutionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'institution',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> institutionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'institution',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> institutionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'institution',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
          QAfterFilterCondition>
      institutionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'institution',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
          QAfterFilterCondition>
      institutionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'institution',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> institutionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'institution',
        value: '',
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> institutionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'institution',
        value: '',
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> interestRateEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'interestRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> interestRateGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'interestRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> interestRateLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'interestRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> interestRateBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'interestRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> isMaturedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isMatured',
        value: value,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> maturityDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maturityDate',
        value: value,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> maturityDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maturityDate',
        value: value,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> maturityDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maturityDate',
        value: value,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> maturityDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maturityDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
          QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
          QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> principalAmountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'principalAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> principalAmountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'principalAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> principalAmountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'principalAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> principalAmountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'principalAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> startDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> startDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> startDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> startDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> typeEqualTo(
    FixedInstrumentType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> typeGreaterThan(
    FixedInstrumentType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> typeLessThan(
    FixedInstrumentType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> typeBetween(
    FixedInstrumentType lower,
    FixedInstrumentType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
          QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
          QAfterFilterCondition>
      typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel,
      QAfterFilterCondition> typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }
}

extension FixedInstrumentModelQueryObject on QueryBuilder<FixedInstrumentModel,
    FixedInstrumentModel, QFilterCondition> {}

extension FixedInstrumentModelQueryLinks on QueryBuilder<FixedInstrumentModel,
    FixedInstrumentModel, QFilterCondition> {}

extension FixedInstrumentModelQuerySortBy
    on QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QSortBy> {
  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterSortBy>
      sortByInstitution() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'institution', Sort.asc);
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterSortBy>
      sortByInstitutionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'institution', Sort.desc);
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterSortBy>
      sortByInterestRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interestRate', Sort.asc);
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterSortBy>
      sortByInterestRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interestRate', Sort.desc);
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterSortBy>
      sortByIsMatured() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMatured', Sort.asc);
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterSortBy>
      sortByIsMaturedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMatured', Sort.desc);
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterSortBy>
      sortByMaturityDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maturityDate', Sort.asc);
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterSortBy>
      sortByMaturityDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maturityDate', Sort.desc);
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterSortBy>
      sortByPrincipalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'principalAmount', Sort.asc);
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterSortBy>
      sortByPrincipalAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'principalAmount', Sort.desc);
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterSortBy>
      sortByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterSortBy>
      sortByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterSortBy>
      sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension FixedInstrumentModelQuerySortThenBy
    on QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QSortThenBy> {
  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterSortBy>
      thenByInstitution() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'institution', Sort.asc);
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterSortBy>
      thenByInstitutionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'institution', Sort.desc);
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterSortBy>
      thenByInterestRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interestRate', Sort.asc);
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterSortBy>
      thenByInterestRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interestRate', Sort.desc);
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterSortBy>
      thenByIsMatured() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMatured', Sort.asc);
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterSortBy>
      thenByIsMaturedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMatured', Sort.desc);
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterSortBy>
      thenByMaturityDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maturityDate', Sort.asc);
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterSortBy>
      thenByMaturityDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maturityDate', Sort.desc);
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterSortBy>
      thenByPrincipalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'principalAmount', Sort.asc);
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterSortBy>
      thenByPrincipalAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'principalAmount', Sort.desc);
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterSortBy>
      thenByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterSortBy>
      thenByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterSortBy>
      thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension FixedInstrumentModelQueryWhereDistinct
    on QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QDistinct> {
  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QDistinct>
      distinctByInstitution({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'institution', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QDistinct>
      distinctByInterestRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'interestRate');
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QDistinct>
      distinctByIsMatured() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isMatured');
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QDistinct>
      distinctByMaturityDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maturityDate');
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QDistinct>
      distinctByPrincipalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'principalAmount');
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QDistinct>
      distinctByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startDate');
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentModel, QDistinct>
      distinctByType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }
}

extension FixedInstrumentModelQueryProperty on QueryBuilder<
    FixedInstrumentModel, FixedInstrumentModel, QQueryProperty> {
  QueryBuilder<FixedInstrumentModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FixedInstrumentModel, String, QQueryOperations>
      institutionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'institution');
    });
  }

  QueryBuilder<FixedInstrumentModel, double, QQueryOperations>
      interestRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'interestRate');
    });
  }

  QueryBuilder<FixedInstrumentModel, bool, QQueryOperations>
      isMaturedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isMatured');
    });
  }

  QueryBuilder<FixedInstrumentModel, DateTime, QQueryOperations>
      maturityDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maturityDate');
    });
  }

  QueryBuilder<FixedInstrumentModel, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<FixedInstrumentModel, double, QQueryOperations>
      principalAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'principalAmount');
    });
  }

  QueryBuilder<FixedInstrumentModel, DateTime, QQueryOperations>
      startDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startDate');
    });
  }

  QueryBuilder<FixedInstrumentModel, FixedInstrumentType, QQueryOperations>
      typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}
