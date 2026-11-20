import 'package:get/get.dart';
import '../../../../core/services/storage_service.dart';
import '../../data/datasources/auth_local_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthLocalDataSource>(() => AuthLocalDataSource(Get.find<StorageService>()));
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(Get.find<AuthLocalDataSource>()));
    Get.lazyPut<AuthController>(() => AuthController(Get.find<AuthRepository>()));
  }
}
