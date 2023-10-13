
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_chat/common/entities/user.dart';
import 'package:flutter_app_chat/common/routes/names.dart';
import 'package:flutter_app_chat/pages/contact/index.dart';
import 'package:get/get.dart';

import '../../common/entities/msg.dart';
class ContactController extends GetxController {
  ContactController();
  final ContactState state = ContactState();
  final db = FirebaseFirestore.instance;
  final token = UserStore.to.token;

  @override
  void onReady() {
    super.onReady();
    asyncLoadAllData();
  }

  goChat(UserData to_userdata) async {
    var from_messages = await db.collection("message").withConverter(
        fromFirestore: Msg.fromFireStore,
        toFirestore: (Msg msg, options) => msg.toFireStore()
    ).where("from_uid", isEqualTo: token).where("to_uid", isEqualTo: to_userdata.id)
        .get();

    var to_messages = await db.collection("message").withConverter(
        fromFirestore: Msg.fromFireStore,
        toFirestore: (Msg msg, options) => msg.toFireStore()
    ).where("from_uid", isEqualTo: to_userdata.id).where("to_uid", isEqualTo: token)
        .get();

    if(from_messages.docs.isEmpty && to_messages.docs.isEmpty) {
      String profile = await UserStore.to.getProfile();
      UserLoginResponseEntity userdata = UserLoginResponseEntity.fromJson(jsonDecode(profile));
      var msgdata = Msg(
        from_uid: userdata.accessToken,
        to_uid: to_userdata.id,
        from_name: userdata.displayName,
        to_name: to_userdata.name,
        from_avata: userdata.photoUrl,
        to_avata: to_userdata.photourl,
        last_msg: "",
        last_time: Timestamp.now(),
        msg_num: 0
      );

      db.collection("message").withConverter(
          fromFirestore: Msg.fromFireStore,
          toFirestore: (Msg msg, options) => msg.toFireStore()
      ).add(msgdata).then((value) {
        Get.toNamed(AppRoutes.Chat, parameters: {
          "doc_id": value.id,
          "to_uid": to_userdata.id ?? "",
          "to_name": to_userdata.name ?? "",
          "to_avatar": to_userdata.photourl ?? ""
        });
      });
    }else {
      if(from_messages.docs.isNotEmpty) {
        Get.toNamed(AppRoutes.Chat, parameters: {
          "doc_id": from_messages.docs.first.id,
          "to_uid": to_userdata.id ?? "",
          "to_name": to_userdata.name ?? "",
          "to_avatar": to_userdata.photourl ?? ""
        });
      }

      if(to_messages.docs.isNotEmpty) {
        Get.toNamed(AppRoutes.Chat, parameters: {
          "doc_id": to_messages.docs.first.id,
          "to_uid": to_userdata.id ?? "",
          "to_name": to_userdata.name ?? "",
          "to_avatar": to_userdata.photourl ?? ""
        });
      }
    }
  }

  asyncLoadAllData() async {
    var userbase = await db.collection("users").where("id", isNotEqualTo: token)
        .withConverter(
        fromFirestore: UserData.fromFireStore,
        toFirestore: (UserData userdata, options) => userdata.toFireStore()
    ).get();

    for(var doc in userbase.docs) {
      state.contactList.add(doc.data());
      print(doc.toString());
    }
  }
}
