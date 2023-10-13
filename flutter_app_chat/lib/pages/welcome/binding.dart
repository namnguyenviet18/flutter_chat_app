

import 'package:get/get.dart';

import 'controller.dart';
class WelComeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelComeController>(() => WelComeController());
  }

}