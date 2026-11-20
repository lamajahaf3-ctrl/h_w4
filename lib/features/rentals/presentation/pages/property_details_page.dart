import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/localization/locale_service.dart';
import '../../domain/entities/property_entity.dart';
import '../controllers/booking_controller.dart';

class PropertyDetailsPage extends StatelessWidget {
  const PropertyDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final property = Get.arguments as PropertyEntity;
    final lang = Get.find<LocaleService>().currentLang.value;
    return Scaffold(
      appBar: AppBar(title: Text(property.title(lang))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(property.imageUrl, height: 205, width: double.infinity, fit: BoxFit.cover),
            ),
            const SizedBox(height: 12),
            Text(property.title(lang), style: Theme.of(context).textTheme.headlineSmall),
            Text(property.location(lang)),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('${property.rooms} ${'rooms'.tr}'),
                Text('${property.bathrooms} ${'bathrooms'.tr}'),
                Text('${property.areaSqm} ${'area_sqm'.tr}'),
              ],
            ),
            const Divider(height: 24),
            Text(property.description(lang)),
            const SizedBox(height: 20),
            GetBuilder<BookingController>(
              builder: (bCtrl) {
                final total = property.monthlyPrice * bCtrl.selectedMonths;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('guests_nights'.tr),
                    const SizedBox(height: 8),
                    SegmentedButton<int>(
                      segments: const [
                        ButtonSegment(value: 1, label: Text('1')),
                        ButtonSegment(value: 3, label: Text('3')),
                        ButtonSegment(value: 6, label: Text('6')),
                        ButtonSegment(value: 12, label: Text('12')),
                      ],
                      selected: {bCtrl.selectedMonths},
                      onSelectionChanged: (s) => bCtrl.setMonths(s.first),
                    ),
                    const SizedBox(height: 12),
                    Text('${'total_est'.tr}: \$${total.toStringAsFixed(0)}', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 12),
                    FilledButton(
                      onPressed: () {
                        bCtrl.createBooking(property);
                        Get.back();
                      },
                      child: Text('book_now'.tr),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
