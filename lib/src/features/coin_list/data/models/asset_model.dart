import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'asset_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AssetModel extends Asset {
  const AssetModel(
      {required super.assetId,
      required super.name,
      required super.typeIsCrypto,
      required super.dataStart,
      required super.dataEnd,
      required super.dataQuoteStart,
      required super.dataQuoteEnd,
      required super.dataOrderbookStart,
      required super.dataOrderbookEnd,
      required super.dataTradeStart,
      required super.dataTradeEnd,
      required super.dataSymbolsCount,
      required super.volume_1hrsUsd,
      required super.volume_1dayUsd,
      required super.volume_1mthUsd,
      required super.priceUsd});

  @JsonKey(name: 'picture_url')
  factory AssetModel.fromJson(Map<String, dynamic> json) =>
      _$AssetModelFromJson(json);

  Map<String, dynamic> toJson() => _$AssetModelToJson(this);
}
