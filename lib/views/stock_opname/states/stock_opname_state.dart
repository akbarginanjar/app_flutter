import 'package:get/get.dart';

class Controller extends GetxController {
  @override
  void onInit() {
    // called immediately after the widget is allocated memory

    super.onInit();
  }

  @override
  void onReady() {
    // called after the widget is rendered on screen
    // showIntroDialog();
    super.onReady();
  }

  @override
  void onClose() {
    // called just before the Controller is deleted from memory
    // closeStream();
    super.onClose();
  }
}
