import 'dart:convert';

import 'package:coin_tracker_app/src/features/coin_list/data/models/asset_icon_model.dart';

import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_icon_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tAssetIconModel = AssetIconModel(
      assetId: 'BTC',
      url: 'https://s3.eu-central-1.amazonaws.com/bbxt-static-icons/type-id/png_16/f231d7382689406f9a50dde841418c64.png');

  test(
    'should be a subclass of AssetIcon entity',
    () async {
      // assert
      expect(tAssetIconModel, isA<AssetIcon>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model when the JSON is provided',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap = json.decode(fixture('asset_icon.json'));
        // act
        final result = AssetIconModel.fromJson(jsonMap);
        // assert
        expect(result, tAssetIconModel);
      },
    );
  });
}
