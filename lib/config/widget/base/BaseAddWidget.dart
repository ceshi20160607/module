import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../models/index.dart';
import '../../enum/field_type.dart';
import '../../env/themConfig.dart';
import '../../util/log_util.dart';

class BaseAddWidget extends StatelessWidget {
  final bool inputFlag;
  final List<Modulefield> fieldList;

  const BaseAddWidget(
      {super.key, required this.inputFlag, required this.fieldList});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      color: Colors.white,
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 14.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 70.h,
          ),
          inputFlag ? itemAddWidget() : itemDetailWidget(),
          SizedBox(
            height: 10.h,
          ),
          lineWidget(),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }

  Widget itemAddWidget() {
    List<Widget> rowWidget = [];
    fieldList.forEach((field) {
      logD(field);
      switch (FieldTypeEnum.getType(field.type)) {
        case FieldTypeEnum.TEXT:
          rowWidget.add(TextFormField(
              onChanged: (v) => field.value = v!,
              decoration: InputDecoration(
                labelText: field.name,
              )));
          break;
        case FieldTypeEnum.TEXTAREA:
          rowWidget.add(new Text.rich(new TextSpan(text: field.value)));
          break;
        case FieldTypeEnum.NUMBER:
          rowWidget.add(TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.lightBlue.shade100,
              // prefixIcon: Icon(Icons.phone),
              prefixText: field.name,
              prefixStyle: TextStyle(color: Colors.orange, fontSize: 18.sp),
              hintText: field.value,
              // suffixIcon: Icon(Icons.clear),
            ),
          ));
          break;
        case FieldTypeEnum.NUMBER_FLOAT:
        case FieldTypeEnum.PERCENT:
          rowWidget.add(Radio(value: 1, groupValue: 1, onChanged: (v) {}));
          break;
        case FieldTypeEnum.DATE:
          rowWidget.add(Radio(value: 1, groupValue: 1, onChanged: (v) {}));
          break;
        case FieldTypeEnum.DATETIME:
          rowWidget.add(Radio(value: 1, groupValue: 1, onChanged: (v) {}));
          break;
        case FieldTypeEnum.SELECT:
          final dynamic item = json.decode(field.optionData ?? '');
          if (item is Map) {
            List<DropdownMenuItem<String>> items = [];
            item.forEach((k1, v1) {
              items.add(DropdownMenuItem(
                child: Text(v1),
                value: k1,
              ));
              // rowWidget.add(Radio(value: v1, groupValue: k1, onChanged: (v) {}));
            });
            // rowWidget.add(DropdownButton(items: items, onChanged: (v) => field.value = v?.toString()));

            rowWidget.add(DropdownButtonFormField(
              items: items,
              onChanged: (v) => field.value = v?.toString(),
              decoration: InputDecoration(labelText: field.name),
            ));
          }
          break;
        case FieldTypeEnum.CHECKBOX:
        case FieldTypeEnum.MOBILE:
        case FieldTypeEnum.EMAIL:
        case FieldTypeEnum.FILE:
        case FieldTypeEnum.USER:
        case FieldTypeEnum.DEPT:
        case FieldTypeEnum.BOOLEAN_VALUE:
        case FieldTypeEnum.WEBSITE:
        case FieldTypeEnum.ADDRESS:
        case FieldTypeEnum.POSITION:
        case FieldTypeEnum.DETAIL_TABLE:
        case FieldTypeEnum.HANDWRITING_SIGN:
        case FieldTypeEnum.DATE_INTERVAL:
        case FieldTypeEnum.TAG:
        case FieldTypeEnum.ATTENTION:
        case FieldTypeEnum.SERIAL_NUMBER:
        case FieldTypeEnum.FORMULA:
        case FieldTypeEnum.POSITION_LNG_LAT:
          break;
        case FieldTypeEnum.unknown:
        // TODO: Handle this case.
      }
    });
    logD(rowWidget.length);
    //返回数据
    return Column(
      children: rowWidget,
    );
  }

  Widget itemDetailWidget() {
    List<Widget> rowWidget = [];
    fieldList.forEach((field) {
      logD(field);
      rowWidget.add(
        Container(
          // decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(8),
          //     color: Colors.greenAccent),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(field.name),
              Text(":"),
              Text(
                field.value.toString(),
                // style: TextStyle(backgroundColor: Colors.blue),
              )
            ],
          ),
        ),
      );
    });
    logD(rowWidget.length);
    //返回数据
    return Column(
      children: rowWidget,
    );
  }

  /// 线
  Widget lineWidget() {
    return Container(
      height: 2.h,
      width: 1.sw - 20.w,
      color: Get.isDarkMode ? darkTheme.dividerColor : lightTheme.dividerColor,
    );
  }
}
