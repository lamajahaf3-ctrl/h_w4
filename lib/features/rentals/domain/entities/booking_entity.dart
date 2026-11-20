import 'property_entity.dart';

class BookingEntity {
  final String id;
  final PropertyEntity property;
  final int months;
  final DateTime createdAt;

  const BookingEntity({
    required this.id,
    required this.property,
    required this.months,
    required this.createdAt,
  });

  double get totalAmount => property.monthlyPrice * months;
}
