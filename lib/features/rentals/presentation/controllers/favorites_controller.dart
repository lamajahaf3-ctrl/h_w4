import 'package:get/get.dart';
import '../../../../core/services/storage_service.dart';
import '../../domain/entities/property_entity.dart';

class FavoritesController extends GetxController {
  final StorageService _storage;
  FavoritesController(this._storage);

  final Set<String> _ids = {};

  @override
  void onInit() {
    super.onInit();
    _ids.addAll(_storage.favoriteIds);
  }

  bool isFavorite(String id) => _ids.contains(id);

  Future<void> toggleFavorite(String id) async {
    if (_ids.contains(id)) {
      _ids.remove(id);
    } else {
      _ids.add(id);
    }
    await _storage.setFavoriteIds(_ids.toList());
    update();
  }

  List<PropertyEntity> favoriteProperties(List<PropertyEntity> all) =>
      all.where((p) => _ids.contains(p.id)).toList();
}
