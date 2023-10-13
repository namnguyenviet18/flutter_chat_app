import 'package:flutter_app_chat/pages/application/controller.dart';
import 'package:flutter_app_chat/pages/contact/controller.dart';
import 'package:flutter_app_chat/pages/message/controller.dart';
import 'package:flutter_app_chat/pages/profile/controller.dart';
import 'package:get/get.dart';

class ApplicationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplicationController>(() => ApplicationController());
    Get.lazyPut<ContactController>(() => ContactController());
    Get.lazyPut<MessageController>(() => MessageController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }

}