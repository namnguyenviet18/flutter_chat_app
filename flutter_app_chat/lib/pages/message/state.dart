

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_chat/common/entities/msg.dart';
import 'package:get/get.dart';

class MessageState {
  RxList<QueryDocumentSnapshot<Msg>>  msgList = <QueryDocumentSnapshot<Msg>>[].obs;

}