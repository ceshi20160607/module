import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/base/base_list_view.dart';
import 'modulerecord_logic.dart';

class ModulerecordPage extends BaseListView<ModulerecordLogic> {

  ModulerecordPage({Key? key}) : super(key: key);
  final controller = Get.find<ModulerecordLogic>();

  /// 设置导航栏文字
  @override
  String? get navTitle => controller.title;

  /// 设置左边按钮宽度
  @override
  bool? get isTitleCenter => true;

  /// 设置左边按钮宽度
  @override
  bool? get isHiddenLeftNav => true;

  @override
  Widget buildContent() {
    // TODO: implement buildContent
    return GetBuilder<ModulerecordLogic>(builder: (_) {
      return creatRefresherListView(
          controller,
          tableWidget(),
      );
    });
  }

  Widget tableWidget() {
    List<DataColumn> columns = [];
    List<DataRow> rows = [];
    controller.fieldHeads.forEach((head) {
      columns.add(DataColumn(label: Text(head.fieldName)));
    });
    controller.recordList.forEach((r) {
      List<DataCell> items = [];
      controller.fieldHeads.forEach((head) {
        String id = r['id'];
        String name = r['name'];
        if (head.fieldName == 'name') {
          items.add(DataCell(
            Text(r[head.fieldName].toString()),
            onTap: () {
              controller.jumpRecord(id, name);
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
}
