

import 'package:flutter/material.dart';
import 'package:flutter_app_chat/pages/application/controller.dart';
import 'package:flutter_app_chat/pages/contact/index.dart';
import 'package:flutter_app_chat/pages/message/view.dart';
import 'package:flutter_app_chat/pages/profile/index.dart';
import 'package:get/get.dart';

class ApplicationPage extends GetView<ApplicationController> {
   const ApplicationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildPageView() {
      return PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: controller.handlePageChange,
        children: const [
          MessagePage(),
          ContactPage(),
          ProfilePage()
        ],
      );
    }
    Widget buildBottomNavigationBar() {
      return Obx(
          () => BottomNavigationBar(
            items: controller.bottomTabs,
            currentIndex: controller.state.page,
            type: BottomNavigationBarType.fixed,
            onTap: controller.handleNavBarTap,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.blue[800],
          )
      );
    }
    return Scaffold(
      body: _buildPageView(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

}