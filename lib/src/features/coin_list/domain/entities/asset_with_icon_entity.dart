import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_entity.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_icon_entity.dart';
import 'package:equatable/equatable.dart';

class AssetWithIcon extends Equatable {
  const AssetWithIcon({required this.asset, required this.icon});
  final Asset asset;
  final AssetIcon icon;

  @override
  // TODO: implement props
  List<Object?> get props => [asset, icon];
}
