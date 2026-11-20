import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/entities/property_entity.dart';
import '../controllers/rental_controller.dart';
import '../widgets/property_card.dart';

class HomePage extends GetView<RentalController> {
  const HomePage({super.key});

  String _label(PropertyCategory c) {
    switch (c) {
      case PropertyCategory.all:
        return 'all'.tr;
      case PropertyCategory.apartment:
        return 'apartment'.tr;
      case PropertyCategory.studio:
        return 'studio'.tr;
      case PropertyCategory.villa:
        return 'villa'.tr;
      case PropertyCategory.office:
        return 'office'.tr;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: TextField(
            controller: controller.searchController,
            onChanged: controller.updateSearch,
            decoration: InputDecoration(
              hintText: 'search_hint'.tr,
              prefixIcon: const Icon(Icons.search),
              border: const OutlineInputBorder(),
              isDense: true,
            ),
          ),
        ),
        SizedBox(
          height: 42,
          child: Obx(
            () => ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: PropertyCategory.values.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (_, i) {
                final cat = PropertyCategory.values[i];
                return ChoiceChip(
                  label: Text(_label(cat)),
                  selected: controller.selectedCategory.value == cat,
                  onSelected: (_) => controller.selectCategory(cat),
                );
              },
            ),
          ),
        ),
        Expanded(
          child: controller.obx(
            (items) => ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: items!.length,
              itemBuilder: (_, i) => PropertyCard(property: items[i]),
            ),
            onLoading: const Center(child: CircularProgressIndicator()),
            onEmpty: Center(child: Text('empty_results'.tr)),
            onError: (err) => Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(err ?? 'error_load'.tr),
                  const SizedBox(height: 8),
                  FilledButton(onPressed: controller.loadProperties, child: Text('retry'.tr)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
