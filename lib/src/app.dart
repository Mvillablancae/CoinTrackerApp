import 'package:coin_tracker_app/src/core/navigation/go_router_navigator.dart';
import 'package:coin_tracker_app/src/features/coin_list/presentation/provider/coin_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

  final GoRouterWithProviders router =
      GoRouterWithProviders(coinListProvider: sl<CoinListProvider>())..init();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp.router(
          restorationScopeId: 'app',
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,
          routerConfig: router.router,
        );
      },
    );
  }
}
