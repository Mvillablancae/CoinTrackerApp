// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetModel _$AssetModelFromJson(Map<String, dynamic> json) => AssetModel(
      assetId: json['asset_id'] as String,
      name: json['name'] as String,
      typeIsCrypto: json['type_is_crypto'] as int,
      dataStart: json['data_start'] == null
          ? null
          : DateTime.parse(json['data_start'] as String),
      dataEnd: json['data_end'] == null
          ? null
          : DateTime.parse(json['data_end'] as String),
      dataQuoteStart: json['data_quote_start'] == null
          ? null
          : DateTime.parse(json['data_quote_start'] as String),
      dataQuoteEnd: json['data_quote_end'] == null
          ? null
          : DateTime.parse(json['data_quote_end'] as String),
      dataOrderbookStart: json['data_orderbook_start'] == null
          ? null
          : DateTime.parse(json['data_orderbook_start'] as String),
      dataOrderbookEnd: json['data_orderbook_end'] == null
          ? null
          : DateTime.parse(json['data_orderbook_end'] as String),
      dataTradeStart: json['data_trade_start'] == null
          ? null
          : DateTime.parse(json['data_trade_start'] as String),
      dataTradeEnd: json['data_trade_end'] == null
          ? null
          : DateTime.parse(json['data_trade_end'] as String),
      dataSymbolsCount: json['data_symbols_count'] as int,
      volume_1hrsUsd: (json['volume_1hrs_usd'] as num).toDouble(),
      volume_1dayUsd: (json['volume_1day_usd'] as num).toDouble(),
      volume_1mthUsd: (json['volume_1mth_usd'] as num).toDouble(),
      priceUsd: (json['price_usd'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AssetModelToJson(AssetModel instance) =>
    <String, dynamic>{
      'asset_id': instance.assetId,
      'name': instance.name,
      'type_is_crypto': instance.typeIsCrypto,
      'data_start': instance.dataStart?.toIso8601String(),
      'data_end': instance.dataEnd?.toIso8601String(),
      'data_quote_start': instance.dataQuoteStart?.toIso8601String(),
      'data_quote_end': instance.dataQuoteEnd?.toIso8601String(),
      'data_orderbook_start': instance.dataOrderbookStart?.toIso8601String(),
      'data_orderbook_end': instance.dataOrderbookEnd?.toIso8601String(),
      'data_trade_start': instance.dataTradeStart?.toIso8601String(),
      'data_trade_end': instance.dataTradeEnd?.toIso8601String(),
      'data_symbols_count': instance.dataSymbolsCount,
      'volume_1hrs_usd': instance.volume_1hrsUsd,
      'volume_1day_usd': instance.volume_1dayUsd,
      'volume_1mth_usd': instance.volume_1mthUsd,
      'price_usd': instance.priceUsd,
    };
