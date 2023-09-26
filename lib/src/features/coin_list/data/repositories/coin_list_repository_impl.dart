import 'package:coin_tracker_app/src/core/errors/failure.dart';
import 'package:coin_tracker_app/src/core/network/network_info.dart';
import 'package:coin_tracker_app/src/features/coin_list/data/datasources/coin_list_remote_data_source.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_icon_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/exchange_rate_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/time_period_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/repositories/coin_list_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';

class CoinListRepositoryImpl implements CoinListRepository {
  final CoinListRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CoinListRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<Asset>>> getListOfAssets() async {
    networkInfo.isConnected;
  try {
    final remoteAssets =
        await remoteDataSource.getListOfAssets();
    return Right(remoteAssets);
  } on ServerException {
    return Left(ServerFailure());
  }
  }

  @override
  Future<Either<Failure, List<AssetIcon>>> getListOfAssetsIcons()async  {
    networkInfo.isConnected;
  try {
    final remoteAssetsIcons =
        await remoteDataSource.getListOfAssetsIcons();
    return Right(remoteAssetsIcons);
  } on ServerException {
    return Left(ServerFailure());
  }
  }

  @override
  Future<Either<Failure, List<ExchangeRate>>>
      getListOfExchangeRatesForAssetPair(
          String assetIdBase,
          String assetIdQuote,
          String periodId,
          DateTime timeStart,
          DateTime timeEnd,
          int? limit) {
    // TODO: implement getListOfExchangeRatesForAssetPair
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<TimePeriod>>> getListOfTimePeriods() {
    // TODO: implement getListOfTimePeriods
    throw UnimplementedError();
  }
}
