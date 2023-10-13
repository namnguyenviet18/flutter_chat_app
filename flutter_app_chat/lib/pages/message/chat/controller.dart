



import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_chat/common/entities/msg_content.dart';
import 'package:flutter_app_chat/common/entities/user.dart';
import 'package:flutter_app_chat/pages/message/chat/state.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../common/utils/functions.dart';


class ChatController extends GetxController {
  ChatState state = ChatState();
  ChatController();
  var doc_id = null;
  final textController = TextEditingController();
  ScrollController msgScrolling = ScrollController();
  FocusNode contentNode = FocusNode();
  final user_id = UserStore.to.token;
  final db = FirebaseFirestore.instance;
  var listener;
  File? _photo;
  final ImagePicker _picker = ImagePicker();

  Future imgFromGallery() async {
    final pickedFile = await _picker
    .pickImage(source: ImageSource.gallery);
    if(pickedFile != null) {
      _photo = File(pickedFile.path);
      uploadFile();
    }else {
      print("No image selected");
    }

  }

  Future getImageUrl(String name) async {
    final spaceRef = FirebaseStorage.instance.ref('chat').child(name);
    var str = await spaceRef.getDownloadURL();
    return str ?? "";
  }

  sendImageMessage(String url) async {
    final content = MsgContent(
      uid: user_id,
      content: url,
      type: "image",
      addtime: Timestamp.now()
    );

    await db.collection("message").doc(doc_id).collection("msglist")
    .withConverter(
      fromFirestore: MsgContent.fromFireStore,
      toFirestore: (MsgContent msgcontent, options) => msgcontent.toFireStore()
    ).add(content).then((DocumentReference doc) {
      print("Document snapshot added with id, ${doc.id}");
      textController.clear();
      Get.focusScope?.unfocus();
    });

    await db.collection("message").doc(doc_id).update({
      "last_msg":" [image] ",
      "last_time": Timestamp.now()
    });
  }

  Future uploadFile() async {
    if(_photo == null) {
      return;
    }
    final fileName = getRandomString(15) + extension(_photo!.path);

    try {
      final ref = FirebaseStorage.instance.ref("chat").child(fileName);
      await ref.putFile(_photo!).snapshotEvents.listen((event) async {
        switch(event.state) {
          case TaskState.running:
            break;
          case TaskState.paused:
            break;
          case TaskState.success:
            String imgUrl = await getImageUrl(fileName);
            sendImageMessage(imgUrl);
          case TaskState.canceled:
            // TODO: Handle this case.
          case TaskState.error:
            // TODO: Handle this case.
        }
      });
    }catch (e) {
      print("there's an error");
    }
  }


  @override
  void onInit() {
    super.onInit();
    var data = Get.parameters;
    doc_id = data['doc_id'];
    state.to_uid.value = data['to_uid'] ?? "";
    state.to_name.value = data['to_name'] ?? "";
    state.to_avatar.value = data['to_avatar'] ?? "";
  }


  sendMessage() async {
    String sendContent = textController.text.trim();
    final content = MsgContent(
      uid: user_id,
      content: sendContent,
      type: "text",
      addtime: Timestamp.now()
    );

    await db.collection("message").doc(doc_id).collection("msglist")
    .withConverter(
      fromFirestore: MsgContent.fromFireStore,
      toFirestore: (MsgContent msgcontent, options) => msgcontent.toFireStore()
    ).add(content).then((DocumentReference doc) {
      print("Docudment snapshot added with id, ${doc.id}");
      textController.clear();
      Get.focusScope?.unfocus();
    });
    
    await db.collection("message").doc(doc_id).update({
      "last_msg": sendContent,
      "last_time": Timestamp.now()
    });
  }

  @override
  void onReady() {
    super.onReady();
    var messages = db.collection("message").doc(doc_id).collection("msglist")
    .withConverter(
      fromFirestore: MsgContent.fromFireStore,
      toFirestore: (MsgContent msgcontent, options) => msgcontent.toFireStore()
    ).orderBy("addtime", descending: false);

    state.msgcontentList.clear();

    listener = messages.snapshots().listen((event) {
      for(var change in event.docChanges) {
        switch(change.type) {
          case DocumentChangeType.added:
            if(change.doc.data() != null) {
              state.msgcontentList.insert(0, change.doc.data()!);
            }
            break;
          case DocumentChangeType.modified:
            break;
          case DocumentChangeType.removed:
            break;
        }
      }
    },
      onError: (error) => print("Listen failed: $error")
    );
    getLocation();
  }

  getLocation() async {
    try {
      var user_location = await db.collection("users").where("id", isEqualTo: state.to_uid.value).withConverter(
          fromFirestore: UserData.fromFireStore,
          toFirestore: (UserData userdata, options) => userdata.toFireStore()
      ).get();
      var location = user_location.docs.first.data().location;
      if(location != "") {
        state.to_location.value = location ?? "unknown";
      }
    } catch(e) {
      print(e.toString());
    }

  }

  @override
  void dispose() {
    msgScrolling.dispose();
    listener.cancel();
    super.dispose();
  }
}