import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../config/const/key_const.dart';
import '../../config/util/CommonUtil.dart';
import 'navbar_logic.dart';

class NavbarPage extends GetView<NavbarLogic> {
  NavbarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavbarLogic>(
      builder: (_) => Scaffold(
        backgroundColor: Colors.white,
        body: IndexedStack(
          index: controller.tabIndex.value,
          children: controller.tabPageList,
        ),
        bottomNavigationBar: _buildBottomTab(),
      ),
    );
  }

  //底部tab
  Widget _buildBottomTab() {
    return BottomNavigationBar(
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.black,
      selectedFontSize: 12.sp,
      unselectedFontSize: 12.sp,
      items: [
        CommonUtil.buildBottomNavigationBarItem(KSConst.module, "module"),
        CommonUtil.buildBottomNavigationBarItem(KSConst.examine, "examine"),
      ],
      currentIndex: controller.tabIndex.value,
      onTap: (int index) async {
        if (controller.tabIndex.value == index) {
          return;
        }
        controller.tabIndex.value = index;
        controller.update();
      },
    );
  }
}
