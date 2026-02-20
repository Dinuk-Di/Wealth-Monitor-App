// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_position_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetStockPositionModelCollection on Isar {
  IsarCollection<StockPositionModel> get stockPositionModels =>
      this.collection();
}

const StockPositionModelSchema = CollectionSchema(
  name: r'StockPositionModel',
  id: 6454548489272027225,
  properties: {
    r'averagePrice': PropertySchema(
      id: 0,
      name: r'averagePrice',
      type: IsarType.double,
    ),
    r'boughtCommission': PropertySchema(
      id: 1,
      name: r'boughtCommission',
      type: IsarType.double,
    ),
    r'boughtDate': PropertySchema(
      id: 2,
      name: r'boughtDate',
      type: IsarType.dateTime,
    ),
    r'broker': PropertySchema(
      id: 3,
      name: r'broker',
      type: IsarType.string,
    ),
    r'comments': PropertySchema(
      id: 4,
      name: r'comments',
      type: IsarType.string,
    ),
    r'companyName': PropertySchema(
      id: 5,
      name: r'companyName',
      type: IsarType.string,
    ),
    r'currentPrice': PropertySchema(
      id: 6,
      name: r'currentPrice',
      type: IsarType.double,
    ),
    r'lastUpdated': PropertySchema(
      id: 7,
      name: r'lastUpdated',
      type: IsarType.dateTime,
    ),
    r'sector': PropertySchema(
      id: 8,
      name: r'sector',
      type: IsarType.string,
    ),
    r'soldCommission': PropertySchema(
      id: 9,
      name: r'soldCommission',
      type: IsarType.double,
    ),
    r'soldDate': PropertySchema(
      id: 10,
      name: r'soldDate',
      type: IsarType.dateTime,
    ),
    r'soldPrice': PropertySchema(
      id: 11,
      name: r'soldPrice',
      type: IsarType.double,
    ),
    r'status': PropertySchema(
      id: 12,
      name: r'status',
      type: IsarType.string,
      enumMap: _StockPositionModelstatusEnumValueMap,
    ),
    r'symbol': PropertySchema(
      id: 13,
      name: r'symbol',
      type: IsarType.string,
    ),
    r'totalQuantity': PropertySchema(
      id: 14,
      name: r'totalQuantity',
      type: IsarType.double,
    )
  },
  estimateSize: _stockPositionModelEstimateSize,
  serialize: _stockPositionModelSerialize,
  deserialize: _stockPositionModelDeserialize,
  deserializeProp: _stockPositionModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _stockPositionModelGetId,
  getLinks: _stockPositionModelGetLinks,
  attach: _stockPositionModelAttach,
  version: '3.1.0+1',
);

int _stockPositionModelEstimateSize(
  StockPositionModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.broker.length * 3;
  {
    final value = object.comments;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.companyName.length * 3;
  bytesCount += 3 + object.sector.length * 3;
  bytesCount += 3 + object.status.name.length * 3;
  bytesCount += 3 + object.symbol.length * 3;
  return bytesCount;
}

void _stockPositionModelSerialize(
  StockPositionModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.averagePrice);
  writer.writeDouble(offsets[1], object.boughtCommission);
  writer.writeDateTime(offsets[2], object.boughtDate);
  writer.writeString(offsets[3], object.broker);
  writer.writeString(offsets[4], object.comments);
  writer.writeString(offsets[5], object.companyName);
  writer.writeDouble(offsets[6], object.currentPrice);
  writer.writeDateTime(offsets[7], object.lastUpdated);
  writer.writeString(offsets[8], object.sector);
  writer.writeDouble(offsets[9], object.soldCommission);
  writer.writeDateTime(offsets[10], object.soldDate);
  writer.writeDouble(offsets[11], object.soldPrice);
  writer.writeString(offsets[12], object.status.name);
  writer.writeString(offsets[13], object.symbol);
  writer.writeDouble(offsets[14], object.totalQuantity);
}

