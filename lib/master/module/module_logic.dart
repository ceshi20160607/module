import 'package:get/get.dart';

import '../../config/base/base_controller.dart';
import '../../config/base/base_list_controller.dart';
import '../../config/enum/module_type.dart';
import '../../config/net/http.dart';
import '../../config/util/log_util.dart';
import '../../config/widget/loading_widget.dart';
import '../../models/index.dart';

class ModuleLogic extends BaseListController {
  List<Module> moduleList = [];
  @override
  void initData() {
    // TODO: implement initData
    getnetworkdata(configNetWorkParmas());
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }

  @override
  void getnetworkdata(Map<String, dynamic> info) {
    super.getnetworkdata(info);

    /// 展示loading
    Loading.show();

    Http()
        .client
        .moduleQueryPageList(info)
        .then((value) {
      netState = NetState.dataSussessState;

      logD("moduleList1:");
      /// 结束loading
      Loading.dissmiss();
      List<Module> list = value.data?.list ?? [];
      if (page == 1) {
        moduleList = list;

        /// 释放下拉控件
        refreshController.refreshCompleted();
      } else {
        moduleList += list;

        /// 释放上拉控件
        refreshController.loadComplete();
      }

      /// 判断数组为空,如果为空显示空视图
      if (moduleList.isEmpty) {
        netState = NetState.emptyDataState;
      }

      /// 判断是否可以上拉加载,一页20条,如果本页数据不足20条,说明下面没数据了.
      if (list.length < 20) {
        refreshController.loadNoData();
      }
      logD("moduleList:");
      logD(moduleList);
      update();
    }).catchError((onError) {
      /// 结束loading
      Loading.dissmiss();
      netState = NetState.errorshowRelesh;
      if (page == 1) {
        refreshController.refreshFailed();
      } else {
        refreshController.loadFailed();
      }
      update();
    });
  }

  @override
  void loadMore() {
    super.loadMore();
    page += 1;
    getnetworkdata(configNetWorkParmas());
  }

  @override
  void refreshData() {
    super.refresh();
    page = 1;
    getnetworkdata(configNetWorkParmas());
  }
  @override
  Map<String, dynamic> configNetWorkParmas() {
    return {
      'rootId': '',
      'typeFlag': 1,
      'pageNumber': page,
      "pageSize": 20,
      "pageType": 0,
      'keyword': '',
    };
  }


  /// 跳转详情
  Future<void> jumpRecord(String? moduleId,String? moduleName) async {
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
