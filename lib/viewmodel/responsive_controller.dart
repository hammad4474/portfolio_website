import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';

class ResponsiveController extends GetxController {
  // Screen size breakpoints
  static const double mobileBreakpoint = 768;
  static const double tabletBreakpoint = 1024;
  static const double desktopBreakpoint = 1440;

  // Observable screen dimensions
  var screenWidth = 0.0.obs;
  var screenHeight = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    updateScreenSize();

    // For web, add a periodic check for screen size changes
    if (kIsWeb) {
      ever(screenWidth, (_) => update());
      ever(screenHeight, (_) => update());
    }
  }

  // Update screen dimensions - call this when screen size changes
  void updateScreenSize() {
    final newWidth = Get.width;
    final newHeight = Get.height;

    if (screenWidth.value != newWidth || screenHeight.value != newHeight) {
      screenWidth.value = newWidth;
      screenHeight.value = newHeight;
      update(); // Trigger UI rebuild
    }
  }

  // Force update method for manual refresh
  void forceUpdate() {
    updateScreenSize();
  }

  // Check device types - now reactive
  bool get isMobile => screenWidth.value < mobileBreakpoint;
  bool get isTablet =>
      screenWidth.value >= mobileBreakpoint &&
      screenWidth.value < desktopBreakpoint;
  bool get isDesktop => screenWidth.value >= desktopBreakpoint;

  // Responsive padding
  EdgeInsets get horizontalPadding {
    if (isMobile) {
      return EdgeInsets.symmetric(
          horizontal: screenWidth.value * 0.05, vertical: 20.0);
    } else if (isTablet) {
      return EdgeInsets.symmetric(
          horizontal: screenWidth.value * 0.08, vertical: 20.0);
    } else {
      return EdgeInsets.symmetric(
          horizontal: screenWidth.value * 0.12, vertical: 20.0);
    }
  }

  // Responsive font sizes with smoother scaling
  double get titleFontSize {
    if (isMobile) {
      double scaledSize = screenWidth.value * 0.08;
      return scaledSize.clamp(32.0, 50.0); // Min 32px, Max 50px
    }
    if (isTablet) return 60;
    return 80;
  }

  double get subtitleFontSize {
    if (isMobile) {
      double scaledSize = screenWidth.value * 0.04;
      return scaledSize.clamp(14.0, 20.0); // Min 14px, Max 20px
    }
    if (isTablet) return 20;
    return 24;
  }

  double get bodyFontSize {
    if (isMobile) {
      double scaledSize = screenWidth.value * 0.035;
      return scaledSize.clamp(12.0, 16.0); // Min 12px, Max 16px
    }
    if (isTablet) return 16;
    return 18;
  }

  double get sectionTitleFontSize {
    if (isMobile) {
      double scaledSize = screenWidth.value * 0.07;
      return scaledSize.clamp(24.0, 32.0); // Min 24px, Max 32px
    }
    if (isTablet) return 35;
    return 45;
  }

  double get buttonFontSize {
    if (isMobile) {
      double scaledSize = screenWidth.value * 0.03;
      return scaledSize.clamp(10.0, 14.0); // Min 10px, Max 14px
    }
    if (isTablet) return 13;
    return 14;
  }

  // Responsive spacing
  double get sectionSpacing => screenHeight.value * (isMobile ? 0.03 : 0.05);
  double get elementSpacing => screenHeight.value * (isMobile ? 0.02 : 0.03);

  // Profile image size
  double get profileImageSize {
    if (isMobile) return screenWidth.value * 0.6;
    if (isTablet) return screenWidth.value * 0.35;
    return 400;
  }

  // Button padding
  EdgeInsets get buttonPadding {
    if (isMobile) {
      return EdgeInsets.symmetric(horizontal: 16, vertical: 12);
    } else {
      return EdgeInsets.symmetric(horizontal: 20, vertical: 20);
    }
  }

  // Project card dimensions
  double get projectCardWidth {
    if (isMobile) return screenWidth.value * 0.9;
    if (isTablet) return screenWidth.value * 0.4;
    return screenWidth.value * 0.25;
  }

  // Skills grid columns
  int get skillsGridCount {
    if (isMobile) return 2;
    if (isTablet) return 4;
    return 6;
  }

  // Content width for text sections
  double get contentWidth {
    if (isMobile) return screenWidth.value * 0.9;
    if (isTablet) return screenWidth.value * 0.8;
    return screenWidth.value * 0.7;
  }

  // Check if should use column layout instead of row
  bool get shouldUseColumnLayout => isMobile;

  // Responsive gap between elements
  double get gapBetweenElements {
    if (isMobile) return screenWidth.value * 0.05;
    if (isTablet) return screenWidth.value * 0.06;
    return screenWidth.value * 0.08;
  }

  // Header height
  double get headerHeight => screenHeight.value * (isMobile ? 0.08 : 0.15);
}
