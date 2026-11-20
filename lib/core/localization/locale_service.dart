import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/storage_service.dart';

class LocaleService extends GetxService {
  final StorageService _storage = Get.find<StorageService>();
  final RxString currentLang = 'ar'.obs;

  @override
  void onInit() {
    super.onInit();
    currentLang.value = _storage.languageCode;
  }

  Locale get locale => Locale(currentLang.value);

  Future<void> toggleLanguage() async {
    final nextLang = currentLang.value == 'ar' ? 'en' : 'ar';
    currentLang.value = nextLang;
    await _storage.setLanguageCode(nextLang);
    Get.updateLocale(Locale(nextLang));
  }
}
