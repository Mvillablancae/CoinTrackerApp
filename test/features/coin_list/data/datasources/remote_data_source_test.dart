import 'dart:io';

import 'package:coin_tracker_app/src/core/errors/exceptions.dart';
import 'package:coin_tracker_app/src/features/coin_list/data/datasources/coin_list_remote_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../fixtures/fixture_reader.dart';
@GenerateNiceMocks([MockSpec<http.Client>()])
import 'remote_data_source_test.mocks.dart';

void main() {
  late CoinListRemoteDataSourceImpl remoteDataSource;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    remoteDataSource = CoinListRemoteDataSourceImpl(mockClient);
  });

  group('RemoteDataSource', () {
    test('should get a list of assets from server', () {
      //arrange
      when(mockClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(fixture('asset_list.json'), 200),
      );
      // act
      remoteDataSource.getListOfAssets();
      // assert
      const coinAPIKEY = String.fromEnvironment('coinAPIKEY');
      if (coinAPIKEY.isEmpty) {
        throw AssertionError('coinAPIKEY is not set');
      }
      verify(mockClient.get(
        Uri.parse(
          'https://rest.coinapi.io/v1/assets',
        ),
        headers: {
          'Content-Type': 'application/json',
          "X-CoinAPI-Key": coinAPIKEY
        },
      ));
    });

    test('should get a list of assetsIcons from server', () {
      //arrange
      when(mockClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(fixture('asset_icon_list.json'), 200),
      );
      // act
      remoteDataSource.getListOfAssetsIcons();
      // assert
      const coinAPIKEY = String.fromEnvironment('coinAPIKEY');
      if (coinAPIKEY.isEmpty) {
        throw AssertionError('coinAPIKEY is not set');
      }
      verify(mockClient.get(
        Uri.parse(
          'https://rest.coinapi.io/v1/assets/icons/32',
        ),
        headers: {
          'Content-Type': 'application/json',
          "X-CoinAPI-Key": coinAPIKEY
        },
      ));
    });

    test('should get a list of exchange rates from server', () {
      //arrange
      when(mockClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(fixture('exchange_rate_list.json'), 200),
      );
      // act
      remoteDataSource.getListOfExchangeRatesForAssetPair(
          'BTC',
          'USD',
          "1SEC",
          DateTime.tryParse("2021-03-02T00:00:00")!,
          DateTime.tryParse("2021-03-02T00:01:00")!,
          100);
      // assert
      const coinAPIKEY = String.fromEnvironment('coinAPIKEY');
      if (coinAPIKEY.isEmpty) {
        throw AssertionError('coinAPIKEY is not set');
      }
      verify(mockClient.get(
        Uri.parse(
          'https://rest.coinapi.io/v1/exchangerate/BTC/USD/history?period_id=1SEC&time_start=2021-03-02T00:00:00&time_end=2021-03-02T00:01:00&limit=100',
        ),
        headers: {
          'Content-Type': 'application/json',
          "X-CoinAPI-Key": coinAPIKEY
        },
      ));
    });

    test('should get a list of time periods from server', () {
      //arrange
      when(mockClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(fixture('time_period_list.json'), 200),
      );
      // act
      remoteDataSource.getListOfTimePeriods();
      // assert
      const coinAPIKEY = String.fromEnvironment('coinAPIKEY');
      if (coinAPIKEY.isEmpty) {
        throw AssertionError('coinAPIKEY is not set');
      }
      verify(mockClient.get(
        Uri.parse(
          'https://rest.coinapi.io/v1/exchangerate/history/periods',
        ),
        headers: {
          'Content-Type': 'application/json',
          "X-CoinAPI-Key": coinAPIKEY
        },
      ));
    });

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        when(mockClient.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response('Something went wrong', 404),
        );
        // act
        final call = remoteDataSource.getListOfAssets;
        // assert
        expect(() async => await call(),
            throwsA(const TypeMatcher<ServerException>()));
      },
    );
  });
}
