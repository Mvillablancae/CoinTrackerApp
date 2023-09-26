// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_period_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimePeriodModel _$TimePeriodModelFromJson(Map<String, dynamic> json) =>
    TimePeriodModel(
      periodId: json['period_id'] as String,
      lengthSeconds: json['length_seconds'] as int,
      lengthMonths: json['length_months'] as int,
      unitCount: json['unit_count'] as int,
      unitName: json['unit_name'] as String,
      displayName: json['display_name'] as String,
    );

Map<String, dynamic> _$TimePeriodModelToJson(TimePeriodModel instance) =>
    <String, dynamic>{
      'period_id': instance.periodId,
      'length_seconds': instance.lengthSeconds,
      'length_months': instance.lengthMonths,
      'unit_count': instance.unitCount,
      'unit_name': instance.unitName,
      'display_name': instance.displayName,
    };
