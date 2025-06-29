import 'package:get/get.dart';

class TypewriterController extends GetxController {
  var key = 0.obs;

  void restartAnimation() {
    key.value++;
  }
}
