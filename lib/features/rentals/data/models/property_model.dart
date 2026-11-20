import '../../domain/entities/property_entity.dart';

class PropertyModel extends PropertyEntity {
  const PropertyModel({
    required super.id,
    required super.titleAr,
    required super.titleEn,
    required super.locationAr,
    required super.locationEn,
    required super.descriptionAr,
    required super.descriptionEn,
    required super.category,
    required super.monthlyPrice,
    required super.rooms,
    required super.bathrooms,
    required super.areaSqm,
    required super.rating,
    required super.imageUrl,
  });
}
