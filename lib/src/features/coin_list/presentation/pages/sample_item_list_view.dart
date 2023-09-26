import 'package:coin_tracker_app/src/features/coin_list/presentation/provider/coin_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/settings/settings_view.dart';
import 'sample_item_details_view.dart';

class SampleItemListView extends StatelessWidget {
  const SampleItemListView({
    super.key,
  });

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    context.read<CoinListProvider>().loadListOfAssetsWithIcon();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cripto List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: Consumer<CoinListProvider>(
        builder: (context, provider, child) {
          if (provider.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              restorationId: 'CoinListListView',
              itemCount: provider.listOfAssets.length,
              itemBuilder: (BuildContext context, int index) {
                final item = provider.listOfAssets[index];
                if (item.asset.typeIsCrypto == 1) {
                  return ListTile(
                      title: Text('${item.asset.assetId}'),
                      subtitle: item.asset.priceUsd != null
                          ? Text(
                              item.asset.name,
                            )
                          : null,
                      leading: CircleAvatar(
                        foregroundImage: NetworkImage(item.icon.url),
                        backgroundColor: Colors.transparent,
                      ),
                      trailing: item.asset.priceUsd != null
                          ? Text(
                              '${item.asset.priceUsd?.toStringAsFixed(4)} USD',
                              style: TextStyle(color: Colors.green[700]),
                            )
                          : const SizedBox(),
                      onTap: () {
                        provider.selectAssetToShowDetails(item);
                        provider.loadHistoricalExchangeRate(
                            item.asset.assetId,
                            'USD',
                            "1MIN",
                            DateTime.now().subtract(const Duration(days: 1)),
                            DateTime.now(),
                            100);
                        Navigator.restorablePushNamed(
                          context,
                          SampleItemDetailsView.routeName,
                        );
                      });
                } else {
                  return const SizedBox();
                }
              },
            );
          }
        },
      ),
    );
  }
}
