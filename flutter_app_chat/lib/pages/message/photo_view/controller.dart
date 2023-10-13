
import 'package:flutter_app_chat/pages/message/photo_view/state.dart';
import 'package:get/get.dart';

class PhotoImageViewController extends GetxController {
  final PhotoImageViewState state = PhotoImageViewState();

  @override
  void onInit() {
    super.onInit();
    var data = Get.parameters;
    if(data['url'] != null) {
      state.url.value = data['url']!;
    }
  }
}