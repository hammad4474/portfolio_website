import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  // Observable for theme mode
  var isDarkMode = false.obs;

  // Toggle theme method
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeTheme(isDarkMode.value ? darkTheme : lightTheme);
  }

  // Light theme configuration
  ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins',
        primaryColor: Color(0xff6726f2),
        colorScheme: ColorScheme.light(
          primary: Color(0xff6726f2),
          secondary: Color(0xff6726f2),
          surface: Colors.white,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black,
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(fontFamily: 'Poppins', color: Colors.black),
          displayMedium: TextStyle(fontFamily: 'Poppins', color: Colors.black),
          displaySmall: TextStyle(fontFamily: 'Poppins', color: Colors.black),
          headlineLarge: TextStyle(fontFamily: 'Poppins', color: Colors.black),
          headlineMedium: TextStyle(fontFamily: 'Poppins', color: Colors.black),
          headlineSmall: TextStyle(fontFamily: 'Poppins', color: Colors.black),
          titleLarge: TextStyle(fontFamily: 'Poppins', color: Colors.black),
          titleMedium: TextStyle(fontFamily: 'Poppins', color: Colors.black),
          titleSmall: TextStyle(fontFamily: 'Poppins', color: Colors.black),
          bodyLarge: TextStyle(fontFamily: 'Poppins', color: Colors.black),
          bodyMedium:
              TextStyle(fontFamily: 'Poppins', color: Color(0xFF4e525a)),
          bodySmall: TextStyle(fontFamily: 'Poppins', color: Color(0xFF4e525a)),
          labelLarge: TextStyle(fontFamily: 'Poppins', color: Colors.black),
          labelMedium: TextStyle(fontFamily: 'Poppins', color: Colors.black),
          labelSmall: TextStyle(fontFamily: 'Poppins', color: Colors.black),
        ),
      );

  // Dark theme configuration
  ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xFF1a1a1a),
        fontFamily: 'Poppins',
        primaryColor: Color(0xff6726f2),
        colorScheme: ColorScheme.dark(
          primary: Color(0xff6726f2),
          secondary: Color(0xff6726f2),
          surface: Color(0xFF2d2d2d),
          background: Color(0xFF1a1a1a),
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.white,
          onBackground: Colors.white,
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(fontFamily: 'Poppins', color: Colors.white),
          displayMedium: TextStyle(fontFamily: 'Poppins', color: Colors.white),
          displaySmall: TextStyle(fontFamily: 'Poppins', color: Colors.white),
          headlineLarge: TextStyle(fontFamily: 'Poppins', color: Colors.white),
          headlineMedium: TextStyle(fontFamily: 'Poppins', color: Colors.white),
          headlineSmall: TextStyle(fontFamily: 'Poppins', color: Colors.white),
          titleLarge: TextStyle(fontFamily: 'Poppins', color: Colors.white),
          titleMedium: TextStyle(fontFamily: 'Poppins', color: Colors.white),
          titleSmall: TextStyle(fontFamily: 'Poppins', color: Colors.white),
          bodyLarge: TextStyle(fontFamily: 'Poppins', color: Colors.white),
          bodyMedium:
              TextStyle(fontFamily: 'Poppins', color: Color(0xFFb0b0b0)),
          bodySmall: TextStyle(fontFamily: 'Poppins', color: Color(0xFFb0b0b0)),
          labelLarge: TextStyle(fontFamily: 'Poppins', color: Colors.white),
          labelMedium: TextStyle(fontFamily: 'Poppins', color: Colors.white),
          labelSmall: TextStyle(fontFamily: 'Poppins', color: Colors.white),
        ),
      );

  // Get current theme colors
  Color get backgroundColor =>
      isDarkMode.value ? Color(0xFF1a1a1a) : Colors.white;
  Color get cardColor => isDarkMode.value ? Color(0xFF2d2d2d) : Colors.white;
  Color get textColor => isDarkMode.value ? Colors.white : Colors.black;
  Color get subtitleColor =>
      isDarkMode.value ? Color(0xFFb0b0b0) : Color(0xFF4e525a);
  Color get borderColor =>
      isDarkMode.value ? Color(0xFF404040) : Colors.grey.withOpacity(0.2);
}
