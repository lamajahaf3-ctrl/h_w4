import '../../../../core/errors/failures.dart';
import '../entities/booking_entity.dart';
import '../entities/property_entity.dart';

abstract class RentalRepository {
  Future<({List<PropertyEntity>? data, Failure? failure})> getProperties();
}

abstract class BookingRepository {
  List<BookingEntity> getBookings();
  void addBooking(BookingEntity booking);
  void removeBooking(String bookingId);
}
