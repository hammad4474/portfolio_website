import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/view/home_screen.dart';
import 'package:portfolio_website/viewmodel/theme_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());

    return GetMaterialApp(
      title: 'Portfolio Website',
      theme: themeController.lightTheme.copyWith(
        textTheme: themeController.lightTheme.textTheme.apply(
          fontFamily: 'Poppins',
        ),
      ),
      darkTheme: themeController.darkTheme.copyWith(
        textTheme: themeController.darkTheme.textTheme.apply(
          fontFamily: 'Poppins',
        ),
      ),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      defaultTransition: Transition.fade,
      home: HomeScreen(),
    );
  }
}
