

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/widgets/costom_button.dart';
import 'controller.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget _buildLogo() {
      return Container(
        width: 110.w,
        margin: EdgeInsets.only(top: 84.h,),
        child: Column(
          children: [
            Container(
              width: 76.w,
              height: 76.w,
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              child: Stack(
                children: [
                  Container(
                    height: 76.w,
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(35.w))
                    ),
                  ),
                  Positioned(
                    child: Image.asset(
                      "assets/images/message_logo.png",
                      width: 76.w,
                      height: 76.w,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 15.h,
                bottom: 15.h
              ),
              child: Text(
                "Let's chat",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  height: 1
                ),
              ),
            )
          ],
        ),
      );
    }
    Widget _buildThirdPartyLogin() {
      return Container(
        width: 195.w,
        margin: EdgeInsets.only(bottom: 280.h),
        child: Column(
          children: [
            Text(
              "Sign in with social networks",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                height: 1,

              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 30.h, left: 30.w, right: 30.w
              ),
              child: FlatButtonWidget(
                width: 200.w,
                height: 55.h,
                title: "Google Login",
                onPressed: () => controller.handleSignIn(),
              ),
            ),

          ],
        ),
      );
    }
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            _buildLogo(),
            Spacer(),
            _buildThirdPartyLogin()
          ],
        ),
      ),
    );
  }

}