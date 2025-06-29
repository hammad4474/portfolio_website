import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/viewmodel/theme_controller.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Obx(() => Container(
          decoration: BoxDecoration(
            color: themeController.cardColor,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: themeController.borderColor,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(25),
              onTap: () => themeController.toggleTheme(),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      child: Icon(
                        themeController.isDarkMode.value
                            ? Icons.light_mode_rounded
                            : Icons.dark_mode_rounded,
                        key: ValueKey(themeController.isDarkMode.value),
                        color: themeController.isDarkMode.value
                            ? Colors.orange[300]
                            : Color(0xff6726f2),
                        size: 20,
                      ),
                    ),
                    SizedBox(width: 8),
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      child: Text(
                        themeController.isDarkMode.value ? 'Light' : 'Dark',
                        key: ValueKey(themeController.isDarkMode.value),
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: themeController.textColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
