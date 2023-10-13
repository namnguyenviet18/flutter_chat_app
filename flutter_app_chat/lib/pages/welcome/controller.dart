

import 'package:flutter_app_chat/pages/welcome/state.dart';
import 'package:get/get.dart';

import '../../common/routes/names.dart';
import '../../common/store/config.dart';

class WelComeController extends GetxController {
  final state = WelComeState();
  WelComeController();
  changPage(int index) async {
    state.index.value = index;
  }
  handlesSignIn() async {
    await ConfigStore.to.saveAlreadyOpen();
    Get.offAndToNamed(AppRoutes.SIGN_IN);
  }
}