StockPositionModel _stockPositionModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StockPositionModel();
  object.averagePrice = reader.readDouble(offsets[0]);
  object.boughtCommission = reader.readDouble(offsets[1]);
  object.boughtDate = reader.readDateTime(offsets[2]);
  object.broker = reader.readString(offsets[3]);
  object.comments = reader.readStringOrNull(offsets[4]);
  object.companyName = reader.readString(offsets[5]);
  object.currentPrice = reader.readDouble(offsets[6]);
  object.id = id;
  object.lastUpdated = reader.readDateTime(offsets[7]);
  object.sector = reader.readString(offsets[8]);
  object.soldCommission = reader.readDoubleOrNull(offsets[9]);
  object.soldDate = reader.readDateTimeOrNull(offsets[10]);
  object.soldPrice = reader.readDoubleOrNull(offsets[11]);
  object.status = _StockPositionModelstatusValueEnumMap[
          reader.readStringOrNull(offsets[12])] ??
      StockStatus.open;
  object.symbol = reader.readString(offsets[13]);
  object.totalQuantity = reader.readDouble(offsets[14]);
  return object;
}

P _stockPositionModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readDoubleOrNull(offset)) as P;
    case 10:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 11:
      return (reader.readDoubleOrNull(offset)) as P;
    case 12:
      return (_StockPositionModelstatusValueEnumMap[
              reader.readStringOrNull(offset)] ??
          StockStatus.open) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _StockPositionModelstatusEnumValueMap = {
  r'open': r'open',
  r'sold': r'sold',
};
const _StockPositionModelstatusValueEnumMap = {
  r'open': StockStatus.open,
  r'sold': StockStatus.sold,
};

