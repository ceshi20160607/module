import 'package:get/get.dart';

import '../../config/enum/module_type.dart';
import '../../config/net/http.dart';
import '../../config/util/log_util.dart';
import '../../config/widget/loading_widget.dart';
import '../../models/index.dart';

class DrawerLogic extends GetxController {
  List<Module> moduleList = [];

  @override
  void onInit() {
    getnetworkdata(configNetWorkParmas());
  }

  Map<String, dynamic> configNetWorkParmas() {
    return {
      'rootId': '',
      'typeFlag': '',
      'parentId': '',
      'pageNumber': 1,
      "pageSize": 20,
      "pageType": 0,
      'keyword': '',
    };
  }
  void getnetworkdata(Map<String, dynamic> info) {
    /// 展示loading
    Loading.show();
    Http()
        .client
        .moduleQueryPageListTree(info)
        .then((value) {
      /// 结束loading
      Loading.dissmiss();
      moduleList = value.data ?? [];
      update();
    }).catchError((onError) {
      /// 结束loading
      Loading.dissmiss();
      update();
    });
  }

  /// 跳转详情
  jumpRecord(String? moduleId,String? moduleName) async {
    // Get.changeTheme(Get.isDarkMode ? lightTheme : darkTheme);
    // await Get.forceAppUpdate();
    logD("msg---->$moduleId");
    logD("msg---->$moduleName");
    if (moduleId != null && moduleId.length > 0) {
      Get.toNamed(ModuleTypeEnum.MODULERECORD.routepath, arguments: {'moduleId': moduleId,'moduleName': moduleName});
    } else {
      Loading.showToast("参数异常！");
    }
  }
}
