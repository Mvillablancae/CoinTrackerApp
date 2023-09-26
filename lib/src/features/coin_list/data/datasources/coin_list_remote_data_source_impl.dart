import 'dart:convert';

import 'package:coin_tracker_app/src/features/coin_list/data/datasources/coin_list_remote_data_source.dart';
import 'package:coin_tracker_app/src/features/coin_list/data/models/asset_icon_model.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_icon_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/exchange_rate_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/time_period_entity.dart';
import 'package:http/http.dart' as http;

import '../../../../core/errors/exceptions.dart';
import '../models/asset_model.dart';

class CoinListRemoteDataSourceImpl implements CoinListRemoteDataSource {
  CoinListRemoteDataSourceImpl(this.client);
  final http.Client client;

  @override
  Future<List<Asset>> getListOfAssets() async {
    List<Asset> assetList = [];
    const coinAPIKEY = String.fromEnvironment('coinAPIKEY');
    if (coinAPIKEY.isEmpty) {
      throw AssertionError('coinAPIKEY is not set');
    }
    final response = await client.get(
      Uri.parse('https://rest.coinapi.io/v1/assets'),
      headers: {
        'Content-Type': 'application/json',
        "X-CoinAPI-Key": coinAPIKEY
      },
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      for (dynamic r in jsonResponse) {
        assetList.add(AssetModel.fromJson(r));
      }
      return assetList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<AssetIcon>> getListOfAssetsIcons() async {
    List<AssetIcon> assetList = [];
    const coinAPIKEY = String.fromEnvironment('coinAPIKEY');
    if (coinAPIKEY.isEmpty) {
      throw AssertionError('coinAPIKEY is not set');
    }
    final response = await client.get(
      Uri.parse('https://rest.coinapi.io/v1/assets/icons/32'),
      headers: {
        'Content-Type': 'application/json',
        "X-CoinAPI-Key": coinAPIKEY
      },
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      for (dynamic r in jsonResponse) {
        assetList.add(AssetIconModel.fromJson(r));
      }
      return assetList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ExchangeRate>> getListOfExchangeRatesForAssetPair(
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
  Future<List<TimePeriod>> getListOfTimePeriods() {
    // TODO: implement getListOfTimePeriods
    throw UnimplementedError();
  }
}
