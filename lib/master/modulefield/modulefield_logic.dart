import 'package:get/get.dart';

import '../../config/base/base_common_controller.dart';
import '../../config/base/base_controller.dart';
import '../../config/enum/module_type.dart';
import '../../config/net/http.dart';
import '../../config/util/log_util.dart';
import '../../config/widget/loading_widget.dart';
import '../../models/index.dart';

class ModulefieldLogic extends BaseCommonController {
  List<Modulefield> fieldList = [];
  bool inputFlag = true;
  int moduleId = 7;
  String title = '';

  @override
  void initData() {
    // TODO: implement initData
    String id = Get.arguments['id'];

    inputFlag = id.isEmpty?true:false;
    title = id.isEmpty?'新建':'编辑';

    Http().client.getModuleFieldAdd(1,moduleId).then((value) {
      Loading.dissmiss();
      netState = NetState.dataSussessState;
      fieldList = value.data!;

      logD("info--->$netState");
      logD("info--->$fieldList");
      update();
    }).catchError((onError) {
      /// 结束loading
      Loading.dissmiss();
      print(onError);
      netState = NetState.errorshowRelesh;
      update();
    });
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }
  /// 保存
  void save() {
    Map<String,dynamic> entity = {};
    //处理字段
    for(var f in fieldList){
      entity[f.fieldName] = f.value;
    }
    Map<String,dynamic> info = {};
    info["moduleId"] = moduleId;
    info["entity"] = entity;
    Http().client.saveModuleRecord(info).then((value) {
      Loading.dissmiss();
      netState = NetState.dataSussessState;
      inputFlag = true;

      logD("info--->$netState");
      logD("info--->$fieldList");
      update();
    }).catchError((onError) {
      /// 结束loading
      Loading.dissmiss();
      print(onError);
      netState = NetState.errorshowRelesh;
      update();
    });

    /// 保存，后关闭返回列表
    Get.toNamed(ModuleTypeEnum.MODULERECORD.routepath);
  }
}
