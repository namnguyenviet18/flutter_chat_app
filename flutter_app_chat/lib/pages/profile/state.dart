
import 'package:flutter_app_chat/common/entities/user.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../common/entities/me_list_item.dart';

class ProfileState {
  var head_detail = Rx<UserLoginResponseEntity?>(null);
  RxList<MeListItem> meListItem = <MeListItem>[].obs;

}