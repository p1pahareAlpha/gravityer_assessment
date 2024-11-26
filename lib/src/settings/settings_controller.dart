import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'settings_service.dart';

class SettingsController extends GetxController {
  SettingsController(this._settingsService);

  final SettingsService _settingsService;

  late ThemeMode _themeMode;

  ThemeMode get themeMode => _themeMode;

  Future<void> loadSettings() async {
    _themeMode = await _settingsService.themeMode();
    update();
  }

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;

    if (newThemeMode == _themeMode) return;

    _themeMode = newThemeMode;

    update();

    await _settingsService.updateThemeMode(newThemeMode);
  }
}
