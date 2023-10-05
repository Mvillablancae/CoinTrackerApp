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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 0.15,
                width: MediaQuery.sizeOf(context).width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.sizeOf(context).height * 0.12,
                      width: MediaQuery.sizeOf(context).height * 0.12,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(provider.selected!.icon.url, scale: 0.5),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          provider.selected!.asset.assetId,
                          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          provider.selected!.asset.name,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    Text(
                      "\$${provider.selected!.asset.priceUsd.toString().substring(0, provider.selected!.asset.priceUsd.toString().indexOf(".") + 3)} USD",
                      style: const TextStyle(fontSize: 20, color: Colors.green),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.7 - AppBar().preferredSize.height,
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
                          volume: 100))
                      .toList(),
                  actions: [
                    ...provider.timePeriods.map((timePeriod) => ToolBarAction(
                          child: Text(timePeriod.periodId),
                          onPressed: () {
                            provider.loadHistoricalExchangeRate(
                                provider.selected!.asset.assetId,
                                'USD',
                                timePeriod.periodId,
                                DateTime.now().subtract(const Duration(days: 1)),
                                DateTime.now(),
                                provider.limit);
                          },
                        )),
                  ],
                  // onLoadMoreCandles: loadMoreCandles,
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
