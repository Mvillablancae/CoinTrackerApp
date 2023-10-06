import 'package:coin_tracker_app/src/core/usecases/usecase.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_icon_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_with_icon_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/repositories/coin_list_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

class GetListOfAssetsWithIcon extends UseCase<List<AssetWithIcon>, NoParams> {
  final CoinListRepository repository;
  GetListOfAssetsWithIcon(this.repository);

  @override
  Future<Either<Failure, List<AssetWithIcon>>> call(NoParams noParams) async {
    Either<Failure, List<Asset>> assets = await repository.getListOfAssets();
    Either<Failure, List<AssetIcon>> assetsIcons =
        await repository.getListOfAssetsIcons();
    List<AssetWithIcon> assetsWithIcons = [];

    
    return assets.fold((l) {
      return Left(ServerFailure()); //Replace with Failure
    }, (assetList) {
      for (Asset asset in assetList) {
        assetsIcons.fold((l) {
          return const Left(ServerFailure); //Replace with Failure
        }, (assetIconList) {
          for (AssetIcon assetIcon in assetIconList) {
            if (asset.assetId == assetIcon.assetId 
            && asset.priceUsd != null && asset.typeIsCrypto == 1)  {
              assetsWithIcons.add(AssetWithIcon(asset: asset, icon: assetIcon));
            }
          }
        });
      }
      return Right(assetsWithIcons);
    });
  }
}
