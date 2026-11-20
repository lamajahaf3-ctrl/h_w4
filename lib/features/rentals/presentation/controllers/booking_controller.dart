import 'package:get/get.dart';
import '../../domain/entities/booking_entity.dart';
import '../../domain/entities/property_entity.dart';
import '../../domain/repositories/rental_repository.dart';

class BookingController extends GetxController {
  final BookingRepository _repository;
  BookingController(this._repository);

  int selectedMonths = 1;
  List<BookingEntity> bookings = [];

  @override
  void onInit() {
    super.onInit();
    bookings = List.from(_repository.getBookings());
  }

  void setMonths(int months) {
    selectedMonths = months;
    update();
  }

  void createBooking(PropertyEntity property) {
    _repository.addBooking(
      BookingEntity(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        property: property,
        months: selectedMonths,
        createdAt: DateTime.now(),
      ),
    );
    bookings = List.from(_repository.getBookings());
    selectedMonths = 1;
    update();
    Get.snackbar('Ejary', 'booking_confirmed'.tr, snackPosition: SnackPosition.BOTTOM);
  }

  void cancelBooking(String id) {
    _repository.removeBooking(id);
    bookings = List.from(_repository.getBookings());
    update();
  }
}
