import 'package:coin_tracker_app/src/features/coin_list/presentation/provider/coin_list_provider.dart';
import 'package:flutter/material.dart';

import 'features/coin_list/presentation/pages/sample_item_details_view.dart';
import 'features/coin_list/presentation/pages/sample_item_list_view.dart';
import 'core/settings/settings_controller.dart';
import 'package:provider/provider.dart';
import 'core/settings/settings_view.dart';
import '../../../../injection_container.dart';

class CoinTrackerApp extends StatelessWidget {
  CoinTrackerApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          restorationScopeId: 'app',
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return ChangeNotifierProvider.value(
                      value: sl<CoinListProvider>(),
                      builder: ((context, child) =>
                          child!), // Replace with your actual ChangeNotifier.
                      child: SettingsView(
                          controller:
                              settingsController), // Replace with your actual widget that uses the provider.
                    );
                  case SampleItemDetailsView.routeName:
                    return ChangeNotifierProvider.value(
                      value: sl<
                          CoinListProvider>(), // Replace with your actual ChangeNotifier.
                      builder: ((context, child) => child!),
                      child:
                          const SampleItemDetailsView(), // Replace with your actual widget that uses the provider.
                    );

                  case SampleItemListView.routeName:
                  default:
                    return ChangeNotifierProvider.value(
                      value: sl<
                          CoinListProvider>(), // Replace with your actual ChangeNotifier.
                      builder: ((context, child) => child!),
                      child:
                          const SampleItemListView(), // Replace with your actual widget that uses the provider.
                    );
                }
              },
            );
          },
        );
      },
    );
  }
}
