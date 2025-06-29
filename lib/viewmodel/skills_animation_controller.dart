import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SkillsAnimationController extends GetxController
    with GetTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> slideAnimation;

  // Observable for animation value
  RxDouble animationValue = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    _initializeAnimation();
  }

  void _initializeAnimation() {
    // Create animation controller with 25 seconds duration for slower movement
    animationController = AnimationController(
      duration: Duration(seconds: 25),
      vsync: this,
    );

    // Create linear animation
    slideAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.linear,
    ));

    // Listen to animation changes and update observable
    slideAnimation.addListener(() {
      animationValue.value = slideAnimation.value;
    });

    // Start the animation and repeat infinitely
    animationController.repeat();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  // Method to pause animation
  void pauseAnimation() {
    animationController.stop();
  }

  // Method to resume animation
  void resumeAnimation() {
    animationController.repeat();
  }

  // Method to reset animation
  void resetAnimation() {
    animationController.reset();
    animationController.repeat();
  }
}
