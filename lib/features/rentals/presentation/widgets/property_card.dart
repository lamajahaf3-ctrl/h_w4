import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/localization/locale_service.dart';
import '../../../../core/routes/app_routes.dart';
import '../../domain/entities/property_entity.dart';
import '../controllers/favorites_controller.dart';

class PropertyCard extends StatelessWidget {
  final PropertyEntity property;
  const PropertyCard({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    final lang = Get.find<LocaleService>().currentLang.value;
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => Get.toNamed(AppRoutes.propertyDetails, arguments: property),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  property.imageUrl,
                  height: 170,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    height: 170,
                    color: Theme.of(context).colorScheme.surfaceContainerHighest,
                    alignment: Alignment.center,
                    child: const Icon(Icons.apartment, size: 44),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GetBuilder<FavoritesController>(
                    builder: (fav) {
                      final active = fav.isFavorite(property.id);
                      return CircleAvatar(
                        backgroundColor: Colors.black54,
                        child: IconButton(
                          icon: Icon(active ? Icons.favorite : Icons.favorite_border, color: active ? Colors.redAccent : Colors.white),
                          onPressed: () => fav.toggleFavorite(property.id),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text(property.title(lang), style: Theme.of(context).textTheme.titleMedium, maxLines: 1, overflow: TextOverflow.ellipsis)),
                      Text('âک… ${property.rating}'),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(property.location(lang), style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: 8),
                  Text('\$${property.monthlyPrice.toStringAsFixed(0)} ${'per_month'.tr}', style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
