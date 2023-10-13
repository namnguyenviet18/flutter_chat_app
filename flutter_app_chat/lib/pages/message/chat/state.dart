

import 'package:flutter_app_chat/common/entities/msg_content.dart';
import 'package:get/get.dart';

class ChatState {
  RxList<MsgContent> msgcontentList = <MsgContent>[].obs;
  var to_uid = "".obs;
  var to_name = "".obs;
  var to_avatar = "".obs;
  var to_location = "unknown".obs;
}