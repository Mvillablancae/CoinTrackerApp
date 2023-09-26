import 'package:coin_tracker_app/src/core/usecases/usecase.dart';
import 'package:coin_tracker_app/src/features/coin_list/data/datasources/coin_list_remote_data_source_impl.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_with_icon_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/exchange_rate_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/usecases/get_historical_exchange_rate.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/usecases/get_list_of_assets_with_icon.dart';
import 'package:flutter/foundation.dart';

class CoinListProvider extends ChangeNotifier {
  CoinListProvider(
      {required this.getListOfAssetsWithIcon,
      required this.getHistoricalExchangeRate});

  final GetListOfAssetsWithIcon getListOfAssetsWithIcon;
  final GetHistoricalExchangeRate getHistoricalExchangeRate;

  List<AssetWithIcon> listOfAssets = [];
  List<ExchangeRate> historicExchangeRate = [];
  bool loading = false;
  AssetWithIcon? selected;

  Future<void> loadListOfAssetsWithIcon() async {
    loading = true;
    notifyListeners();
    final listOfAssetsWithIcon = await getListOfAssetsWithIcon.call(NoParams());
    listOfAssetsWithIcon.fold((l) => null, (r) {
      for (AssetWithIcon assetWithIcon in r) {
        listOfAssets.add(assetWithIcon);
      }
    });
    loading = false;
    notifyListeners();
  }

  void selectAssetToShowDetails(AssetWithIcon selectedAsset) {
    selected = selectedAsset;
    notifyListeners();
  }

  Future<void> loadHistoricalExchangeRate(
      String assetIdBase,
      String assetIdQuote,
      String periodId,
      DateTime timeStart,
      DateTime timeEnd,
      int? limit) async {
    loading = true;
    notifyListeners();
    final exchangeRateHistoricalData = await getHistoricalExchangeRate(Params(
        assetIdBase: assetIdBase,
        assetIdQuote: assetIdQuote,
        periodId: periodId,
        timeStart: timeStart,
        timeEnd: timeEnd,
        limit: limit));

    exchangeRateHistoricalData.fold((l) => null, (r){
      historicExchangeRate = List.from(r);
    });

    loading = false;
    notifyListeners();
  }
}