Id _stockPositionModelGetId(StockPositionModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _stockPositionModelGetLinks(
    StockPositionModel object) {
  return [];
}

void _stockPositionModelAttach(
    IsarCollection<dynamic> col, Id id, StockPositionModel object) {
  object.id = id;
}

extension StockPositionModelQueryWhereSort
    on QueryBuilder<StockPositionModel, StockPositionModel, QWhere> {
  QueryBuilder<StockPositionModel, StockPositionModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension StockPositionModelQueryWhere
    on QueryBuilder<StockPositionModel, StockPositionModel, QWhereClause> {
  QueryBuilder<StockPositionModel, StockPositionModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterWhereClause>
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

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterWhereClause>
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

extension StockPositionModelQueryFilter
    on QueryBuilder<StockPositionModel, StockPositionModel, QFilterCondition> {
  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      averagePriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'averagePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      averagePriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'averagePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      averagePriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'averagePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      averagePriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'averagePrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      boughtCommissionEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'boughtCommission',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      boughtCommissionGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'boughtCommission',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      boughtCommissionLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'boughtCommission',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      boughtCommissionBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'boughtCommission',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      boughtDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'boughtDate',
        value: value,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      boughtDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'boughtDate',
        value: value,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      boughtDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'boughtDate',
        value: value,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      boughtDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'boughtDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      brokerEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'broker',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      brokerGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'broker',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      brokerLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'broker',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      brokerBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'broker',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      brokerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'broker',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      brokerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'broker',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      brokerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'broker',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      brokerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'broker',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      brokerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'broker',
        value: '',
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      brokerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'broker',
        value: '',
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      commentsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'comments',
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      commentsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'comments',
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      commentsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      commentsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'comments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      commentsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'comments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      commentsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'comments',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      commentsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'comments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      commentsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'comments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      commentsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'comments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      commentsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'comments',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      commentsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comments',
        value: '',
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      commentsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'comments',
        value: '',
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      companyNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      companyNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'companyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      companyNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'companyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      companyNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'companyName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      companyNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'companyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      companyNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'companyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      companyNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'companyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      companyNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'companyName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      companyNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyName',
        value: '',
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      companyNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'companyName',
        value: '',
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      currentPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      currentPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      currentPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      currentPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      lastUpdatedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      lastUpdatedGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      lastUpdatedLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      lastUpdatedBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastUpdated',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      sectorEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sector',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      sectorGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sector',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      sectorLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sector',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      sectorBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sector',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      sectorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sector',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      sectorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sector',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      sectorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sector',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      sectorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sector',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      sectorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sector',
        value: '',
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      sectorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sector',
        value: '',
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      soldCommissionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'soldCommission',
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      soldCommissionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'soldCommission',
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      soldCommissionEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'soldCommission',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      soldCommissionGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'soldCommission',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      soldCommissionLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'soldCommission',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      soldCommissionBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'soldCommission',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      soldDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'soldDate',
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      soldDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'soldDate',
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      soldDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'soldDate',
        value: value,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      soldDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'soldDate',
        value: value,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      soldDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'soldDate',
        value: value,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      soldDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'soldDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      soldPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'soldPrice',
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      soldPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'soldPrice',
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      soldPriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'soldPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      soldPriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'soldPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      soldPriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'soldPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      soldPriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'soldPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      statusEqualTo(
    StockStatus value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      statusGreaterThan(
    StockStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      statusLessThan(
    StockStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      statusBetween(
    StockStatus lower,
    StockStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      symbolEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      symbolGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      symbolLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      symbolBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'symbol',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      symbolStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      symbolEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      symbolContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      symbolMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'symbol',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      symbolIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'symbol',
        value: '',
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      symbolIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'symbol',
        value: '',
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      totalQuantityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      totalQuantityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      totalQuantityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterFilterCondition>
      totalQuantityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension StockPositionModelQueryObject
    on QueryBuilder<StockPositionModel, StockPositionModel, QFilterCondition> {}

extension StockPositionModelQueryLinks
    on QueryBuilder<StockPositionModel, StockPositionModel, QFilterCondition> {}

extension StockPositionModelQuerySortBy
    on QueryBuilder<StockPositionModel, StockPositionModel, QSortBy> {
  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      sortByAveragePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averagePrice', Sort.asc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      sortByAveragePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averagePrice', Sort.desc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      sortByBoughtCommission() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'boughtCommission', Sort.asc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      sortByBoughtCommissionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'boughtCommission', Sort.desc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      sortByBoughtDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'boughtDate', Sort.asc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      sortByBoughtDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'boughtDate', Sort.desc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      sortByBroker() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'broker', Sort.asc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      sortByBrokerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'broker', Sort.desc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      sortByComments() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comments', Sort.asc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      sortByCommentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comments', Sort.desc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      sortByCompanyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyName', Sort.asc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      sortByCompanyNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyName', Sort.desc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      sortByCurrentPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentPrice', Sort.asc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      sortByCurrentPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentPrice', Sort.desc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      sortByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      sortByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      sortBySector() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.asc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      sortBySectorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.desc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      sortBySoldCommission() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soldCommission', Sort.asc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      sortBySoldCommissionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soldCommission', Sort.desc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      sortBySoldDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soldDate', Sort.asc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      sortBySoldDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soldDate', Sort.desc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      sortBySoldPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soldPrice', Sort.asc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      sortBySoldPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soldPrice', Sort.desc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      sortBySymbol() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'symbol', Sort.asc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      sortBySymbolDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'symbol', Sort.desc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      sortByTotalQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuantity', Sort.asc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      sortByTotalQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuantity', Sort.desc);
    });
  }
}

extension StockPositionModelQuerySortThenBy
    on QueryBuilder<StockPositionModel, StockPositionModel, QSortThenBy> {
  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      thenByAveragePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averagePrice', Sort.asc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      thenByAveragePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averagePrice', Sort.desc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      thenByBoughtCommission() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'boughtCommission', Sort.asc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      thenByBoughtCommissionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'boughtCommission', Sort.desc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      thenByBoughtDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'boughtDate', Sort.asc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      thenByBoughtDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'boughtDate', Sort.desc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      thenByBroker() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'broker', Sort.asc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      thenByBrokerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'broker', Sort.desc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      thenByComments() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comments', Sort.asc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      thenByCommentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comments', Sort.desc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      thenByCompanyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyName', Sort.asc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      thenByCompanyNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyName', Sort.desc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      thenByCurrentPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentPrice', Sort.asc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      thenByCurrentPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentPrice', Sort.desc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      thenByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      thenByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      thenBySector() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.asc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      thenBySectorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.desc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      thenBySoldCommission() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soldCommission', Sort.asc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      thenBySoldCommissionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soldCommission', Sort.desc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      thenBySoldDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soldDate', Sort.asc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      thenBySoldDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soldDate', Sort.desc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      thenBySoldPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soldPrice', Sort.asc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      thenBySoldPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soldPrice', Sort.desc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      thenBySymbol() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'symbol', Sort.asc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      thenBySymbolDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'symbol', Sort.desc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      thenByTotalQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuantity', Sort.asc);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QAfterSortBy>
      thenByTotalQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuantity', Sort.desc);
    });
  }
}

extension StockPositionModelQueryWhereDistinct
    on QueryBuilder<StockPositionModel, StockPositionModel, QDistinct> {
  QueryBuilder<StockPositionModel, StockPositionModel, QDistinct>
      distinctByAveragePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'averagePrice');
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QDistinct>
      distinctByBoughtCommission() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'boughtCommission');
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QDistinct>
      distinctByBoughtDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'boughtDate');
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QDistinct>
      distinctByBroker({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'broker', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QDistinct>
      distinctByComments({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'comments', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QDistinct>
      distinctByCompanyName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QDistinct>
      distinctByCurrentPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentPrice');
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QDistinct>
      distinctByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdated');
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QDistinct>
      distinctBySector({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sector', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QDistinct>
      distinctBySoldCommission() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'soldCommission');
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QDistinct>
      distinctBySoldDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'soldDate');
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QDistinct>
      distinctBySoldPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'soldPrice');
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QDistinct>
      distinctByStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QDistinct>
      distinctBySymbol({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'symbol', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StockPositionModel, StockPositionModel, QDistinct>
      distinctByTotalQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalQuantity');
    });
  }
}

extension StockPositionModelQueryProperty
    on QueryBuilder<StockPositionModel, StockPositionModel, QQueryProperty> {
  QueryBuilder<StockPositionModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<StockPositionModel, double, QQueryOperations>
      averagePriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'averagePrice');
    });
  }

  QueryBuilder<StockPositionModel, double, QQueryOperations>
      boughtCommissionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'boughtCommission');
    });
  }

  QueryBuilder<StockPositionModel, DateTime, QQueryOperations>
      boughtDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'boughtDate');
    });
  }

  QueryBuilder<StockPositionModel, String, QQueryOperations> brokerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'broker');
    });
  }

  QueryBuilder<StockPositionModel, String?, QQueryOperations>
      commentsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'comments');
    });
  }

  QueryBuilder<StockPositionModel, String, QQueryOperations>
      companyNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyName');
    });
  }

  QueryBuilder<StockPositionModel, double, QQueryOperations>
      currentPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentPrice');
    });
  }

  QueryBuilder<StockPositionModel, DateTime, QQueryOperations>
      lastUpdatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdated');
    });
  }

  QueryBuilder<StockPositionModel, String, QQueryOperations> sectorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sector');
    });
  }

  QueryBuilder<StockPositionModel, double?, QQueryOperations>
      soldCommissionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'soldCommission');
    });
  }

  QueryBuilder<StockPositionModel, DateTime?, QQueryOperations>
      soldDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'soldDate');
    });
  }

  QueryBuilder<StockPositionModel, double?, QQueryOperations>
      soldPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'soldPrice');
    });
  }

  QueryBuilder<StockPositionModel, StockStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<StockPositionModel, String, QQueryOperations> symbolProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'symbol');
    });
  }

  QueryBuilder<StockPositionModel, double, QQueryOperations>
      totalQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalQuantity');
    });
  }
}
