import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/coin_list_provider.dart';

/// Displays detailed information about a SampleItem.
class SampleItemDetailsView extends StatelessWidget {
  const SampleItemDetailsView({super.key});

  static const routeName = '/sample_item';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: Consumer<CoinListProvider>(
        builder: (context, provider, child) => ListView(
          children: [
            Text(provider.selected!.asset.assetId),
            Text(provider.selected!.asset.name),
            Text(provider.selected!.asset.priceUsd.toString()),
            Text(provider.selected!.asset.assetId),
            Text(provider.selected!.asset.assetId),
            child!
          ],
        ),
        child: Center(
          child: Text('More Information Here'),
        ),
      ),
    );
  }
}
