// Mocks generated by Mockito 5.4.2 from annotations
// in coin_tracker_app/test/features/coin_list/data/repositories/coin_list_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:coin_tracker_app/src/core/network/network_info.dart' as _i8;
import 'package:coin_tracker_app/src/features/coin_list/data/datasources/coin_list_remote_data_source.dart'
    as _i2;
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_entity.dart'
    as _i4;
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_icon_entity.dart'
    as _i5;
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/exchange_rate_entity.dart'
    as _i6;
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/time_period_entity.dart'
    as _i7;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [CoinListRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockCoinListRemoteDataSource extends _i1.Mock
    implements _i2.CoinListRemoteDataSource {
  @override
  _i3.Future<List<_i4.Asset>> getListOfAssets() => (super.noSuchMethod(
        Invocation.method(
          #getListOfAssets,
          [],
        ),
        returnValue: _i3.Future<List<_i4.Asset>>.value(<_i4.Asset>[]),
        returnValueForMissingStub:
            _i3.Future<List<_i4.Asset>>.value(<_i4.Asset>[]),
      ) as _i3.Future<List<_i4.Asset>>);
  @override
  _i3.Future<List<_i5.AssetIcon>> getListOfAssetsIcons() => (super.noSuchMethod(
        Invocation.method(
          #getListOfAssetsIcons,
          [],
        ),
        returnValue: _i3.Future<List<_i5.AssetIcon>>.value(<_i5.AssetIcon>[]),
        returnValueForMissingStub:
            _i3.Future<List<_i5.AssetIcon>>.value(<_i5.AssetIcon>[]),
      ) as _i3.Future<List<_i5.AssetIcon>>);
  @override
  _i3.Future<List<_i6.ExchangeRate>> getListOfExchangeRatesForAssetPair(
    String? assetIdBase,
    String? assetIdQuote,
    String? periodId,
    DateTime? timeStart,
    DateTime? timeEnd,
    int? limit,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getListOfExchangeRatesForAssetPair,
          [
            assetIdBase,
            assetIdQuote,
            periodId,
            timeStart,
            timeEnd,
            limit,
          ],
        ),
        returnValue:
            _i3.Future<List<_i6.ExchangeRate>>.value(<_i6.ExchangeRate>[]),
        returnValueForMissingStub:
            _i3.Future<List<_i6.ExchangeRate>>.value(<_i6.ExchangeRate>[]),
      ) as _i3.Future<List<_i6.ExchangeRate>>);
  @override
  _i3.Future<List<_i7.TimePeriod>> getListOfTimePeriods() =>
      (super.noSuchMethod(
        Invocation.method(
          #getListOfTimePeriods,
          [],
        ),
        returnValue: _i3.Future<List<_i7.TimePeriod>>.value(<_i7.TimePeriod>[]),
        returnValueForMissingStub:
            _i3.Future<List<_i7.TimePeriod>>.value(<_i7.TimePeriod>[]),
      ) as _i3.Future<List<_i7.TimePeriod>>);
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i8.NetworkInfo {
  @override
  _i3.Future<bool> get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: _i3.Future<bool>.value(false),
        returnValueForMissingStub: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
}