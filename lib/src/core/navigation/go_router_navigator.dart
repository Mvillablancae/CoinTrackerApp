// GoRouter configuration
import 'package:coin_tracker_app/src/features/coin_list/presentation/provider/coin_list_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../features/coin_list/presentation/pages/sample_item_details_view.dart';
import '../../features/coin_list/presentation/pages/sample_item_list_view.dart';

class GoRouterWithProviders {
  GoRouterWithProviders({required this.coinListProvider});

  final CoinListProvider coinListProvider;
  GoRouter? router;

  void init() {
    router = GoRouter(
      routes: [
        GoRoute(
          name: 'assetList',
          path: '/',
          builder: (context, state) => ChangeNotifierProvider.value(
            value: coinListProvider..loadListOfAssetsWithIcon(),
            builder: ((context, child) => child!),
            child: const CoinListView(),
          ),
        ),
        GoRoute(
          name: CoinDetailsView.routeName.replaceFirst('/', ''),
          path: CoinDetailsView.routeName,
          builder: (context, state) => ChangeNotifierProvider.value(
            value: coinListProvider
              ..loadHistoricalExchangeRate(
                  coinListProvider.selected!.asset.assetId,
                  'USD',
                  "30MIN",
                  DateTime.now().subtract(const Duration(days: 1)),
                  DateTime.now(),
                  500),
            builder: ((context, child) => child!),
            child: const CoinDetailsView(),
          ),
        ),
      ],
    );
  }
}
