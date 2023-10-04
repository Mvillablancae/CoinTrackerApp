import 'package:coin_tracker_app/src/core/usecases/usecase.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_icon_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_with_icon_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/exchange_rate_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/time_period_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/repositories/coin_list_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failure.dart';

class GetHistoricalExchangeRate extends UseCase<List<ExchangeRate>, Params> {
  final CoinListRepository repository;
  GetHistoricalExchangeRate(this.repository);

  @override
  Future<Either<Failure, List<ExchangeRate>>> call(Params params) async {
    Either<Failure, List<ExchangeRate>> exchangeRates =
        await repository.getListOfExchangeRatesForAssetPair(
            params.assetIdBase,
            params.assetIdQuote,
            params.periodId,
            params.timeStart,
            params.timeEnd,
            params.limit);
    List<ExchangeRate> exchangeRatesList = [];

    exchangeRates.fold((l) {
      return const Right(<ExchangeRate>[]); //Replace with Failure
    }, (exchangeRate) {
      exchangeRatesList = List.from(exchangeRate);
    });
    return Right(exchangeRatesList);
  }
}

class Params extends Equatable {
  final String assetIdBase;
  final String assetIdQuote;
  final String periodId;
  final DateTime timeStart;
  final DateTime timeEnd;
  final int? limit;

  Params(
      {required this.assetIdBase,
      required this.assetIdQuote,
      required this.periodId,
      required this.timeStart,
      required this.timeEnd,
      this.limit});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [assetIdBase, assetIdQuote, periodId, timeStart, timeEnd, limit];
}
