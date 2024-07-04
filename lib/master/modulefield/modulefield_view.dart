import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../config/base/base_common_view.dart';
import '../../config/widget/base/BaseAddWidget.dart';
import 'modulefield_logic.dart';

class ModulefieldPage extends BaseCommonView<ModulefieldLogic> {
  ModulefieldPage({Key? key}) : super(key: key);
  final controller = Get.find<ModulefieldLogic>();

  /// 设置导航栏文字
  @override
  String? get navTitle => controller.title;

  /// 设置左边按钮宽度
  @override
  double? get leftWidth => 50;

  /// 设置左边按钮宽度
  @override
  bool? get isTitleCenter => true;

  /// 设置左边按钮宽度
  @override
  bool? get isHiddenLeftNav => false;

  /// 设置右边按钮宽度
  @override
  bool? get isHiddenRightNav => false;

  ///  设置右边按钮
  @override
  List<Widget>? get rightActionList => [
    GestureDetector(
      onTap: () {
        //执行保存方法
        controller.save();
      },
      child: Icon(
        Icons.add,
        color: Colors.white70,
        size: 20.w,
      ),
    ),
    SizedBox(
      width: 20.w,
    )
  ];

  @override
  Widget buildContent() {
    return GetBuilder<ModulefieldLogic>(
        builder: (_) => creatCommonView(
          controller,
          BaseAddWidget(
            fieldList: controller.fieldList,
            inputFlag: controller.addFlag,
          ),
          // Stack(
          //   children: ,
          //   // children: [
          //   //   SizedBox(
          //   //     child: Column(
          //   //       children: [
          //   //         Text(
          //   //           controller.car.carType == 0 ? "日程" : "加油",
          //   //         )
          //   //       ],
          //   //     ),
          //   //   ),
          //   //   Text(controller.car.id),
          //   //   Text(
          //   //     controller.car.createTime,
          //   //     style: TextStyle(backgroundColor: Colors.orange),
          //   //   ),
          //   //   // Padding(
          //   //   //   padding: EdgeInsets.only(
          //   //   //       top: ScreenUtil().statusBarHeight + kToolbarHeight,
          //   //   //       bottom: ScreenUtil().bottomBarHeight + 60.h),
          //   //   //   child: Text(
          //   //   //     controller.car!.id,
          //   //   //   ),
          //   //   // )
          //   //
          //   //   // Padding(
          //   //   //   padding: EdgeInsets.only(
          //   //   //       top: ScreenUtil().statusBarHeight + kToolbarHeight,
          //   //   //       bottom: ScreenUtil().bottomBarHeight + 60.h),
          //   //   //   child: Text(
          //   //   //     controller.car.createTime,
          //   //   //     style: TextStyle(
          //   //   //         fontSize: 16,
          //   //   //         fontWeight: FontWeight.bold,
          //   //   //         color: Colors.red),
          //   //   //   ),
          //   //   // ),
          //   // ],
          // )
        ));
  }


}
