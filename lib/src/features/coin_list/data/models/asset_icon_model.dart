import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_icon_entity.dart';

import '../../domain/entities/asset_icon_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'asset_icon_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AssetIconModel extends AssetIcon {
  AssetIconModel({required super.assetId, required super.url});

  factory AssetIconModel.fromJson(Map<String, dynamic> json) =>
      _$AssetIconModelFromJson(json);

  Map<String, dynamic> toJson() => _$AssetIconModelToJson(this);
}
