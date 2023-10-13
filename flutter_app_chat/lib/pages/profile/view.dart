

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_chat/common/entities/me_list_item.dart';
import 'package:flutter_app_chat/pages/profile/controller.dart';
import 'package:flutter_app_chat/pages/profile/widget/head_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);



  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        "Profile",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600
        ),
      ),
      centerTitle: true,
    );
  }

  Widget MeItem(MeListItem item) {
    return Container(
      height: 56.w,
      color: Colors.white70,
      margin: EdgeInsets.only(bottom: 1.w),
      padding: EdgeInsets.only(top: 0.w, left: 15.w, right: 15.w),
      child: InkWell(
        onTap: (){
          if(item.route == "/logout") {
            controller.onLogout();
          }
        },
        child: Row(
          mainAxisAlignment:  MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  height: 56.w,
                  child: Image(
                    image: AssetImage(item.icon ?? ""),
                    width: 40.w,
                    height: 40.w,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 14.w),
                  child: Text(
                    item.name ?? "",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.chevron_right,
                    size: 25.w,
                  )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Obx(
          () => CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  vertical: 0.w, horizontal: 0.w
                ),
                sliver: SliverToBoxAdapter(
                  child: controller.state.head_detail.value == null ? Container():
                  HeadItem(controller.state.head_detail.value!),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  vertical: 0.w, horizontal: 0.w
                ),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        var item = controller.state.meListItem[index];
                        return MeItem(item);
                      },
                    childCount: controller.state.meListItem.length
                  ),
                )
              ),

            ],
          )
      ),
    );
  }

 

}