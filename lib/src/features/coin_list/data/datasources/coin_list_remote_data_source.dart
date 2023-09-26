import '../../domain/entities/asset_entity.dart';
import '../../domain/entities/asset_icon_entity.dart';
import '../../domain/entities/exchange_rate_entity.dart';
import '../../domain/entities/time_period_entity.dart';


abstract class CoinListRemoteDataSource {
  
  /// Calls the https://rest.coinapi.io/v1/assets endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<Asset>> getListOfAssets();

  /// Calls the /v1/assets/icons/{iconSize} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<AssetIcon>> getListOfAssetsIcons();

  /// Calls the https://rest.coinapi.io/v1/exchangerate/{asset_id_base}/{asset_id_quote}/history endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<ExchangeRate>> getListOfExchangeRatesForAssetPair(String assetIdBase, String assetIdQuote, String periodId, DateTime timeStart, DateTime timeEnd, int? limit);

  /// Calls the https://rest.coinapi.io/v1/exchangerate/history/periods endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<TimePeriod>> getListOfTimePeriods();

}