import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../models/index.dart';
import '../enum/module_type.dart';
import '../util/log_util.dart';
import 'loading_widget.dart';

class ModuleRecordTableWidget extends StatelessWidget {
  final List<Modulefield> fieldHeads;
  final List<Map<String, dynamic>> recordList;

  const ModuleRecordTableWidget(
      {super.key, required this.recordList, required this.fieldHeads});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 10.h),
      width: 1.sw,
      color: Colors.white,
      child: tableWidget(),
    );
  }

  Widget tableWidget() {
    List<DataColumn> columns = [];
    List<DataRow> rows = [];
    fieldHeads.forEach((head) {
      columns.add(DataColumn(label: Text(head.fieldName)));
    });
    recordList.forEach((r) {
      List<DataCell> items = [];
      fieldHeads.forEach((head) {
        String id = r['id'];
        String name = r['name'];
        if (head.fieldName == 'name') {
          items.add(DataCell(
            Text(r[head.fieldName].toString()),
            onTap: () {
              jumpRecord(id, name);
            },
          ));
        } else {
          items.add(DataCell(Text(r[head.fieldName].toString())));
        }
      });
      rows.add(DataRow(cells: items));
    });
    return DataTable(columns: columns, rows: rows);
  }

  /// 跳转详情
  Future<void> jumpRecord(String? id, String? name) async {
    // Get.changeTheme(Get.isDarkMode ? lightTheme : darkTheme);
    // await Get.forceAppUpdate();
    logD("msg---->$id");
    if (id != null && id.length > 0) {
      Get.toNamed(ModuleTypeEnum.MODULERECORD.routepath,
          arguments: {'id': id, 'name': name});
    } else {
      Loading.showToast("参数异常！");
    }
  }
}
