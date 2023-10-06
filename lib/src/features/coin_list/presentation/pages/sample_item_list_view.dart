import 'package:coin_tracker_app/src/features/coin_list/presentation/provider/coin_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/settings/settings_view.dart';
import 'sample_item_details_view.dart';

class CoinListView extends StatelessWidget {
  const CoinListView({
    super.key,
  });

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cripto List'),
      ),
      body: Consumer<CoinListProvider>(
        builder: (contextBuilder, provider, child) {
          if (provider.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Ha ocurrido un error",
                        style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                      ),
                      Text(provider.error!)
                    ],
                  ),
                  TextButton(
                      onPressed: () async {
                        provider.loadListOfAssetsWithIcon();
                      },
                      child: Text("Recargar información"))
                ],
              ),
            );
          }
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
                      GoRouter.of(context).push(CoinDetailsView.routeName);
                    });
              },
            );
          }
        },
      ),
    );
  }
}
