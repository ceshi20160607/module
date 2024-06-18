import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/base/base_list_view.dart';
import '../../models/index.dart';
import 'module_logic.dart';

class ModulePage extends BaseListView<ModuleLogic> {
  ModulePage({Key? key}) : super(key: key);

  final controller = Get.find<ModuleLogic>();

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
                return makeCard(controller.moduleList[index]);
                // return InkWell(
                //   child: ModuleItemWidget(
                //     module: controller.moduleList[index],
                //   ),
                //   onTap: () {
                //     controller.jumpRecord(controller.moduleList[index].id,controller.moduleList[index].name);
                //   },
                // );
              }));
    });
  }


  Widget makeCard(Module module){
    return Card(
      elevation: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(
            219, 227, 243, 0.9019607843137255)),
        child: makeCardItem(module),
      ),
    );
  }
  Widget makeCardItem(Module module){
    return ListTile(
      contentPadding:
      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: BoxDecoration(
            border: Border(
                right: BorderSide(width: 1.0, color: Colors.white24))),
        child: Icon(Icons.autorenew, color: Colors.white),
      ),
      title: Text(
        module.name,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                // tag: 'hero',
                child: LinearProgressIndicator(
                    backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                    value: 1,
                    valueColor: AlwaysStoppedAnimation(Colors.green)),
              )),
          Expanded(
            flex: 4,
            child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text("2",
                    style: TextStyle(color: Colors.white))),
          )
        ],
      ),
      trailing:
      Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
      onTap: () {
        controller.jumpRecord(module.id,module.name);
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => DetailPage()));
      },
    );
  }
}
