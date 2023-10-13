
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app_chat/pages/contact/controller.dart';
import 'package:flutter_app_chat/pages/contact/widgets/contact_list.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class ContactPage extends GetView<ContactController> {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // AppBar _buildAppbar() {
    //   return transparentAppbar(
    //
    //   )
    // }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ContactList(),
    );
  }

}