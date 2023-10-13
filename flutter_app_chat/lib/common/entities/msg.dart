

import 'package:cloud_firestore/cloud_firestore.dart';

class Msg {
  final String? from_uid;
  final String? to_uid;
  final String? from_name;
  final String? to_name;
  final String? from_avata;
  final String? to_avata;
  final String? last_msg;
  final Timestamp? last_time;
  final int? msg_num;

  Msg({
    this.from_uid,
    this.to_uid,
    this.from_name,
    this.to_name,
    this.from_avata,
    this.to_avata,
    this.last_msg,
    this.last_time,
    this.msg_num
  });

  factory Msg.fromFireStore(
      DocumentSnapshot<Map<String,  dynamic>> snapshot,
      SnapshotOptions? options
      ) {
      final data = snapshot.data();
      return Msg(
        from_uid: data?['from_uid'],
        to_uid: data?['to_uid'],
        from_name: data?['from_name'],
        to_name: data?['to_name'],
        from_avata: data?['from_avata'],
        to_avata: data?['to_avata'],
        last_msg: data?['last_msg'],
        last_time: data?['last_time'],
        msg_num: data?['msg_num']
      );
    }


    Map<String, dynamic> toFireStore() {
      return {
        if(from_uid != null) "from_uid": from_uid,
        if(to_uid != null) "to_uid": to_uid,
        if(from_name != null) "from_name": from_name,
        if(to_name != null) "to_name": to_name,
        if(from_avata != null) "from_avata": from_avata,
        if(to_avata != null) "to_avata": to_avata,
        if(last_msg != null) "last_msg": last_msg,
        if(last_time != null) "last_time": last_time,
        if(msg_num != null) "msg_num": msg_num
      };
    }

}