

import 'package:flutter/cupertino.dart';
import 'package:flutter_app_chat/common/entities/user.dart';
import 'package:flutter_app_chat/common/routes/names.dart';
import 'package:flutter_app_chat/common/store/config.dart';
import 'package:get/get.dart';

class RouteWelcomeMiddleware extends GetMiddleware {

  @override
  int? priority = 0;

  RouteWelcomeMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    print(ConfigStore.to.isFirstOpen);
    if(ConfigStore.to.isFirstOpen == false) {
      return null;
    } else if(UserStore.to.isLogin == true) {
      return const RouteSettings(name: AppRoutes.Application);
    } else {
      return const RouteSettings(name: AppRoutes.SIGN_IN);
    }
  }
}