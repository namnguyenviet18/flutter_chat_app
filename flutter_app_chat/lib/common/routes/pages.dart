
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_chat/common/middlewares/router_welcome.dart';
import 'package:flutter_app_chat/pages/contact/index.dart';
import 'package:flutter_app_chat/pages/message/photo_view/index.dart';
import 'package:flutter_app_chat/pages/profile/index.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:flutter_app_chat/pages/sign_in/index.dart';
import 'package:flutter_app_chat/pages/welcome/index.dart';
import 'package:flutter_app_chat/pages/application/index.dart';
import '../../pages/message/chat/index.dart';
import 'names.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static const APPLICATION  = AppRoutes.Application;
  static final RouteObserver<Route> observer = RouteObserver();
  static List<String> history = [];
  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => const WelcomePage(null),
      binding: WelComeBinding(),
      middlewares: [
        RouteWelcomeMiddleware(priority: 1)
      ]
    ),
    GetPage(
      name: AppRoutes.SIGN_IN,
      page: () => SignInPage(),
      binding: SignInBinding()
    ),
    GetPage(
      name: AppRoutes.Application,
      page: () => const ApplicationPage(),
      binding: ApplicationBinding(),
      middlewares: [
        //RouteAuthMiddleware(priority: 1)
      ]
    ),
    GetPage(
      name: AppRoutes.Contact,
      page: () => const ContactPage(),
      binding: ContactBinding(),
    ),

    GetPage(
      name: AppRoutes.Chat,
      page: ()=> const ChatPage(),
      binding: ChatBinding()
    ),

    GetPage(
      name: AppRoutes.photoimgview,
      page: () => const PhotoImageView(),
      binding: PhotoImageViewBinding(),

    ),

    GetPage(
      name: AppRoutes.Me,
      page: () => const ProfilePage(),
      binding: ProfileBinding()
    )
  ];

}

