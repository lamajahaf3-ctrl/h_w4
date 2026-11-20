import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/favorites_controller.dart';
import '../controllers/rental_controller.dart';
import '../widgets/property_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final all = Get.find<RentalController>().state ?? const [];
    return GetBuilder<FavoritesController>(
      builder: (fav) {
        final list = fav.favoriteProperties(all);
        if (list.isEmpty) return Center(child: Text('no_favorites'.tr));
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: list.length,
          itemBuilder: (_, i) => PropertyCard(property: list[i]),
        );
      },
    );
  }
}
