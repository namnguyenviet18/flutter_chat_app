
import 'dart:convert';

import 'package:flutter_app_chat/common/entities/me_list_item.dart';
import 'package:flutter_app_chat/common/entities/user.dart';
import 'package:flutter_app_chat/common/routes/names.dart';
import 'package:flutter_app_chat/pages/profile/state.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
class ProfileController extends GetxController {
  final ProfileState state = ProfileState();
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly'
    ]
  );

  asyncLoadAllData() async {
    String profile = await UserStore.to.getProfile();
    if(profile.isNotEmpty) {
      UserLoginResponseEntity userdata = UserLoginResponseEntity.fromJson(jsonDecode(profile));
      state.head_detail.value = userdata;
    }
  }

  // assets/images/about.png
  // assets/images/account.png
  // assets/images/chat.jpg
  // assets/images/help.png
  // assets/images/logout.png

  // assets/images/privacy.png
  Future<void> onLogout() async {
    UserStore.to.onLogout();
    await _googleSignIn.signOut();
    Get.offAndToNamed(AppRoutes.SIGN_IN);
  }
  @override
  void onInit() {
    super.onInit();
    asyncLoadAllData();

    List myList = [
      {'name': "Account", "icon": "assets/images/account.png", "route": "/account"},
      {"name": "Chat", "icon": "assets/images/chat.jpg", "route": "/chat"},
      {"name": "Notification", "icon": "assets/images/notification.png", "route": "/notification"},
      {"name": "Privacy", "icon": "assets/images/privacy.png", "route": "/privacy"},
      {"name": "Help", "icon": "assets/images/help.png", "route": "/help"},
      {"name": "About", "icon": "assets/images/about.png", "route": "/about"},
      {"name": "Logout", "icon": "assets/images/logout.png", "route": "/logout"}
    ];

    for(int i = 0; i < myList.length; i++) {
      MeListItem result = MeListItem();
      result.icon = myList[i]["icon"];
      result.name = myList[i]["name"];
      result.route = myList[i]["route"];

      state.meListItem.add(result);
    }
  }
}