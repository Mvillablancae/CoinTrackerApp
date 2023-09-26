import 'package:coin_tracker_app/src/features/coin_list/presentation/provider/coin_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/settings/settings_view.dart';
import 'sample_item.dart';
import 'sample_item_details_view.dart';

class SampleItemListView extends StatelessWidget {
  const SampleItemListView({
    super.key,
    this.items = const [SampleItem(1), SampleItem(2), SampleItem(3)],
  });

  static const routeName = '/';

  final List<SampleItem> items;

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
              restorationId: 'sampleItemListView',
              itemCount: provider.listOfAssets.length,
              itemBuilder: (BuildContext context, int index) {
                final item = provider.listOfAssets[index];
                if (item.asset.typeIsCrypto == 1) {
                  return ListTile(
                      title: Text('${item.asset.assetId}'),
                      subtitle: item.asset.priceUsd != null
                          ? Text(
                              '${item.asset.priceUsd?.toStringAsFixed(4)} USD',
                            )
                          : null,
                      leading: CircleAvatar(
                        foregroundImage: NetworkImage(item.icon.url),
                        backgroundColor: Colors.transparent,
                      ),
                      onTap: () {
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
