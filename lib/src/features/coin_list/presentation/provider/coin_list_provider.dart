import 'package:coin_tracker_app/src/core/usecases/usecase.dart';
import 'package:coin_tracker_app/src/features/coin_list/data/datasources/coin_list_remote_data_source_impl.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_with_icon_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/exchange_rate_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/time_period_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/usecases/get_historical_exchange_rate.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/usecases/get_list_of_assets_with_icon.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/usecases/get_list_of_time_periods.dart';
import 'package:flutter/foundation.dart';

class CoinListProvider extends ChangeNotifier {
  CoinListProvider(
      {required this.getListOfAssetsWithIcon,
      required this.getHistoricalExchangeRate,
      required this.getListOfTimePeriods});

  final GetListOfAssetsWithIcon getListOfAssetsWithIcon;
  final GetHistoricalExchangeRate getHistoricalExchangeRate;
  final GetListOfTimePeriods getListOfTimePeriods;

  List<AssetWithIcon> listOfAssets = [];
  List<TimePeriod> timePeriods = [];
  List<ExchangeRate> historicExchangeRate = [];
  bool loading = false;
  AssetWithIcon? selected;
  String? error;

  Future<void> loadListOfAssetsWithIcon() async {
    error = null;
    loading = true;
    notifyListeners();
    final listOfAssetsWithIcon = await getListOfAssetsWithIcon.call(NoParams());
    listOfAssetsWithIcon.fold((l) {
      error = "Error al cargar monedas.";
    }, (r) {
      for (AssetWithIcon assetWithIcon in r) {
        listOfAssets.add(assetWithIcon);
      }
    });
    loading = false;
    notifyListeners();
  }

  void selectAssetToShowDetails(AssetWithIcon selectedAsset) {
    selected = selectedAsset;
    loading = true;
    notifyListeners();
  }

  Future<void> loadHistoricalExchangeRate(String assetIdBase, String assetIdQuote, String periodId,
      DateTime timeStart, DateTime timeEnd, int? limit) async {
    error = null;
    loading = true;
    notifyListeners();
    final exchangeRateHistoricalData = await getHistoricalExchangeRate(Params(
        assetIdBase: assetIdBase,
        assetIdQuote: assetIdQuote,
        periodId: periodId,
        timeStart: timeStart,
        timeEnd: timeEnd,
        limit: limit));

    exchangeRateHistoricalData.fold((l) {
      error = 'Error loading exchange data.';
    }, (r) {
      historicExchangeRate = List.from(r);
    });

    loading = false;
    notifyListeners();
  }


  Future<void> loadTimePeriodList() async {
    error = null;
    loading = true;
    notifyListeners();
    final timePeriodList = await getListOfTimePeriods(NoParams());

    timePeriodList.fold((l) {
      error = 'Error loading time periods.';
    }, (r) {
      timePeriods = List.from(r);
    });

    loading = false;
    notifyListeners();
  }
}
