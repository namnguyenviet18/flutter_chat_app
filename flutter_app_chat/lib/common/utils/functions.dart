

import 'dart:math';
import 'package:intl/intl.dart';

String getRandomString(int length) {
  const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  Random random = Random();
  return String.fromCharCodes(Iterable.generate(length, (_) =>
      characters.codeUnitAt(random.nextInt(characters.length))));
}

String duTimeLineFormat(DateTime dt) {
  var now = DateTime.now();
  var differance = now.difference(dt);
  if(differance.inMinutes < 60) {
    return "${differance.inMinutes} m ago";
  }

  if(differance.inHours < 24) {
    return "${differance.inHours} h ago";
  }

  else if(differance.inDays < 30) {
    return "${differance.inDays} d ago";
  }

  else if(differance.inDays < 365) {
    final dtFormat = DateFormat("MM-dd");
    return dtFormat.format(dt);
  }

  else {
    final dtFormat = DateFormat("yyyy-MM-dd");
    var str = dtFormat.format(dt);
    return str;
  }
}