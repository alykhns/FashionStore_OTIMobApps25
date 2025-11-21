import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otimobapps25/controllers/navigation_controller.dart';
import 'package:otimobapps25/controllers/theme_controllers.dart';
import 'package:otimobapps25/view/home_screen.dart';
import 'package:otimobapps25/view/shopping_screen.dart';
import 'package:otimobapps25/view/wishlist_screen.dart';
import 'package:otimobapps25/view/account_screen.dart';
import 'package:otimobapps25/view/widgets/custom_bottom_navbar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeControllers>(
      builder: (themeController) {
        final NavigationController navigationController = Get.find<NavigationController>();
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Obx(() => AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: IndexedStack(
              key: ValueKey(navigationController.currentIndex.value),
              index: navigationController.currentIndex.value,
              children: const [
                HomeScreen(),
                ShoppingScreen(),
                WishlistScreen(),
                AccountScreen(),
              ],
            ),
          )),
          bottomNavigationBar: const CustomBottomNavbar(),
        );
      },
    );
  }
}