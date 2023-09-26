import 'package:coin_tracker_app/src/core/errors/exceptions.dart';
import 'package:coin_tracker_app/src/core/errors/failure.dart';
import 'package:coin_tracker_app/src/core/network/network_info.dart';
import 'package:coin_tracker_app/src/features/coin_list/data/datasources/coin_list_remote_data_source.dart';
import 'package:coin_tracker_app/src/features/coin_list/data/models/asset_model.dart';
import 'package:coin_tracker_app/src/features/coin_list/data/repositories/coin_list_repository_impl.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks(
    [MockSpec<CoinListRemoteDataSource>(), MockSpec<NetworkInfo>()])
import 'coin_list_repository_impl_test.mocks.dart';

void main() {
  late CoinListRepositoryImpl repository;
  late MockCoinListRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockRemoteDataSource = MockCoinListRemoteDataSource();
    repository = CoinListRepositoryImpl(
        remoteDataSource: mockRemoteDataSource, networkInfo: mockNetworkInfo);
  });

  group('getListOfAssets', () {
    // DATA FOR THE MOCKS AND ASSERTIONS
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
    final tAssetModelList = [tAssetModel];



    test('should check if the device is online', () {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repository.getListOfAssets();
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });

    test(
      'should return remote data when the call to remote data source is successful',
      () async {
        // arrange
        when(mockRemoteDataSource.getListOfAssets())
            .thenAnswer((_) async => tAssetModelList);
        // act
        final result = await repository.getListOfAssets();
        // assert
        verify(mockRemoteDataSource.getListOfAssets());

        bool isEqual = false;

        result.fold((l) => null, (r) {
          isEqual = listEquals(r, tAssetModelList);
        });

        expect(result, isNotNull);
        expect(isEqual, true);
      },
    );

    test(
      'should return server failure when the call to remote data source is unsuccessful',
      () async {
        // arrange
        when(mockRemoteDataSource.getListOfAssets())
            .thenThrow(ServerException());
        // act
        final result = await repository.getListOfAssets();
        // assert
        verify(mockRemoteDataSource.getListOfAssets());
        expect(result, equals(Left(ServerFailure())));
      },
    );

  });
}
