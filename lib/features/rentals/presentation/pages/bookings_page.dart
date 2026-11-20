import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/localization/locale_service.dart';
import '../controllers/booking_controller.dart';

class BookingsPage extends StatelessWidget {
  const BookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = Get.find<LocaleService>().currentLang.value;
    return GetBuilder<BookingController>(
      builder: (ctrl) {
        if (ctrl.bookings.isEmpty) return Center(child: Text('no_bookings'.tr));
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: ctrl.bookings.length,
          itemBuilder: (_, i) {
            final b = ctrl.bookings[i];
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                title: Text(b.property.title(lang)),
                subtitle: Text('${b.months} ${'months'.tr} â€¢ \$${b.totalAmount.toStringAsFixed(0)}'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () => ctrl.cancelBooking(b.id),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
