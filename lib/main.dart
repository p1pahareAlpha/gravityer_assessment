import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  final settingsController = SettingsController(SettingsService());
  WidgetsFlutterBinding.ensureInitialized();

  await settingsController.loadSettings();
  await FastCachedImageConfig.init(clearCacheAfter: const Duration(days: 15));

  Get.put(settingsController);
  runApp(const MyApp());
}
