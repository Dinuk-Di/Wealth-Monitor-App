// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$portfolioRepositoryHash() =>
    r'76731bd23437c77d7efff9d8ebfc1bd88ba25c04';

/// See also [portfolioRepository].
@ProviderFor(portfolioRepository)
final portfolioRepositoryProvider =
    AutoDisposeFutureProvider<PortfolioRepository>.internal(
  portfolioRepository,
  name: r'portfolioRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$portfolioRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PortfolioRepositoryRef
    = AutoDisposeFutureProviderRef<PortfolioRepository>;
String _$stockPositionsHash() => r'ac3ba0097abaed860ae0419e6bdfbaf0e38888ff';

/// See also [stockPositions].
@ProviderFor(stockPositions)
final stockPositionsProvider =
    AutoDisposeStreamProvider<List<StockPositionModel>>.internal(
  stockPositions,
  name: r'stockPositionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$stockPositionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef StockPositionsRef
    = AutoDisposeStreamProviderRef<List<StockPositionModel>>;
String _$fixedInstrumentsHash() => r'f7902ac387b438cf9e9ee543bafde4c5f9ba0ad8';

/// See also [fixedInstruments].
@ProviderFor(fixedInstruments)
final fixedInstrumentsProvider =
    AutoDisposeStreamProvider<List<FixedInstrumentModel>>.internal(
  fixedInstruments,
  name: r'fixedInstrumentsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fixedInstrumentsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FixedInstrumentsRef
    = AutoDisposeStreamProviderRef<List<FixedInstrumentModel>>;
String _$totalNetWorthHash() => r'6af3be4af6d8b461bff17f15be969e0d5435a4a4';

/// See also [totalNetWorth].
@ProviderFor(totalNetWorth)
final totalNetWorthProvider = AutoDisposeFutureProvider<double>.internal(
  totalNetWorth,
  name: r'totalNetWorthProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$totalNetWorthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TotalNetWorthRef = AutoDisposeFutureProviderRef<double>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
