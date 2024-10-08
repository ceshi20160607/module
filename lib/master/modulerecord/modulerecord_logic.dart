import 'package:get/get.dart';

import '../../config/base/base_list_controller.dart';
import '../../config/base/base_controller.dart';
import '../../config/enum/module_type.dart';
import '../../config/net/http.dart';
import '../../config/util/log_util.dart';
import '../../config/widget/loading_widget.dart';
import '../../models/field/modulefield.dart';

class ModulerecordLogic extends BaseListController {
  // List<Modulefield> fieldHeads = [Modulefield.fromJson({"id":"34","moduleId":"4","fieldName":"id","name":"主键","type":1,"remark":null,"inputTips":null,"maxLength":null,"defaultValue":"","value":null,"unionFlag":1,"mustFlag":1,"hiddenFlag":0,"deleteFlag":0,"addFlag":0,"indexFlag":0,"detailFlag":1,"sorting":1,"fieldType":1,"dictId":null,"optionData":null,"parentId":null,"depthDepth":null,"transferModelId":null,"transferFieldName":null,"stylePercent":50,"precisions":null,"maxNumRestrict":null,"minNumRestrict":null,"axisx":1,"axisy":1,"createTime":null,"createUserId":"0","updateTime":"2024-06-06 10:33:05","updateUserId":null})];
  // List<Map<String,dynamic>> recordList = [{"id":"34","moduleId":"4","fieldName":"id","name":"主键","type":1,"remark":null,"inputTips":null,"maxLength":null,"defaultValue":"","value":null,"unionFlag":1,"mustFlag":1,"hiddenFlag":0,"deleteFlag":0,"addFlag":0,"indexFlag":0,"detailFlag":1,"sorting":1,"fieldType":1,"dictId":null,"optionData":null,"parentId":null,"depthDepth":null,"transferModelId":null,"transferFieldName":null,"stylePercent":50,"precisions":null,"maxNumRestrict":null,"minNumRestrict":null,"axisx":1,"axisy":1,"createTime":null,"createUserId":"0","updateTime":"2024-06-06 10:33:05","updateUserId":null,"companyId":null},{"id":"37","moduleId":"4","fieldName":"remark","name":"备注","type":2,"remark":null,"inputTips":null,"maxLength":null,"defaultValue":"","value":null,"unionFlag":0,"mustFlag":0,"hiddenFlag":0,"deleteFlag":0,"addFlag":0,"indexFlag":0,"detailFlag":0,"sorting":1,"fieldType":1,"dictId":null,"optionData":null,"parentId":null,"depthDepth":null,"transferModelId":null,"transferFieldName":null,"stylePercent":50,"precisions":null,"maxNumRestrict":null,"minNumRestrict":null,"axisx":1,"axisy":1,"createTime":null,"createUserId":"0","updateTime":"2024-06-06 10:33:05","updateUserId":null,"companyId":null},{"id":"38","moduleId":"4","fieldName":"check_flag","name":"审批状态","type":1,"remark":null,"inputTips":null,"maxLength":null,"defaultValue":"","value":null,"unionFlag":0,"mustFlag":0,"hiddenFlag":0,"deleteFlag":0,"addFlag":0,"indexFlag":0,"detailFlag":0,"sorting":1,"fieldType":1,"dictId":null,"optionData":null,"parentId":null,"depthDepth":null,"transferModelId":null,"transferFieldName":null,"stylePercent":50,"precisions":null,"maxNumRestrict":null,"minNumRestrict":null,"axisx":1,"axisy":1,"createTime":null,"createUserId":"0","updateTime":"2024-06-06 10:33:05","updateUserId":null,"companyId":null},{"id":"39","moduleId":"4","fieldName":"examine_record_id","name":"审批关联","type":1,"remark":null,"inputTips":null,"maxLength":null,"defaultValue":"","value":null,"unionFlag":0,"mustFlag":0,"hiddenFlag":0,"deleteFlag":0,"addFlag":0,"indexFlag":0,"detailFlag":0,"sorting":1,"fieldType":1,"dictId":null,"optionData":null,"parentId":null,"depthDepth":null,"transferModelId":null,"transferFieldName":null,"stylePercent":50,"precisions":null,"maxNumRestrict":null,"minNumRestrict":null,"axisx":1,"axisy":1,"createTime":null,"createUserId":"0","updateTime":"2024-06-06 10:33:06","updateUserId":null,"companyId":null},{"id":"40","moduleId":"4","fieldName":"examine_time","name":"审批通过时间","type":13,"remark":null,"inputTips":null,"maxLength":null,"defaultValue":"","value":null,"unionFlag":0,"mustFlag":0,"hiddenFlag":0,"deleteFlag":0,"addFlag":0,"indexFlag":0,"detailFlag":0,"sorting":1,"fieldType":1,"dictId":null,"optionData":null,"parentId":null,"depthDepth":null,"transferModelId":null,"transferFieldName":null,"stylePercent":50,"precisions":null,"maxNumRestrict":null,"minNumRestrict":null,"axisx":1,"axisy":1,"createTime":null,"createUserId":"0","updateTime":"2024-06-06 10:33:06","updateUserId":null,"companyId":null},{"id":"41","moduleId":"4","fieldName":"create_user_id","name":"创建人","type":1,"remark":null,"inputTips":null,"maxLength":null,"defaultValue":"","value":null,"unionFlag":0,"mustFlag":0,"hiddenFlag":0,"deleteFlag":0,"addFlag":0,"indexFlag":0,"detailFlag":0,"sorting":1,"fieldType":1,"dictId":null,"optionData":null,"parentId":null,"depthDepth":null,"transferModelId":null,"transferFieldName":null,"stylePercent":50,"precisions":null,"maxNumRestrict":null,"minNumRestrict":null,"axisx":1,"axisy":1,"createTime":null,"createUserId":"0","updateTime":"2024-06-06 10:33:06","updateUserId":null,"companyId":null},{"id":"42","moduleId":"4","fieldName":"owner_user_id","name":"负责人","type":1,"remark":null,"inputTips":null,"maxLength":null,"defaultValue":"","value":null,"unionFlag":0,"mustFlag":0,"hiddenFlag":0,"deleteFlag":0,"addFlag":0,"indexFlag":0,"detailFlag":0,"sorting":1,"fieldType":1,"dictId":null,"optionData":null,"parentId":null,"depthDepth":null,"transferModelId":null,"transferFieldName":null,"stylePercent":50,"precisions":null,"maxNumRestrict":null,"minNumRestrict":null,"axisx":1,"axisy":1,"createTime":null,"createUserId":"0","updateTime":"2024-06-06 10:33:06","updateUserId":null,"companyId":null},{"id":"43","moduleId":"4","fieldName":"create_time","name":"创建时间","type":13,"remark":null,"inputTips":null,"maxLength":null,"defaultValue":"","value":null,"unionFlag":0,"mustFlag":0,"hiddenFlag":0,"deleteFlag":0,"addFlag":0,"indexFlag":0,"detailFlag":0,"sorting":1,"fieldType":1,"dictId":null,"optionData":null,"parentId":null,"depthDepth":null,"transferModelId":null,"transferFieldName":null,"stylePercent":50,"precisions":null,"maxNumRestrict":null,"minNumRestrict":null,"axisx":1,"axisy":1,"createTime":null,"createUserId":"0","updateTime":"2024-06-06 10:33:06","updateUserId":null,"companyId":null},{"id":"44","moduleId":"4","fieldName":"update_time","name":"更新时间","type":13,"remark":null,"inputTips":null,"maxLength":null,"defaultValue":"","value":null,"unionFlag":0,"mustFlag":0,"hiddenFlag":0,"deleteFlag":0,"addFlag":0,"indexFlag":0,"detailFlag":0,"sorting":1,"fieldType":1,"dictId":null,"optionData":null,"parentId":null,"depthDepth":null,"transferModelId":null,"transferFieldName":null,"stylePercent":50,"precisions":null,"maxNumRestrict":null,"minNumRestrict":null,"axisx":1,"axisy":1,"createTime":null,"createUserId":"0","updateTime":"2024-06-06 10:33:06","updateUserId":null,"companyId":null},{"id":"45","moduleId":"4","fieldName":"fielddecimal1","name":"金额","type":6,"remark":null,"inputTips":null,"maxLength":null,"defaultValue":"","value":null,"unionFlag":0,"mustFlag":0,"hiddenFlag":0,"deleteFlag":0,"addFlag":1,"indexFlag":0,"detailFlag":0,"sorting":1,"fieldType":0,"dictId":null,"optionData":null,"parentId":null,"depthDepth":null,"transferModelId":null,"transferFieldName":null,"stylePercent":50,"precisions":null,"maxNumRestrict":null,"minNumRestrict":null,"axisx":1,"axisy":1,"createTime":null,"createUserId":"0","updateTime":"2024-06-06 10:33:15","updateUserId":null,"companyId":null}];
  List<Modulefield> fieldHeads = [];
  List<Map<String,dynamic>> recordList = [];
  String title='';
  Map<String, dynamic> requestParams = {};

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
    try {
      Http()
          .client
          .moduleFieldUserQueryFieldHead(int.parse(info["moduleId"]))
          .then((value) {
        // netState = NetState.dataSussessState;

        fieldHeads = value.data ?? [];

        print("表头返回值："+fieldHeads.toString());
        //有表头情况下，去做body请求
        if (fieldHeads.length>0) {
          getTableBody(info);
        }else{
          /// 结束loading
          Loading.dissmiss();
          netState = NetState.errorshowRelesh;
        }
      }).catchError((onError) {
        netState = NetState.errorshowRelesh;
      });
    } catch (e) {
      /// 结束loading
      Loading.dissmiss();
      netState = NetState.errorshowRelesh;
      // update();
      //异常时候直接返回
      Loading.showToast("获取参数异常！");
      Get.back();
    } finally {}
  }

  @override
  void loadMore() {
    super.loadMore();
    page += 1;
    getTableBody(configNetWorkParmas());
  }

  @override
  void refreshData() {
    super.refresh();
    page = 1;
    getTableBody(configNetWorkParmas());
  }
  @override
  Map<String, dynamic> configNetWorkParmas() {
    title = Get.arguments['moduleName']??"";
    requestParams['moduleId']= Get.arguments['moduleId'];
    requestParams['moduleName']= Get.arguments['moduleName'];

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
    String moduleId = Get.arguments['moduleId']??"";
    logD("msg---->$id");
    Get.toNamed(ModuleTypeEnum.MODULEFIELD.routepath, arguments: {'moduleId': moduleId,'id': id,'moduleName': name});
  }

  void getTableBody(Map<String, dynamic> info) {
    Http()
        .client
        .moduleRecordQueryPageList(info)
        .then((value) {
      netState = NetState.dataSussessState;

      /// 结束loading
      Loading.dissmiss();
      List<Map<String,dynamic>> list = value.data?.list ?? [];
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
}
