import 'package:coin_tracker_app/src/features/coin_list/domain/entities/asset_icon_entity.dart';

import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/time_period_entity.dart';



part 'time_period_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TimePeriodModel extends TimePeriod {
  TimePeriodModel({
    required super.periodId,
    required super.lengthSeconds,
    required super.lengthMonths,
    required super.unitCount,
    required super.unitName,
    required super.displayName,
  });

  factory TimePeriodModel.fromJson(Map<String, dynamic> json) =>
      _$TimePeriodModelFromJson(json);

  Map<String, dynamic> toJson() => _$TimePeriodModelToJson(this);
}
