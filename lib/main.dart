import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/core/settings/settings_controller.dart';
import 'src/core/settings/settings_service.dart';
import 'injection_container.dart' as di;

void main() async {
  final settingsController = SettingsController(SettingsService());


  await settingsController.loadSettings();


  di.init();
  runApp(CoinTrackerApp(settingsController: settingsController));
}
