enum PropertyCategory { all, apartment, studio, villa, office }

class PropertyEntity {
  final String id;
  final String titleAr;
  final String titleEn;
  final String locationAr;
  final String locationEn;
  final String descriptionAr;
  final String descriptionEn;
  final PropertyCategory category;
  final double monthlyPrice;
  final int rooms;
  final int bathrooms;
  final int areaSqm;
  final double rating;
  final String imageUrl;

  const PropertyEntity({
    required this.id,
    required this.titleAr,
    required this.titleEn,
    required this.locationAr,
    required this.locationEn,
    required this.descriptionAr,
    required this.descriptionEn,
    required this.category,
    required this.monthlyPrice,
    required this.rooms,
    required this.bathrooms,
    required this.areaSqm,
    required this.rating,
    required this.imageUrl,
  });

  String title(String lang) => lang == 'ar' ? titleAr : titleEn;
  String location(String lang) => lang == 'ar' ? locationAr : locationEn;
  String description(String lang) => lang == 'ar' ? descriptionAr : descriptionEn;
}
