
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_chat/pages/application/state.dart';
import 'package:get/get.dart';

class ApplicationController extends GetxController {
  final state = ApplicationState();
  ApplicationController();

  late final List<String> tabTiles;
  late final PageController pageController;
  late final List<BottomNavigationBarItem> bottomTabs;

  void handlePageChange(int index) {
    state.page = index;
  }

  void handleNavBarTap(int index) {
    pageController.jumpToPage(index);
  }

  @override
  void onInit() {
    super.onInit();
    tabTiles = ['Chat', 'Contact', 'Profile'];
    bottomTabs = <BottomNavigationBarItem> [
      BottomNavigationBarItem(
        icon: const Icon(Icons.message, color: Colors.grey,),
        activeIcon: Icon(Icons.message, color: Colors.blue[800],),
        label: 'Chat',
        backgroundColor: Colors.white
      ),
      BottomNavigationBarItem(
          icon: const Icon(Icons.contact_page, color: Colors.grey,),
          activeIcon: Icon(Icons.contact_page, color: Colors.blue[800],),
          label: 'Contact',
          backgroundColor: Colors.white
      ),
      BottomNavigationBarItem(
          icon: const Icon(Icons.person, color: Colors.grey,),
          activeIcon: Icon(Icons.person, color: Colors.blue[800],),
          label: 'Profile',
          backgroundColor: Colors.white
      ),
    ];
    pageController = PageController(initialPage: state.page);
  }


  @override
  void dispose() {
    pageController.dispose();
    super.dispose();

  }
}