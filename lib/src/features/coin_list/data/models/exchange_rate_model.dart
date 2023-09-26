import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_icon_entity.dart';

import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/exchange_rate_entity.dart';

part 'exchange_rate_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ExchangeRateModel extends ExchangeRate {
  ExchangeRateModel({
    required super.timePeriodStart,
    required super.timePeriodEnd,
    required super.timeOpen,
    required super.timeClose,
    required super.rateOpen,
    required super.rateHigh,
    required super.rateLow,
    required super.rateClose,
  });

  factory ExchangeRateModel.fromJson(Map<String, dynamic> json) =>
      _$ExchangeRateModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExchangeRateModelToJson(this);
}
