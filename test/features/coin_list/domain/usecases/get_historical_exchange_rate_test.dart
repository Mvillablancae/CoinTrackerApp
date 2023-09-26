import 'package:coin_tracker_app/src/features/coin_list/domain/entities/exchange_rate_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/time_period_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/repositories/coin_list_repository.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/usecases/get_historical_exchange_rate.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks(
    [MockSpec<CoinListRepository>(onMissingStub: OnMissingStub.returnDefault)])
import 'get_historical_exchange_rate_test.mocks.dart';

void main() {
  late GetHistoricalExchangeRate usecase;
  late MockCoinListRepository mockCoinListRepository;

  setUp(() {
    mockCoinListRepository = MockCoinListRepository();
    usecase = GetHistoricalExchangeRate(mockCoinListRepository);
  });

  final List<TimePeriod> timePeriod = [
    TimePeriod(
        displayName: "1 Second",
        lengthMonths: 0,
        lengthSeconds: 1,
        periodId: "1SEC",
        unitCount: 1,
        unitName: "second")
  ];

  final List<ExchangeRate> exchangeRateList = [
    ExchangeRate(
        timePeriodStart: "2021-03-02T00:00:00.0000000Z",
        timePeriodEnd: "2021-03-02T00:01:00.0000000Z",
        timeOpen: "2021-03-02T00:00:00.0000000Z",
        timeClose: "2021-03-02T00:01:00.0000000Z",
        rateOpen: 49642.89075974334,
        rateHigh: 49642.89075974334,
        rateLow: 49642.89075974334,
        rateClose: 49642.89075974334),
  ];

  test('Should get a list of exchange rates', () async {
    when(mockCoinListRepository.getListOfTimePeriods())
        .thenAnswer((_) async => Right(timePeriod));

    when(mockCoinListRepository.getListOfExchangeRatesForAssetPair(
            'BTC',
            'USD',
            timePeriod[0].periodId,
            DateTime.tryParse(exchangeRateList[0].timePeriodStart),
            DateTime.tryParse(exchangeRateList[0].timePeriodEnd),
            100))
        .thenAnswer((_) async => Right(exchangeRateList));

    final result = await usecase(
      Params(
          assetIdBase: 'BTC',
          assetIdQuote: 'USD',
          periodId: timePeriod[0].periodId,
          limit: 100,
          timeStart: DateTime.tryParse(exchangeRateList[0].timePeriodStart)!,
          timeEnd: DateTime.tryParse(exchangeRateList[0].timePeriodEnd)!),
    );

    bool isEqual = false;

    result.fold((l) => null, (r) {
      print(r);
      print(exchangeRateList);
      isEqual = listEquals(r, exchangeRateList);
    });

    expect(result, isNotNull);
    expect(isEqual, true);

    verify(mockCoinListRepository.getListOfTimePeriods());
    verify(mockCoinListRepository.getListOfExchangeRatesForAssetPair(
        'BTC',
        'USD',
        timePeriod[0].periodId,
        DateTime.tryParse(exchangeRateList[0].timePeriodStart),
        DateTime.tryParse(exchangeRateList[0].timePeriodEnd),
        100));
    verifyNoMoreInteractions(mockCoinListRepository);
  });
}
