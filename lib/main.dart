import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:otimobapps25/controllers/theme_controllers.dart';
import 'package:get/get.dart';
import 'package:otimobapps25/utils/app_themes.dart';
import 'package:otimobapps25/view/splash_screen.dart';
import 'package:otimobapps25/controllers/auth_controllers.dart';
import 'package:otimobapps25/controllers/navigation_controller.dart';

void main() async {
  await GetStorage.init();
  Get.put(ThemeControllers());
  Get.put(AuthController());
  Get.put(NavigationController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeControllers = Get.find<ThemeControllers>();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fashion Store',
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: themeControllers.theme,
      defaultTransition: Transition.rightToLeftWithFade,
      home: SplashScreen(),
    );
  }
}

