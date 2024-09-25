import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/module/module.dart';
import 'drawer_logic.dart';

class DrawerPage extends GetView<DrawerLogic> {
  DrawerPage({Key? key}) : super(key: key);

  final controller = Get.find<DrawerLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: leftDrawer(),
      // appBar: AppBar(
      //   bottom: TabBar(
      //     tabs: [
      //       Tab(icon: Icon(Icons.directions_car)),
      //       Tab(icon: Icon(Icons.directions_bike)),
      //     ],
      //   ),
      //   title: Text('Tabs Demo'),
      // ),
      // body: TabBarView(
      //   children: [
      //     Icon(Icons.directions_car),
      //     Icon(Icons.directions_bike),
      //   ],
      // ),
    );
  }

  Widget leftDrawer() {
    return Drawer(
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
