import 'package:coin_tracker_app/src/core/usecases/usecase.dart';
import 'package:coin_tracker_app/src/features/coin_list/data/datasources/coin_list_remote_data_source_impl.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_with_icon_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/usecases/get_list_of_assets_with_icon.dart';
import 'package:flutter/foundation.dart';

class CoinListProvider extends ChangeNotifier {
  CoinListProvider({required this.getListOfAssetsWithIcon});

  final GetListOfAssetsWithIcon getListOfAssetsWithIcon;

  List<AssetWithIcon> listOfAssets = [];
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
}
