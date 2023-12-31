// Mocks generated by Mockito 5.4.2 from annotations
// in coin_tracker_app/test/features/coin_list/domain/usecases/get_list_of_assets_with_icon_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:coin_tracker_app/src/core/errors/failure.dart' as _i5;
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_entity.dart'
    as _i6;
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_icon_entity.dart'
    as _i7;
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/exchange_rate_entity.dart'
    as _i9;
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/time_period_entity.dart'
    as _i8;
import 'package:coin_tracker_app/src/features/coin_list/domain/repositories/coin_list_repository.dart'
    as _i3;
import 'package:dartz/dartz.dart' as _i2;
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

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [CoinListRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockCoinListRepository extends _i1.Mock
    implements _i3.CoinListRepository {
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Asset>>> getListOfAssets() =>
      (super.noSuchMethod(
        Invocation.method(
          #getListOfAssets,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, List<_i6.Asset>>>.value(
            _FakeEither_0<_i5.Failure, List<_i6.Asset>>(
          this,
          Invocation.method(
            #getListOfAssets,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.Asset>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.Asset>>(
          this,
          Invocation.method(
            #getListOfAssets,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Asset>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i7.AssetIcon>>>
      getListOfAssetsIcons() => (super.noSuchMethod(
            Invocation.method(
              #getListOfAssetsIcons,
              [],
            ),
            returnValue:
                _i4.Future<_i2.Either<_i5.Failure, List<_i7.AssetIcon>>>.value(
                    _FakeEither_0<_i5.Failure, List<_i7.AssetIcon>>(
              this,
              Invocation.method(
                #getListOfAssetsIcons,
                [],
              ),
            )),
            returnValueForMissingStub:
                _i4.Future<_i2.Either<_i5.Failure, List<_i7.AssetIcon>>>.value(
                    _FakeEither_0<_i5.Failure, List<_i7.AssetIcon>>(
              this,
              Invocation.method(
                #getListOfAssetsIcons,
                [],
              ),
            )),
          ) as _i4.Future<_i2.Either<_i5.Failure, List<_i7.AssetIcon>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i8.TimePeriod>>>
      getListOfTimePeriods() => (super.noSuchMethod(
            Invocation.method(
              #getListOfTimePeriods,
              [],
            ),
            returnValue:
                _i4.Future<_i2.Either<_i5.Failure, List<_i8.TimePeriod>>>.value(
                    _FakeEither_0<_i5.Failure, List<_i8.TimePeriod>>(
              this,
              Invocation.method(
                #getListOfTimePeriods,
                [],
              ),
            )),
            returnValueForMissingStub:
                _i4.Future<_i2.Either<_i5.Failure, List<_i8.TimePeriod>>>.value(
                    _FakeEither_0<_i5.Failure, List<_i8.TimePeriod>>(
              this,
              Invocation.method(
                #getListOfTimePeriods,
                [],
              ),
            )),
          ) as _i4.Future<_i2.Either<_i5.Failure, List<_i8.TimePeriod>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i9.ExchangeRate>>>
      getListOfExchangeRatesForAssetPair(
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
            returnValue: _i4
                .Future<_i2.Either<_i5.Failure, List<_i9.ExchangeRate>>>.value(
                _FakeEither_0<_i5.Failure, List<_i9.ExchangeRate>>(
              this,
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
            )),
            returnValueForMissingStub: _i4
                .Future<_i2.Either<_i5.Failure, List<_i9.ExchangeRate>>>.value(
                _FakeEither_0<_i5.Failure, List<_i9.ExchangeRate>>(
              this,
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
            )),
          ) as _i4.Future<_i2.Either<_i5.Failure, List<_i9.ExchangeRate>>>);
}
