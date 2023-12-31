
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'common/entities/user.dart';
import 'common/routes/pages.dart';
import 'common/store/config.dart';
import 'common/store/storage.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync<StorageService>(() => StorageService().init());
  Get.put<ConfigStore>(ConfigStore());
  Get.put<UserStore>(UserStore());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) =>
          GetMaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
                primaryColor: Colors.blue
            ),
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes

          ),
    );
  }
}