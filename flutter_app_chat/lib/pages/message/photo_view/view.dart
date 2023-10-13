
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app_chat/pages/message/photo_view/controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
class PhotoImageView extends GetView<PhotoImageViewController> {
  const PhotoImageView({Key? key}) : super(key: key);
  AppBar _buildAppBar() {
    return AppBar(
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: Colors.white70,
          height: 2.0,
        ),
      ),
      title: Text(
        "Photo view",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal
        ),
      ),
      backgroundColor: Colors.blue,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        child: PhotoView(
          imageProvider: NetworkImage(
            controller.state.url.value
          ),
        )
      )
    );
  }

}