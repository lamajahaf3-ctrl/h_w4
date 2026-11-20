import 'package:get/get.dart';
import '../../../../core/services/storage_service.dart';
import '../../data/datasources/rental_local_datasource.dart';
import '../../data/repositories/rental_repository_impl.dart';
import '../../domain/repositories/rental_repository.dart';
import '../controllers/booking_controller.dart';
import '../controllers/favorites_controller.dart';
import '../controllers/rental_controller.dart';

class RentalBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<RentalLocalDataSource>()) {
      Get.put<RentalLocalDataSource>(RentalLocalDataSource(), permanent: true);
    }
    Get.lazyPut<RentalRepository>(() => RentalRepositoryImpl(Get.find<RentalLocalDataSource>()));
    Get.lazyPut<BookingRepository>(() => BookingRepositoryImpl(Get.find<RentalLocalDataSource>()));
    Get.lazyPut<RentalController>(() => RentalController(Get.find<RentalRepository>()));
    Get.lazyPut<FavoritesController>(() => FavoritesController(Get.find<StorageService>()));
    Get.lazyPut<BookingController>(() => BookingController(Get.find<BookingRepository>()));
  }
}
