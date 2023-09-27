import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../injection_container.dart';
import '../provider/coin_list_provider.dart';

/// Displays detailed information about a SampleItem.
class CoinDetailsView extends StatelessWidget {
  const CoinDetailsView({super.key});

  static const routeName = '/sample_item';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Coin Details'),
        ),
        body: Consumer<CoinListProvider>(
          builder: (context, provider, child) => Column(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 0.3,
                width: MediaQuery.sizeOf(context).width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(provider.selected!.icon.url,
                                  scale: 0.5))),
                    ),
                    Text(
                      provider.selected!.asset.assetId,
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    Text(provider.selected!.asset.name),
                    Text(provider.selected!.asset.priceUsd.toString()),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.6,
                width: MediaQuery.sizeOf(context).width,
                child: Candlesticks(
                  //key: Key(currentSymbol + currentInterval),
                  //indicators: indicators,
                  candles: provider.historicExchangeRate
                      .map((e) => Candle(
                          date: DateTime.tryParse(e.timeOpen)!,
                          high: e.rateHigh,
                          low: e.rateLow,
                          open: e.rateOpen,
                          close: e.rateClose,
                          volume: 1000))
                      .toList(),
                  //onLoadMoreCandles: loadMoreCandles,
                  // onRemoveIndicator: (String indicator) {
                  //   setState(() {
                  //     indicators = [...indicators];
                  //     indicators
                  //         .removeWhere((element) => element.name == indicator);
                  //   }
                ),
              ),
            ],
          ),
        ));
  }
}
