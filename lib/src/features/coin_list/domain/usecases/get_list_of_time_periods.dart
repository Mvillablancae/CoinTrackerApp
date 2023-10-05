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

class GetListOfTimePeriods extends UseCase<List<TimePeriod>, NoParams> {
  final CoinListRepository repository;
  GetListOfTimePeriods(this.repository);

  @override
  Future<Either<Failure, List<TimePeriod>>> call(NoParams params) async {
    Either<Failure, List<TimePeriod>> timePeriods = await repository.getListOfTimePeriods();
    List<TimePeriod> timePeriodList = [];

    timePeriods.fold((l) {
      return const Left(<ServerFailure>[]); //Replace with Failure
    }, (timePeriod) {
      timePeriodList = List.from(timePeriod);
    });

    return Right(timePeriodList
        .where(
          (element) => element.unitCount == 1,
        )
        .toList());
  }
}
