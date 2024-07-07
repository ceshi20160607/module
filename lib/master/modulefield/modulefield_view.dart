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
        if(controller.addFlag){
          controller.save();
        }else{
          controller.edit();
        }
      },
      child: iconWidget(),
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
        ));
  }

  Widget iconWidget() {
    if(controller.addFlag){
      return Icon(
        Icons.add,
        color: Colors.lightGreenAccent,
        size: 20.w,
      );
    }else{
      return Icon(
        Icons.save,
        color: Colors.blueAccent,
        size: 20.w,
      );
    }
  }


}
