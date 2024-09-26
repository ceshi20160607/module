import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../config/base/base_common_view.dart';
import '../../config/base/base_list_view.dart';
import '../../models/module/module.dart';
import 'drawer_logic.dart';

class DrawerPage extends BaseListView<DrawerLogic> {
  DrawerPage({Key? key}) : super(key: key);
  final controller = Get.find<DrawerLogic>();
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
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DrawerLogic>(builder: (_) {
      // return creatRefresherListView(
      //     controller,
      //     _myDataTable(),
      // );
      return creatRefresherListView(
          controller,
          ListView.builder(
              padding: const EdgeInsets.all(0),
              itemCount: controller.recordList.length,
              itemBuilder: (context, index) {
                // return makeCard(controller.recordList[index]);
              }),
          enablePullUp: true,
          enablePullDown: true);
    });
  }

  Widget leftDrawer() {
    return Drawer(
      width: 0.7.sw,
      child: ListView(
        children: _moduleList(),
      ),
    );
  }

  _moduleList() {
    List<Widget> ret = [];
    ret.add(DrawerHeader(
      // drawer的头部控件
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
      child: UnconstrainedBox(
        // 解除父级的大小限制
        child: CircleAvatar(
          radius: 40,
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(
            'https://i.loli.net/2020/01/21/4t5hLOoF3YeKSHT.png',
          ),
        ),
      ),
    ));
    controller.moduleList.forEach((f) {
      ret.add(ExpansionTile(
        // 子项
        title: Text(f.name),
        children: _subModuleList(f),
      ));
    });
    return ret;
  }

  _subModuleList(Module f) {
    List<ListTile> ret = [];
    f.children?.forEach((f) {
      ret.add(ListTile(
        // 子项
        title: Text(f.name),
        onTap: controller.jumpRecord(f.id, f.name),
      ));
    });
    return ret;
  }
}
