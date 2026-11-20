import '../../../../core/errors/failures.dart';
import '../../domain/entities/booking_entity.dart';
import '../../domain/entities/property_entity.dart';
import '../../domain/repositories/rental_repository.dart';
import '../datasources/rental_local_datasource.dart';

class RentalRepositoryImpl implements RentalRepository {
  final RentalLocalDataSource _dataSource;
  RentalRepositoryImpl(this._dataSource);

  @override
  Future<({List<PropertyEntity>? data, Failure? failure})> getProperties() async {
    try {
      final items = await _dataSource.fetchProperties();
      return (data: items, failure: null);
    } catch (e) {
      return (data: null, failure: Failure(e.toString()));
    }
  }
}

class BookingRepositoryImpl implements BookingRepository {
  final RentalLocalDataSource _dataSource;
  BookingRepositoryImpl(this._dataSource);

  @override
  List<BookingEntity> getBookings() => _dataSource.getBookings();

  @override
  void addBooking(BookingEntity booking) => _dataSource.addBooking(booking);

  @override
  void removeBooking(String bookingId) => _dataSource.removeBooking(bookingId);
}
