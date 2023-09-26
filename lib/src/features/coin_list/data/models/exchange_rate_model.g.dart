// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_rate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExchangeRateModel _$ExchangeRateModelFromJson(Map<String, dynamic> json) =>
    ExchangeRateModel(
      timePeriodStart: json['time_period_start'] as String,
      timePeriodEnd: json['time_period_end'] as String,
      timeOpen: json['time_open'] as String,
      timeClose: json['time_close'] as String,
      rateOpen: (json['rate_open'] as num).toDouble(),
      rateHigh: (json['rate_high'] as num).toDouble(),
      rateLow: (json['rate_low'] as num).toDouble(),
      rateClose: (json['rate_close'] as num).toDouble(),
    );

Map<String, dynamic> _$ExchangeRateModelToJson(ExchangeRateModel instance) =>
    <String, dynamic>{
      'time_period_start': instance.timePeriodStart,
      'time_period_end': instance.timePeriodEnd,
      'time_open': instance.timeOpen,
      'time_close': instance.timeClose,
      'rate_open': instance.rateOpen,
      'rate_high': instance.rateHigh,
      'rate_low': instance.rateLow,
      'rate_close': instance.rateClose,
    };
