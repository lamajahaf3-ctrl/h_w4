import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/entities/property_entity.dart';
import '../../domain/repositories/rental_repository.dart';

class RentalController extends GetxController with StateMixin<List<PropertyEntity>> {
  final RentalRepository _repository;
  RentalController(this._repository);

  final searchController = TextEditingController();
  final RxString searchQuery = ''.obs;
  final Rx<PropertyCategory> selectedCategory = PropertyCategory.all.obs;
  List<PropertyEntity> _all = [];

  @override
  void onInit() {
    super.onInit();
    loadProperties();
    everAll([searchQuery, selectedCategory], (_) => _applyFilters());
  }

  Future<void> loadProperties() async {
    change(null, status: RxStatus.loading());
    final res = await _repository.getProperties();
    if (res.failure != null || res.data == null) {
      change(null, status: RxStatus.error('error_load'.tr));
      return;
    }
    _all = res.data!;
    _applyFilters();
  }

  void updateSearch(String v) => searchQuery.value = v.trim();
  void selectCategory(PropertyCategory c) => selectedCategory.value = c;

  void _applyFilters() {
    final q = searchQuery.value.toLowerCase();
    final cat = selectedCategory.value;
    final filtered = _all.where((p) {
      final catOk = cat == PropertyCategory.all || p.category == cat;
      final qOk = q.isEmpty ||
          p.titleAr.toLowerCase().contains(q) ||
          p.titleEn.toLowerCase().contains(q) ||
          p.locationAr.toLowerCase().contains(q) ||
          p.locationEn.toLowerCase().contains(q);
      return catOk && qOk;
    }).toList();

    if (filtered.isEmpty) {
      change([], status: RxStatus.empty());
    } else {
      change(filtered, status: RxStatus.success());
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
