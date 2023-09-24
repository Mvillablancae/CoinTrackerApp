import 'dart:convert';

import 'package:coin_tracker_app/src/features/coin_list/data/models/asset_model.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tAssetModel = AssetModel(
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
      volume_1mthUsd: 57929168359984.54);

  test(
    'should be a subclass of Asset entity',
    () async {
      // assert
      expect(tAssetModel, isA<Asset>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model when the JSON is provided',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap = json.decode(fixture('asset.json'));
        // act
        final result = AssetModel.fromJson(jsonMap);
        // assert
        expect(result, tAssetModel);
      },
    );
  });
}
