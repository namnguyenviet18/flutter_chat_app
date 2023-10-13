
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_chat/common/entities/msg.dart';
import 'package:flutter_app_chat/common/entities/user.dart';
import 'package:flutter_app_chat/pages/message/state.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:location/location.dart';

import '../../common/entities/my_location.dart';
import '../../common/utils/http_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
class MessageController extends GetxController {
  MessageController();
  final token = UserStore.to.token;
  final db = FirebaseFirestore.instance;
  final MessageState state = MessageState();
  var listener;

  final RefreshController refreshController = RefreshController(
      initialRefresh: true
  );

  @override
  void onReady() {
    super.onReady();
    //getUserLocation();
    getFcmToken();
  }

  onRefresh() {
    asyncLoadData().then((_) {
      refreshController.refreshCompleted(resetFooterState: true);

    }).catchError((_) {
      refreshController.loadFailed();
    });
  }

  onLoading() {
    asyncLoadData().then((_) {
      refreshController.loadComplete();
    }).catchError((_) {
      refreshController.loadFailed();
    });
  }

  asyncLoadData()  async {
    var from_message = await db.collection("message").withConverter(
        fromFirestore: Msg.fromFireStore,
        toFirestore: (Msg msg, options) => msg.toFireStore()
    ).where("from_uid", isEqualTo: token).get();

    var to_message = await db.collection("message").withConverter(
        fromFirestore: Msg.fromFireStore,
        toFirestore: (Msg msg, options) => msg.toFireStore()
    ).where("to_id", isEqualTo: token).get();

    state.msgList.clear();

    if(from_message.docs.isNotEmpty) {
      state.msgList.assignAll(from_message.docs);
    }

    if(to_message.docs.isNotEmpty) {
      state.msgList.assignAll(to_message.docs);
    }


  }

  // getUserLocation() async {
  //   try {
  //     final location = await Location().getLocation();
  //     String address = "${location.latitude}, ${location.longitude}";
  //     String url = """https://maps.googleapis.com/maps/api/geocode/json?
  //     address=${address}&key=AIzaSyBHJTVrxvBSvjeboUpA_UIXPAnvzgsJLgE""";
  //
  //     var response = HttpUtil().get(url);
  //     MyLocation location_res = MyLocation.fromJson(response);
  //     if(location_res.status == "OK") {
  //       String? myAddress = location_res.results?.first.formattedAddress;
  //       if(myAddress != null) {
  //         var user_location = await db.collection("users").where("id", isEqualTo: token).get();
  //         if(user_location.docs.isNotEmpty) {
  //           var doc_id = user_location.docs.first.id;
  //           await db.collection("user").doc(doc_id).update({"location": myAddress});
  //
  //         }
  //       }
  //     }
  //   } catch(e) {
  //     print("getting error $e");
  //   }
  // }

  getFcmToken() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    if(fcmToken != null) {
      var user = await db.collection("users").where("id", isEqualTo: token).get();
      if(user.docs.isNotEmpty) {
        var doc_id = user.docs.first.id;
        await db.collection("users").doc(doc_id).update({"fcmtoken": fcmToken});
      }
    }
  }

}