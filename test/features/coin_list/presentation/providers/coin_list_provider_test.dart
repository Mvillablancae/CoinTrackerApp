import 'dart:convert';

import 'package:coin_tracker_app/src/core/usecases/usecase.dart';
import 'package:coin_tracker_app/src/features/coin_list/data/models/asset_icon_model.dart';
import 'package:coin_tracker_app/src/features/coin_list/data/models/asset_model.dart';
import 'package:coin_tracker_app/src/features/coin_list/data/models/exchange_rate_model.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_icon_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_with_icon_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/exchange_rate_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/usecases/get_historical_exchange_rate.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/usecases/get_list_of_assets_with_icon.dart';
import 'package:coin_tracker_app/src/features/coin_list/presentation/provider/coin_list_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';
@GenerateNiceMocks([MockSpec<GetListOfAssetsWithIcon>(), MockSpec<GetHistoricalExchangeRate>()])
import 'coin_list_provider_test.mocks.dart';

void main() {
  late final MockGetListOfAssetsWithIcon getListOfAssetsWithIcon;
  late final MockGetHistoricalExchangeRate getHistoricalExchangeRate;

  late final CoinListProvider provider;
  setUpAll(() {
      getListOfAssetsWithIcon = MockGetListOfAssetsWithIcon();
      getHistoricalExchangeRate = MockGetHistoricalExchangeRate();
      provider = CoinListProvider(
          getListOfAssetsWithIcon: getListOfAssetsWithIcon,
          getHistoricalExchangeRate: getHistoricalExchangeRate);
    });
 

  group('provider usecases', () {

    test('provider should get a list of assets with icon', () async {
      when(getListOfAssetsWithIcon.call(NoParams())).thenAnswer((_) async {
        return Right(<AssetWithIcon>[
          AssetWithIcon(
              asset: AssetModel(
                  assetId: 'BTC',
                  dataEnd: DateTime.parse("2019-11-03"),
                  dataOrderbookEnd: DateTime.parse("2019-11-03T17:55:17.8592413Z"),
                  dataOrderbookStart: DateTime.parse("2014-02-24T17:43:05.0000000Z"),
                  dataQuoteEnd: DateTime.parse("2019-11-03T17:55:07.6724523Z"),
                  dataQuoteStart: DateTime.parse("2014-02-24T17:43:05.0000000Z"),
                  dataStart: DateTime.parse("2010-07-17"),
                  dataSymbolsCount: 22711,
                  dataTradeEnd: DateTime.parse("2019-11-03T17:55:11.8220000Z"),
                  dataTradeStart: DateTime.parse("2010-07-17T23:09:17.0000000Z"),
                  name: 'Bitcoin',
                  priceUsd: 9166.207274778093436220194944,
                  typeIsCrypto: 1,
                  volume_1dayUsd: 2086392323256.16,
                  volume_1hrsUsd: 102894431436.49,
                  volume_1mthUsd: 57929168359984.54),
              icon: AssetIconModel(
                  assetId: 'BTC',
                  url:
                      'https://s3.eu-central-1.amazonaws.com/bbxt-static-icons/type-id/png_16/f231d7382689406f9a50dde841418c64.png'))
        ]);
      });

      await provider.loadListOfAssetsWithIcon();

      print(provider.listOfAssets);

      bool verifyEqualLists = listEquals(provider.listOfAssets, [
        AssetWithIcon(
            asset: AssetModel(
                assetId: 'BTC',
                dataEnd: DateTime.parse("2019-11-03"),
                dataOrderbookEnd: DateTime.parse("2019-11-03T17:55:17.8592413Z"),
                dataOrderbookStart: DateTime.parse("2014-02-24T17:43:05.0000000Z"),
                dataQuoteEnd: DateTime.parse("2019-11-03T17:55:07.6724523Z"),
                dataQuoteStart: DateTime.parse("2014-02-24T17:43:05.0000000Z"),
                dataStart: DateTime.parse("2010-07-17"),
                dataSymbolsCount: 22711,
                dataTradeEnd: DateTime.parse("2019-11-03T17:55:11.8220000Z"),
                dataTradeStart: DateTime.parse("2010-07-17T23:09:17.0000000Z"),
                name: 'Bitcoin',
                priceUsd: 9166.207274778093436220194944,
                typeIsCrypto: 1,
                volume_1dayUsd: 2086392323256.16,
                volume_1hrsUsd: 102894431436.49,
                volume_1mthUsd: 57929168359984.54),
            icon: AssetIconModel(
                assetId: 'BTC',
                url:
                    'https://s3.eu-central-1.amazonaws.com/bbxt-static-icons/type-id/png_16/f231d7382689406f9a50dde841418c64.png'))
      ]);
      expect(verifyEqualLists, true);
    });

    test('provider should get a list of exchange data from asset', () async {
      when(getHistoricalExchangeRate.call(Params(
              assetIdBase: 'BTC',
              assetIdQuote: 'USD',
              periodId: "30MIN",
              timeStart: DateTime.parse('2021-03-01T00:00:00'),
              timeEnd: DateTime.parse('2021-03-02T00:00:00'),
              limit: 2)))
          .thenAnswer((_) async {
        final Map<String, dynamic> jsonMap = json.decode(fixture('exchange_rate.json'));
        return Right(<ExchangeRate>[
          ExchangeRateModel.fromJson(jsonMap),
          ExchangeRateModel.fromJson(jsonMap),
        ]);
      });

      await provider.loadHistoricalExchangeRate('BTC', 'USD', "30MIN",
          DateTime.parse('2021-03-01T00:00:00'), DateTime.parse('2021-03-02T00:00:00'), 2);

      print(provider.historicExchangeRate);

      final Map<String, dynamic> jsonMap = json.decode(fixture('exchange_rate.json'));
      bool verifyEqualLists = listEquals(provider.historicExchangeRate,
        [
          ExchangeRateModel.fromJson(jsonMap),
          ExchangeRateModel.fromJson(jsonMap),
        ]
      );
      expect(verifyEqualLists, true);
    });

    test('provider should get a list of TimePeriods from asset', () async {
      when(getHistoricalExchangeRate.call(Params(
              assetIdBase: 'BTC',
              assetIdQuote: 'USD',
              periodId: "30MIN",
              timeStart: DateTime.parse('2021-03-01T00:00:00'),
              timeEnd: DateTime.parse('2021-03-02T00:00:00'),
              limit: 2)))
          .thenAnswer((_) async {
        final Map<String, dynamic> jsonMap = json.decode(fixture('exchange_rate.json'));
        return Right(<ExchangeRate>[
          ExchangeRateModel.fromJson(jsonMap),
          ExchangeRateModel.fromJson(jsonMap),
        ]);
      });

      await provider.loadHistoricalExchangeRate('BTC', 'USD', "30MIN",
          DateTime.parse('2021-03-01T00:00:00'), DateTime.parse('2021-03-02T00:00:00'), 2);

      print(provider.historicExchangeRate);

      final Map<String, dynamic> jsonMap = json.decode(fixture('exchange_rate.json'));
      bool verifyEqualLists = listEquals(provider.historicExchangeRate,
        [
          ExchangeRateModel.fromJson(jsonMap),
          ExchangeRateModel.fromJson(jsonMap),
        ]
      );
      expect(verifyEqualLists, true);
    });
  });
}
