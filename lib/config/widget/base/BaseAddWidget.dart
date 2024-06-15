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

  const BaseAddWidget({super.key, required this.inputFlag, required this.fieldList});

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
          itemWidget(),
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
  Widget itemWidget() {
    List<Widget> rowWidget = [];
    fieldList.forEach((field) {
      logD(field);
      if (inputFlag) {
        switch (FieldTypeEnum.getType(field.type)) {
          case FieldTypeEnum.TEXT:
            rowWidget.add(Text(
              field.value ?? '',
              //文本的对齐方式；可以选择左对齐、右对齐还是居中。
              textAlign: TextAlign.center,
              //文本方向
              textDirection: TextDirection.ltr,
              //是否自动换行 false文字不考虑容器大小  单行显示   超出；屏幕部分将默认截断处理
              softWrap: false,
              //指定文本显示的最大行数，默认情况下，文本是自动折行的
              maxLines: 1,
              //如果有多余的文本，可以通过overflow来指定截断方式，默认是直接截断，
              //TextOverflow.clip剪裁   TextOverflow.fade 渐隐  TextOverflow.ellipsis省略号
              overflow: TextOverflow.ellipsis,
              //代表文本相对于当前字体大小的缩放因子，相对于去设置文本的样式style属性
              textScaleFactor: 1.5,
              style: TextStyle(
                //文字的颜色
                color: Colors.blue,
                //该属性和Text的textScaleFactor都用于控制字体大小
                //fontSize可以精确指定字体大小，而textScaleFactor只能通过缩放比例来控制。
                fontSize: 18.0,
                //该属性用于指定行高，但它并不是一个绝对值，而是一个因子，具体的行高等于fontSize*height
                height: 1.2,
                fontFamily: "Courier",
                background: new Paint()..color = Colors.yellow,
                //线的颜色
                decorationColor: const Color(0xffffffff),
                //none无文字装饰   lineThrough删除线   overline文字上面显示线    underline文字下面显示线
                decoration: TextDecoration.underline,
                //文字装饰的风格  dashed,dotted虚线(简短间隔大小区分)  double三条线  solid两条线
                decorationStyle: TextDecorationStyle.solid,
                //单词间隙(负值可以让单词更紧凑)
                wordSpacing: 0.0,
                //字母间隙(负值可以让字母更紧凑)
                letterSpacing: 0.0,
                //文字样式，斜体和正常
                fontStyle: FontStyle.italic,
                //字体粗细  粗体和正常
                fontWeight: FontWeight.w900,
              ),
            ));
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
                prefixStyle: TextStyle(color: Colors.orange, fontSize: 18),
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
            rowWidget.add(Radio(value: 1, groupValue: 1, onChanged: (v) {}));
            rowWidget.add(Radio(value: 2, groupValue: 1, onChanged: (v) {}));
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
      } else {
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
      }
    });
    logD(rowWidget.length);
    //返回数据
    return Column(
      children: rowWidget,
    );
    // return ListView(
    //   padding: EdgeInsets.all(30),
    //   children: [
    //     TextField(
    //       style: TextStyle(height: 20.h),
    //       readOnly: true,
    //       decoration: InputDecoration(
    //         filled: true,
    //         fillColor: Colors.lightBlue.shade100,
    //         prefixIcon: Icon(Icons.phone),
    //         prefixText: "qqqqq",
    //         prefixStyle: TextStyle(color: Colors.orange, fontSize: 18),
    //         hintText: "eeeee",
    //         // suffixIcon: Icon(Icons.clear),
    //       ),
    //     ),
    //   ],
    // );
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