import 'package:equatable/equatable.dart';

class Asset extends Equatable {
  final String assetId;
  final String name;
  final int typeIsCrypto;
  final DateTime? dataStart;
  final DateTime? dataEnd;
  final DateTime? dataQuoteStart;
  final DateTime? dataQuoteEnd;
  final DateTime? dataOrderbookStart;
  final DateTime? dataOrderbookEnd;
  final DateTime? dataTradeStart;
  final DateTime? dataTradeEnd;
  final int dataSymbolsCount;
  final double volume_1hrsUsd;
  final double volume_1dayUsd;
  final double volume_1mthUsd;
  final double? priceUsd;

  const Asset({
    required this.assetId,
    required this.name,
    required this.typeIsCrypto,
     this.dataStart,
     this.dataEnd,
     this.dataQuoteStart,
     this.dataQuoteEnd,
     this.dataOrderbookStart,
     this.dataOrderbookEnd,
     this.dataTradeStart,
     this.dataTradeEnd,
    required this.dataSymbolsCount,
    required this.volume_1hrsUsd,
    required this.volume_1dayUsd,
    required this.volume_1mthUsd,
    this.priceUsd,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        assetId,
        name,
        typeIsCrypto,
        dataStart,
        dataEnd,
        dataQuoteStart,
        dataQuoteEnd,
        dataOrderbookStart,
        dataOrderbookEnd,
        dataTradeStart,
        dataTradeEnd,
        dataSymbolsCount,
        volume_1hrsUsd,
        volume_1dayUsd,
        volume_1mthUsd,
        priceUsd,
      ];
}
