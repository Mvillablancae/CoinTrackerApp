import 'package:coin_tracker_app/src/core/errors/failure.dart';
import 'package:coin_tracker_app/src/core/usecases/usecase.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_icon_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_with_icon_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/time_period_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/repositories/coin_list_repository.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/usecases/get_list_of_assets_with_icon.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/usecases/get_list_of_time_periods.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<CoinListRepository>()])
import 'get_list_of_time_periods_test.mocks.dart';

void main() {
  late GetListOfTimePeriods usecase;
  late MockCoinListRepository mockCoinListRepository;

  setUp(() {
    mockCoinListRepository = MockCoinListRepository();
    usecase = GetListOfTimePeriods(mockCoinListRepository);
  });

  final List<TimePeriod> timePeriodList = [
    TimePeriod(
        periodId: "1MIN",
        lengthSeconds: 60,
        lengthMonths: 0,
        unitCount: 1,
        unitName: "minute",
        displayName: "1 Minutes"),
        TimePeriod(
        periodId: "30MIN",
        lengthSeconds: 1800,
        lengthMonths: 0,
        unitCount: 30,
        unitName: "minute",
        displayName: "30 Minutes")
  ];

  test('Should get a list of time periods with unitCount equals 1', () async {
    when(mockCoinListRepository.getListOfTimePeriods())
        .thenAnswer((_) async => Right(timePeriodList));

    final result = await usecase(NoParams());

    bool isEqual = false;

    result.fold((l) => null, (r) {
      print(r);
      print(timePeriodList);
      isEqual = listEquals(r, timePeriodList);
    });

    expect(result, isNotNull);
    expect(isEqual, true);

    verify(mockCoinListRepository.getListOfTimePeriods());
    verifyNoMoreInteractions(mockCoinListRepository);
  });
}
