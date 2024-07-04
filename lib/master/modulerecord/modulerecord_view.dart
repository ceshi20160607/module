import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:module/config/enum/module_type.dart';

import '../../config/base/base_list_view.dart';
import '../../config/widget/loading_widget.dart';
import 'modulerecord_logic.dart';

class ModulerecordPage extends BaseListView<ModulerecordLogic> {

  ModulerecordPage({Key? key}) : super(key: key);
  final controller = Get.find<ModulerecordLogic>();


  /// 设置导航栏文字
  @override
  String? get navTitle => controller.title;

  /// 设置左边按钮宽度
  @override
  double? get leftWidth => 50;

  /// 设置左边按钮宽度
  @override
  bool? get isTitleCenter => true;

  /// 设置左边按钮宽度
  @override
  bool? get isHiddenLeftNav => false;

  /// 设置右边按钮宽度
  @override
  bool? get isHiddenRightNav => false;

  ///  设置右边按钮
  @override
  List<Widget>? get rightActionList => [
    GestureDetector(
      onTap: () {
        //跳转新增
        controller.jumpRecord(null, controller.requestParams['moduleName']);
      },
      child: Icon(
        Icons.add,
        color: Colors.black,
        size: 20.0,
      ),
    ),
    SizedBox(
      width: 20.0,
    )
  ];


  @override
  Widget buildContent() {
    // TODO: implement buildContent
    return GetBuilder<ModulerecordLogic>(builder: (_) {
      return creatRefresherListView(
          controller,
          _myDataTable(),
      );
    });
  }

  // Widget tableWidget() {
  //   List<DataColumn> columns = [];
  //   List<DataRow> rows = [];
  //   controller.fieldHeads.forEach((head) {
  //     columns.add(_myDataColumn(head.fieldName));
  //   });
  //   controller.recordList.forEach((r) {
  //     List<DataCell> items = [];
  //     controller.fieldHeads.forEach((head) {
  //       String id = r['id'];
  //       String name = r['name'];
  //       if (head.fieldName == 'name') {
  //         items.add(DataCell(
  //           Text(r[head.fieldName].toString()),
  //           onTap: () {
  //             controller.jumpRecord(id, name);
  //           },
  //         ));
  //       } else {
  //         items.add(DataCell(Text(r[head.fieldName].toString())));
  //       }
  //     });
  //     rows.add(DataRow(cells: items));
  //   });
  //   return DataTable(columns: columns, rows: rows,
  //     dataRowHeight: 40,
  //     headingRowHeight: 55,
  //     horizontalMargin: 20,
  //     columnSpacing: 50,
  //     dividerThickness: 2,
  //   );
  // }

  _myDataTable(){
    return DataTable(
      columns: _myDataColumnList(),
      rows: _myDataRow(),
      dataRowHeight: 40,
      headingRowHeight: 55,
      horizontalMargin: 20,
      columnSpacing: 50,
      dividerThickness: 2,

    );
  }
  _myDataColumn(String title) {
    return DataColumn(
      label: Text(
        title,
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
      ),
      tooltip: '${title}',
      numeric: false,
    );
  }
  _myDataColumnList() {
    List<DataColumn> _dataColumnList = [];
    if (controller.fieldHeads.length > 0) {
      _dataColumnList.clear();
    }
    controller.fieldHeads.forEach((element) {
      _dataColumnList.add(_myDataColumn(element.name));
    });
    return _dataColumnList;
  }
  _myDataRow() {
    List<DataRow> rows = [];
    controller.recordList.forEach((r) {
      List<DataCell> items = [];
      controller.fieldHeads.forEach((head) {
        String id = r['id'];
        String name = r['name']??'';
        print('id:'+ id);
        print('name:'+ name);
        print('name:'+ head.fieldName);
        dynamic aa = null;
        String aaaa = "";
        aaaa.toString();
        String value = r[head.fieldName]!=null?r[head.fieldName].toString():'';
        print('value:'+ value);
        if (head.fieldName == 'name') {
          items.add(_myDataCellJumpInfo(id,name));
        } else {
          items.add(_myDataCell(value));
        }
      });
      rows.add(DataRow(cells: items));
    });
    return rows;
  }
  _myDataCell(String s) {
    return DataCell(
      Text(s),
    );
  }
  _myDataCellJumpInfo(String id,String name) {
    return DataCell(
      Text(name),
      onTap: () {
        controller.jumpRecord(id, name);
      },
    );
  }

}


