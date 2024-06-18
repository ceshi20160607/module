import 'package:get/get.dart';

import '../../config/base/base_list_controller.dart';
import '../../config/base/base_controller.dart';
import '../../config/enum/module_type.dart';
import '../../config/net/http.dart';
import '../../config/util/log_util.dart';
import '../../config/widget/loading_widget.dart';
import '../../models/field/modulefield.dart';

class ModulerecordLogic extends BaseListController {
  List<Modulefield> fieldHeads = [];
  List<Map<String,dynamic>> recordList = [];
  String title='';

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
        .queryModuleRecordPageList(info)
        .then((value) {
      netState = NetState.dataSussessState;

      /// 结束loading
      Loading.dissmiss();
      List<Map<String,dynamic>> list = value.data ?? [];
      if (page == 1) {
        recordList = list;

        /// 释放下拉控件
        refreshController.refreshCompleted();
      } else {
        recordList += list;

        /// 释放上拉控件
        refreshController.loadComplete();
      }

      /// 判断数组为空,如果为空显示空视图
      if (recordList.isEmpty) {
        netState = NetState.emptyDataState;
      }

      /// 判断是否可以上拉加载,一页20条,如果本页数据不足20条,说明下面没数据了.
      if (list.length < 20) {
        refreshController.loadNoData();
      }

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
    title = Get.arguments['moduleName'];
    return {
      'moduleId': Get.arguments['moduleId'],
      'typeFlag': 1,
      'pageNumber': page,
      "pageSize": 20,
      "pageType": 0,
      'keyword': '',
    };
  }


  /// 跳转详情
  Future<void> jumpRecord(String? id,String? name) async {
    // Get.changeTheme(Get.isDarkMode ? lightTheme : darkTheme);
    // await Get.forceAppUpdate();
    logD("msg---->$id");
    if (id != null && id.length > 0) {
      Get.toNamed(ModuleTypeEnum.MODULEFIELD.routepath, arguments: {'id': id,'name': name});
    } else {
      Loading.showToast("参数异常！");
    }
  }
}
