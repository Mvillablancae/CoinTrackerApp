

import 'package:coin_tracker_app/src/core/errors/failure.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_icon_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/exchange_rate_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/time_period_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/repositories/coin_list_repository.dart';
import 'package:dartz/dartz.dart';

class CoinListRepositoryImpl implements CoinListRepository{
  @override
  Future<Either<Failure, List<Asset>>> getListOfAssets() {
    // TODO: implement getListOfAssets
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<AssetIcon>>> getListOfAssetsIcons() {
    // TODO: implement getListOfAssetsIcons
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ExchangeRate>>> getListOfExchangeRatesForAssetPair(String assetIdBase, String assetIdQuote, String periodId, DateTime timeStart, DateTime timeEnd, int? limit) {
    // TODO: implement getListOfExchangeRatesForAssetPair
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<TimePeriod>>> getListOfTimePeriods() {
    // TODO: implement getListOfTimePeriods
    throw UnimplementedError();
  }
  
}