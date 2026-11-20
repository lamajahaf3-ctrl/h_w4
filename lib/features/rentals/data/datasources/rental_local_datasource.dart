import '../../domain/entities/booking_entity.dart';
import '../../domain/entities/property_entity.dart';
import '../models/property_model.dart';

class RentalLocalDataSource {
  final List<BookingEntity> _bookings = [];

  Future<List<PropertyModel>> fetchProperties() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return const [
      PropertyModel(
        id: 'p1',
        titleAr: 'ط´ظ‚ط© ظ…ظˆط¯ط±ظ† ظپظٹ ط­ظٹ ط­ط¯ط©',
        titleEn: 'Modern Apartment in Hadda',
        locationAr: 'طµظ†ط¹ط§ط، - ط­ظٹ ط­ط¯ط©',
        locationEn: 'Sanaa - Hadda',
        descriptionAr: 'ط´ظ‚ط© ظ…ط±ظٹط­ط© ظ‚ط±ظٹط¨ط© ظ…ظ† ط§ظ„ط®ط¯ظ…ط§طھ ظˆط§ظ„ظ…ط±ط§ظپظ‚ ظ…ط¹ ظ…ظˆظ‚ظپ ط®ط§طµ.',
        descriptionEn: 'Comfortable apartment near amenities with private parking.',
        category: PropertyCategory.apartment,
        monthlyPrice: 450,
        rooms: 3,
        bathrooms: 2,
        areaSqm: 145,
        rating: 4.8,
        imageUrl: 'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?w=800',
      ),
      PropertyModel(
        id: 'p2',
        titleAr: 'ط§ط³طھظˆط¯ظٹظˆ ط¹طµط±ظٹ ظ…طھظƒط§ظ…ظ„',
        titleEn: 'Serviced Studio',
        locationAr: 'ط§ظ„ط±ظٹط§ط¶ - ط§ظ„ط¹ظ„ظٹط§',
        locationEn: 'Riyadh - Al Olaya',
        descriptionAr: 'ط§ط³طھظˆط¯ظٹظˆ ط¹ظ…ظ„ظٹ ظ…ط¬ظ‡ط² ط¨ط§ظ„ظƒط§ظ…ظ„ ظˆظ…ظ†ط§ط³ط¨ ظ„ظ„ط¹ظ…ظ„ ظˆط§ظ„ط³ظƒظ†.',
        descriptionEn: 'Practical studio suited for work and living.',
        category: PropertyCategory.studio,
        monthlyPrice: 320,
        rooms: 1,
        bathrooms: 1,
        areaSqm: 62,
        rating: 4.6,
        imageUrl: 'https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800',
      ),
      PropertyModel(
        id: 'p3',
        titleAr: 'ظپظٹظ„ط§ ط¹ط§ط¦ظ„ظٹط© ط¨ط­ط¯ظٹظ‚ط©',
        titleEn: 'Family Villa with Garden',
        locationAr: 'ط¬ط¯ط© - ط§ظ„ط´ط§ط·ط¦',
        locationEn: 'Jeddah - Al Shati',
        descriptionAr: 'ظپظٹظ„ط§ ظˆط§ط³ط¹ط© ظ„ظ„ط¹ط§ط¦ظ„ط§طھ ظ…ط¹ ظپظ†ط§ط، ط®ط§ط±ط¬ظٹ ظˆظ…ط·ط¨ط® ظ…طھظƒط§ظ…ظ„.',
        descriptionEn: 'Spacious family villa with courtyard and full kitchen.',
        category: PropertyCategory.villa,
        monthlyPrice: 1200,
        rooms: 5,
        bathrooms: 4,
        areaSqm: 320,
        rating: 4.9,
        imageUrl: 'https://images.unsplash.com/photo-1613490493576-7fde63acd811?w=800',
      ),
      PropertyModel(
        id: 'p4',
        titleAr: 'ظ…ظƒطھط¨ ط¥ط¯ط§ط±ظٹ ط¬ط§ظ‡ط²',
        titleEn: 'Executive Office',
        locationAr: 'ط§ظ„ط±ظٹط§ط¶ - ط·ط±ظٹظ‚ ط§ظ„ظ…ظ„ظƒ ظپظ‡ط¯',
        locationEn: 'Riyadh - King Fahd Rd',
        descriptionAr: 'ظ…ظƒطھط¨ ظ…ظ†ط¸ظ… ظ„ظ„ظپط±ظ‚ ظˆط§ظ„ط´ط±ظƒط§طھ ط§ظ„ظ†ط§ط´ط¦ط©.',
        descriptionEn: 'Organized workspace for teams and startups.',
        category: PropertyCategory.office,
        monthlyPrice: 700,
        rooms: 2,
        bathrooms: 1,
        areaSqm: 110,
        rating: 4.7,
        imageUrl: 'https://images.unsplash.com/photo-1497366216548-37526070297c?w=800',
      ),
    ];
  }

  List<BookingEntity> getBookings() => List.unmodifiable(_bookings);
  void addBooking(BookingEntity booking) => _bookings.insert(0, booking);
  void removeBooking(String bookingId) => _bookings.removeWhere((b) => b.id == bookingId);
}
