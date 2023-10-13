

import 'package:flutter_app_chat/pages/message/photo_view/controller.dart';
import 'package:get/get.dart';

class PhotoImageViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhotoImageViewController>(() => PhotoImageViewController());
  }

}