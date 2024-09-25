import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../config/base/base_common_view.dart';
import '../../models/module/module.dart';
import 'drawer_logic.dart';

class DrawerPage extends BaseCommonView<DrawerLogic> {
  DrawerPage({Key? key}) : super(key: key);


  @override
  Widget buildContent() {
    // TODO: implement buildContent
    throw UnimplementedError();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: leftDrawer(),
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
              // Tab(icon: Icon(Icons.fourteen_mp)),
              // Tab(icon: Icon(Icons.fourteen_mp_sharp)),
              // Tab(icon: Icon(Icons.fourteen_mp_rounded)),
              // Tab(icon: Icon(Icons.one_k_sharp)),
              // Tab(icon: Icon(Icons.one_k_rounded)),
              // Tab(icon: Icon(Icons.one_k_outlined)),
              // Tab(icon: Icon(Icons.one_k_plus)),
              // Tab(icon: Icon(Icons.one_k_plus_sharp)),
            ],
          ),
          title: const Text('Tabs Demo'),
        ),
        body: const TabBarView(
          children: [
            Text("data"),
            Text("111"),
            Text("222"),
            // Icon(Icons.directions_car),
            // Icon(Icons.directions_transit),
            // Icon(Icons.directions_bike),
            // Icon(Icons.fourteen_mp),
            // Icon(Icons.fourteen_mp_sharp),
            // Icon(Icons.fourteen_mp_rounded),
            // Icon(Icons.one_k_sharp),
            // Icon(Icons.one_k_rounded),
            // Icon(Icons.one_k_outlined),
            // Icon(Icons.one_k_plus),
            // Icon(Icons.one_k_plus_sharp),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   drawer: leftDrawer(),
    //   appBar: AppBar(
    //     // bottom: TabBar(
    //     //   tabs: [
    //     //     Tab(icon: Icon(Icons.directions_car)),
    //     //     Tab(icon: Icon(Icons.directions_bike)),
    //     //   ],
    //     // ),
    //     title: Text('Tabs Demo'),
    //   ),
    //   // body: TabBarView(
    //   //   children: [
    //   //     Icon(Icons.directions_car),
    //   //     Icon(Icons.directions_bike),
    //   //   ],
    //   // ),
    // );
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
