import 'package:get/get.dart';
import '../../features/auth/presentation/bindings/auth_binding.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/rentals/presentation/bindings/rental_binding.dart';
import '../../features/rentals/presentation/pages/main_shell_page.dart';
import '../../features/rentals/presentation/pages/property_details_page.dart';
import 'app_routes.dart';
import 'auth_middleware.dart';

class AppPages {
  AppPages._();
  static final pages = [
    GetPage(name: AppRoutes.main, page: () => const MainShellPage(), binding: RentalBinding()),
    GetPage(name: AppRoutes.propertyDetails, page: () => const PropertyDetailsPage(), binding: RentalBinding()),
    GetPage(name: AppRoutes.login, page: () => const LoginPage(), binding: AuthBinding(), middlewares: [AuthMiddleware()]),
  ];
}
