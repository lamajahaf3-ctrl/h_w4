import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../constants/app_constants.dart';

class StorageService extends GetxService {
  late final GetStorage _box;

  Future<StorageService> init() async {
    await GetStorage.init();
    _box = GetStorage();
    return this;
  }

  bool get isDarkMode => _box.read<bool>(AppConstants.keyDarkMode) ?? false;
  Future<void> setDarkMode(bool value) => _box.write(AppConstants.keyDarkMode, value);

  String get languageCode => _box.read<String>(AppConstants.keyLanguage) ?? 'ar';
  Future<void> setLanguageCode(String code) => _box.write(AppConstants.keyLanguage, code);

  bool get isLoggedIn => _box.read<bool>(AppConstants.keyIsLoggedIn) ?? false;
  Future<void> setLoggedIn(bool value) => _box.write(AppConstants.keyIsLoggedIn, value);

  String get userName => _box.read<String>(AppConstants.keyUserName) ?? 'ظ…ط³طھط®ط¯ظ… ط¥ظٹط¬ط§ط±ظٹ';
  Future<void> setUserName(String name) => _box.write(AppConstants.keyUserName, name);

  List<String> get favoriteIds {
    final raw = _box.read<List<dynamic>>(AppConstants.keyFavorites) ?? [];
    return raw.map((e) => e.toString()).toList();
  }

  Future<void> setFavoriteIds(List<String> ids) => _box.write(AppConstants.keyFavorites, ids);
}
