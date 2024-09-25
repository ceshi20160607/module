import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/base/base_list_view.dart';
import '../../models/index.dart';
import 'module_logic.dart';

class ModulePage extends BaseListView<ModuleLogic> {
  ModulePage({Key? key}) : super(key: key);

  final controller = Get.find<ModuleLogic>();
  int _currentStep = 0;

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
        // makeCardBase(controller.moduleList));
        // makeSetper(controller.moduleList));
        // makeTabs(controller.moduleList));
    });
  }

  //test-tabs
  Widget makeTabs(List<Module> modules) {
      return DefaultTabController(
        length: 3,
        child: Scaffold(
    //       appBar: AppBar(
    // //       bottom: const TabBar(
    // //       tabs: [
    // //       Tab(icon: Icon(Icons.directions_car)),
    // // Tab(icon: Icon(Icons.directions_transit)),
    // // Tab(icon: Icon(Icons.directions_bike)),
    // // ],
    // // ),
    // title: const Text('Tabs Demo'),
    // //         titleSpacing: 0,
    // ),
    body: const TabBarView(
    children: [
      Text('Tabs Demo'),
    Icon(Icons.directions_transit),
    Icon(Icons.directions_bike),
    ],
    ),
        )
      );
  }
  _tabs(List<Module> dataList) {
    List<Tab> tabs = [];
    dataList.forEach((module){
      tabs.add(Tab(
        text: module.name??"",
      ));
    });
    return tabs;
  }
  //test-setper
  Widget makeSetper(List<Module> modules){
    return Stepper(
      currentStep: _currentStep,
        physics: ClampingScrollPhysics(), // 滑动的物理效果
        type: StepperType.vertical,
        // 内容下方按钮构建函数
        controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Container();
         },
        // step 点击回调函数
        onStepTapped: (index){
          print(index);
          _currentStep = index;
          controller.update();
        },
        steps: _steps(modules),
    );
  }
  _steps(List<Module> dataList) {
    List <Step> steps = [];
    dataList.forEach((module){
      steps.add(Step(
          title: Text(module.name??''),
          subtitle: Text(module.name??''),
          content: Column(
            children: [
              Row(
                children: [Text("data"),
                  Text(" : "),
                  Text("zhangsanlisi")],
              )
            ],
          ),
          isActive: (_currentStep == dataList.indexOf(module)),
          state: StepState.complete,
          )
      );
      StepState.indexed;
    });
    return steps;
  }

  //test-card
  ListView makeCardBase(List<Module> modules){
    return ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: modules.length,
        itemBuilder: (context, index) {
          return makeCard(controller.moduleList[index]);
          // return makeCard1(modules[index]);
          // return InkWell(
          //   child: ModuleItemWidget(
          //     module: controller.moduleList[index],
          //   ),
          //   onTap: () {
          //     controller.jumpRecord(controller.moduleList[index].id,controller.moduleList[index].name);
          //   },
          // );
        });
  }
  Widget makeCard1(Module module){
    return Container(
      // margin: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 10.h),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: IntrinsicHeight(
              child: Column(
                children: [
                  // Stack(
                  //   alignment: AlignmentDirectional.center,
                  //   children: [
                  // Container(
                  //   child: FractionallySizedBox(
                  //     widthFactor: 1,
                  //     child: Container(
                  //       color: Colors.grey, // 线的颜色
                  //       width: 1, // 确保线条横向填满
                  //     )
                  //   ),
                  // ),
                  // DecoratedBox(
                  //   decoration:BoxDecoration(color: Colors.green),
                  //   child: RotatedBox(quarterTurns: 1,),),
                  Icon(Icons.cached,color: Colors.lightGreen,)
                  //   ],
                  // )
                ],
              ),
            )
          ),
          Expanded(
            flex: 10,
            child: Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                Row(
                  children: [
                    Text("data"),
                    Text(" : "),
                    Text("zhangsanlisi")
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                Icon(Icons.chevron_right,color: Colors.grey,)
              ],
            ),
          )
        ],
      ),
    );
  }


  Widget makeCard(Module module){
    return Card(
      elevation: 8.0,
      // margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(
            0, 101, 255, 0.4)),
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
                    backgroundColor: Color.fromRGBO(70, 175, 230, 0.4),
                    value: 100,
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
      Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 22.0),
      onTap: () {
        controller.jumpRecord(module.id,module.name);
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => DetailPage()));
      },
    );
  }
}


