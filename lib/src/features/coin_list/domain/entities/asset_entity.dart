import 'package:equatable/equatable.dart';

class Asset extends Equatable {
  final String assetId;
  final String name;
  final int typeIsCrypto;
  final DateTime dataStart;
  final DateTime dataEnd;
  final DateTime dataQuoteStart;
  final DateTime dataQuoteEnd;
  final DateTime dataOrderbookStart;
  final DateTime dataOrderbookEnd;
  final DateTime dataTradeStart;
  final DateTime dataTradeEnd;
  final int dataSymbolsCount;
  final double volume1HrsUsd;
  final double volume1DayUsd;
  final double volume1MthUsd;
  final double priceUsd;

  const Asset({
    required this.assetId,
    required this.name,
    required this.typeIsCrypto,
    required this.dataStart,
    required this.dataEnd,
    required this.dataQuoteStart,
    required this.dataQuoteEnd,
    required this.dataOrderbookStart,
    required this.dataOrderbookEnd,
    required this.dataTradeStart,
    required this.dataTradeEnd,
    required this.dataSymbolsCount,
    required this.volume1HrsUsd,
    required this.volume1DayUsd,
    required this.volume1MthUsd,
    required this.priceUsd,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        assetId,
        name,
        typeIsCrypto,
        dataStart.millisecondsSinceEpoch,
        dataEnd.millisecondsSinceEpoch,
        dataQuoteStart.millisecondsSinceEpoch,
        dataQuoteEnd.millisecondsSinceEpoch,
        dataOrderbookStart.millisecondsSinceEpoch,
        dataOrderbookEnd.millisecondsSinceEpoch,
        dataTradeStart.millisecondsSinceEpoch,
        dataTradeEnd.millisecondsSinceEpoch,
        dataSymbolsCount,
        volume1HrsUsd,
        volume1DayUsd,
        volume1MthUsd,
        priceUsd,
      ];
}
