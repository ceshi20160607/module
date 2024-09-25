import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../const/color_const.dart';
import '../../env/themConfig.dart';

class StepperWidget extends StatelessWidget {
  final Map<String,dynamic> module;

  const StepperWidget({super.key, required this.module});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 10.h),
      width: 1.sw,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          leftText('模块'),
          lineWidget(),
          const SizedBox(height: 60),
        ],
      ),
    );
  }

  /// 我的订单文字
  Widget leftText(String title) {
    return Expanded(
      flex: 1,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Icon(Icons.comment),
          ],
        ),
    );
  }
  Widget lineText() {
    return Expanded(
        flex: 1,
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            DecoratedBox(
                decoration:BoxDecoration(color: Colors.green),
                child: RotatedBox(quarterTurns: 1,),),
            Icon(Icons.cached,color: Colors.lightGreen,)
          ],
        )

        // DecoratedBox(
        //   decoration: BoxDecoration(color: Colors.green),
        //   //将Transform.rotate换成RotatedBox
        //   child: RotatedBox(
        //     quarterTurns: 1, //旋转90度(1/4圈)
        //     child: Icon(Icons.cached),
        //   ),
        // )
    );
  }

  /// 我的订单文字
  Widget orderText(String title) {
    TextStyle style =
    TextStyle(color: Colors.black, fontSize: 32.sp, fontWeight: FontWeight.w600);
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: style,
      ),
    );
  }
  /// 订单item
  Widget rowItem(String title) {
    TextStyle style = TextStyle(
        color: ColorConst.secondTextColor, fontSize: 32.sp, fontWeight: FontWeight.w400);
    return Row(
      children: [
        // Image(
        //     fit: BoxFit.fill,
        //     width: 24.w,
        //     height: 24.w,
        //     image: const AssetImage("assets/images/daishouhuo.png")),
        SizedBox(
          width: 4.h,
        ),
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: style,
        ),
      ],
    );
  }

  Widget lineWidget() {
    return Container(
      height: 2.h,
      width: 1.sw - 20.w,
      color: Get.isDarkMode ? darkTheme.dividerColor : lightTheme.dividerColor,
    );
  }
  //竖线
  Widget lineVerticalWidget() {
    return Container(
      height: 36.0,
      width: 1.0,
      color: Colors.grey.shade400,
    );
  }

  Widget _stepWidget(){
    return Stepper(
      currentStep: 0, // 当前 step
      physics: ClampingScrollPhysics(), // 滑动的物理效果
      type: StepperType.horizontal, // Stepper 类型，分为横向与纵向两种， StepperType
      // <Step> 子控件数组
      steps: _steps(),
    );
  }
  // 创建 <Step> steps 数组
  List <Step> _steps(){
    List <Step> steps = [];
    // _datas.forEach((model) {
    //   // 我们根据当前 step 进行区分，当前 step 之前的认为 StepState.complete，当前认为 StepState.editing，之后认为 StepState.indexed
    //   if(_currentStep < model.index) {
    //   //   model.state = StepState.indexed;
    //   // } else if(_currentStep == model.index) {
    //   //   model.state = StepState.editing;
    //   // } else if(_currentStep > model.index){
    //   //   model.state = StepState.complete;
    //   // }

      steps.add(
        Step(
          // 标题控件
          title: Row(
            children: [
              Icon(Icons.title),
              Text("title"),
            ],
          ),
          subtitle: Text("subTitle"), // 副标题控件
          content: Text("0000"), // 内容控件
          // isActive: (_currentStep == _datas.indexOf(model)), // 是否激活状态，true 时会变成蓝色
          // state: model.state, // 当前 step 的状态，StepState 会改变每一个 step 的图标
        ),
      );
    // });
    return steps;
  }
}