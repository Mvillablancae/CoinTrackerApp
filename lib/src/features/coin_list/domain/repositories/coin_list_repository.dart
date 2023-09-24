import 'package:coin_tracker_app/src/core/errors/failure.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_icon_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/exchange_rate_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/time_period_entity.dart';
import 'package:dartz/dartz.dart';

import '../entities/asset_entity.dart';

abstract class CoinListRepository {
  Future<Either<Failure, List<Asset>>> getListOfAssets();
  Future<Either<Failure, List<AssetIcon>>> getListOfAssetsIcons();
  Future<Either<Failure, List<TimePeriod>>> getListOfTimePeriods();
  Future<Either<Failure, List<ExchangeRate>>> getListOfExchangeRatesForAssetPair(
      String assetIdBase,
      String assetIdQuote,
      String periodId,
      DateTime timeStart,
      DateTime timeEnd,
      int? limit);
}
