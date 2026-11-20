import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/localization/locale_service.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/services/storage_service.dart';
import '../../../../core/theme/theme_service.dart';
import 'bookings_page.dart';
import 'favorites_page.dart';
import 'home_page.dart';

class MainShellPage extends StatefulWidget {
  const MainShellPage({super.key});

  @override
  State<MainShellPage> createState() => _MainShellPageState();
}

class _MainShellPageState extends State<MainShellPage> {
  int _index = 0;
  final List<Widget> _pages = const [HomePage(), FavoritesPage(), BookingsPage()];

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<ThemeService>();
    final locale = Get.find<LocaleService>();
    final storage = Get.find<StorageService>();

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('app_title'.tr),
          actions: [
            IconButton(icon: const Icon(Icons.translate), onPressed: locale.toggleLanguage),
            IconButton(
              icon: Icon(theme.isDark.value ? Icons.light_mode : Icons.dark_mode),
              onPressed: theme.toggleTheme,
            ),
            IconButton(
              icon: Icon(storage.isLoggedIn ? Icons.logout : Icons.login),
              onPressed: () async {
                if (storage.isLoggedIn) {
                  await storage.setLoggedIn(false);
                  Get.snackbar('Ejary', 'logout'.tr);
                } else {
                  Get.toNamed(AppRoutes.login);
                }
                setState(() {});
              },
            ),
          ],
        ),
        body: _pages[_index],
        bottomNavigationBar: NavigationBar(
          selectedIndex: _index,
          onDestinationSelected: (i) => setState(() => _index = i),
          destinations: [
            NavigationDestination(icon: const Icon(Icons.explore_outlined), selectedIcon: const Icon(Icons.explore), label: 'explore'.tr),
            NavigationDestination(icon: const Icon(Icons.favorite_border), selectedIcon: const Icon(Icons.favorite), label: 'favorites'.tr),
            NavigationDestination(icon: const Icon(Icons.calendar_today_outlined), selectedIcon: const Icon(Icons.calendar_today), label: 'bookings'.tr),
          ],
        ),
      ),
    );
  }
}
