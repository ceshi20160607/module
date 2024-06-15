import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/base/base_list_view.dart';
import '../../config/widget/ModuleItemWidget.dart';
import 'module_logic.dart';

class ModulePage extends BaseListView<ModuleLogic> {


  /// 设置导航栏文字
  @override
  String? get navTitle => '模块';

  /// 设置左边按钮宽度
  @override
  bool? get isTitleCenter => true;

  /// 设置左边按钮宽度
  @override
  bool? get isHiddenLeftNav => true;

  @override
  Widget buildContent() {
    // TODO: implement buildContent
    return GetBuilder<ModuleLogic>(builder: (_) {
      return creatRefresherListView(
          controller,
          ListView.builder(
              padding: const EdgeInsets.all(0),
              itemCount: controller.moduleList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  child: ModuleItemWidget(
                    module: controller.moduleList[index],
                  ),
                  onTap: () {
                    controller.jumpRecord(controller.moduleList[index].id,controller.moduleList[index].name);
                  },
                );
              }));
    });
  }
}
