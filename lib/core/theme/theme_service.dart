import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/storage_service.dart';

class ThemeService extends GetxService {
  final StorageService _storage = Get.find<StorageService>();
  final RxBool isDark = false.obs;

  @override
  void onInit() {
    super.onInit();
    isDark.value = _storage.isDarkMode;
  }

  ThemeMode get themeMode => isDark.value ? ThemeMode.dark : ThemeMode.light;

  Future<void> toggleTheme() async {
    isDark.value = !isDark.value;
    await _storage.setDarkMode(isDark.value);
    Get.changeThemeMode(themeMode);
  }
}
