import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'login_logic.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final logic = Get.find<LoginLogic>();
  final state = Get.find<LoginLogic>().state;

  @override
  Widget build(BuildContext context) {
    return buildBg();
  }

  Widget buildBg() {
    return Scaffold(
        body: ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        const SizedBox(height: kToolbarHeight), // 距离顶部一个工具栏的高度
        // buildTitle(), // Login
        buildTitleLine(), // Login下面的下划线
        const SizedBox(height: 60),
        buildEmailTextField(), // 输入邮箱
        const SizedBox(height: 30),
        buildPasswordTextField(), // 输入密码
        buildForgetPasswordText(), // 忘记密码
        const SizedBox(height: 60),
        buildLoginButton(), // 登录按钮
        const SizedBox(height: 40),
        buildOtherLoginText(), // 其他账号登录
        // buildOtherMethod(), // 其他登录方式
        buildRegisterText(), // 注册
      ],
    ));
  }

  Widget buildRegisterText() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '没有账号?',
              style: TextStyle(fontSize: 14.sp),
            ),
            GestureDetector(
              child: Text('点击注册',
                  style: TextStyle(color: Colors.green, fontSize: 14.sp)),
              onTap: () {
                print("点击注册");
              },
            )
          ],
        ),
      ),
    );
  }

  // Widget buildOtherMethod() {
  //   return ButtonBar(
  //     alignment: MainAxisAlignment.center,
  //     children: _loginMethod
  //         .map((item) => Builder(builder: (context) {
  //       return IconButton(
  //           icon: Icon(item['icon'],
  //               color: Theme.of(context).iconTheme.color),
  //           onPressed: () {
  //             //TODO: 第三方登录方法
  //             ScaffoldMessenger.of(context).showSnackBar(
  //               SnackBar(
  //                   content: Text('${item['title']}登录'),
  //                   action: SnackBarAction(
  //                     label: '取消',
  //                     onPressed: () {},
  //                   )),
  //             );
  //           });
  //     }))
  //         .toList(),
  //   );

  Widget buildOtherLoginText() {
    return Center(
      child: Text(
        '其他账号登录',
        style: TextStyle(color: Colors.grey, fontSize: 14.sp),
      ),
    );
  }

  Widget buildLoginButton() {
    buildTitle();
    return Align(
      child: SizedBox(
        height: 45,
        width: 270,
        child: ElevatedButton(
          style: ButtonStyle(
              // 设置圆角
              shape: MaterialStateProperty.all(const StadiumBorder(
                  side: BorderSide(style: BorderStyle.none)))),
          child: Text('登录', style: TextStyle(fontSize: 30.sp)),
          onPressed: () => logic.on_login(),
        ),
      ),
    );
  }

  Widget buildForgetPasswordText() {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () => logic.on_password(),
          child: Text("忘记密码？",
              style: TextStyle(color: Colors.grey, fontSize: 14.sp)),
        ),
      ),
    );
  }

  Widget buildPasswordTextField() {
    return TextFormField(
        style: TextStyle(fontSize: 14.sp),
        onChanged: (v) => state.password = v!,
        // onSaved: (v) => state.loginEntity.password = v!,
        // validator: (v) => logic.on_password_check(v),
        obscureText: state.isObscure,
        decoration: InputDecoration(
          labelText: "密码",
          labelStyle: TextStyle(fontSize: 14.sp),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.remove_red_eye,
              color: state.isObscure ? Colors.grey : Colors.green,
            ),
            onPressed: logic.on_password_show(),
          ),
        ));
  }

  Widget buildEmailTextField() {
    return TextFormField(
      style: TextStyle(fontSize: 14.sp),
      decoration: InputDecoration(
          labelText: '用户名/邮箱', labelStyle: TextStyle(fontSize: 14.sp)),
      // validator: (v) => logic.on_username_check(v),
      // onSaved: (v) => state.loginEntity.username = v!,
      // onSaved: (v) => logic.on_username_check(v),
      onChanged: (v) => state.username = v!,
    );
  }

  Widget buildTitleLine() {
    return Padding(
        padding: const EdgeInsets.only(left: 12.0, top: 4.0),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            color: Colors.black,
            width: 40,
            height: 2,
          ),
        ));
  }

  Widget buildTitle() {
    return Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          '登录',
          style: TextStyle(fontSize: 42.sp),
        ));
  }
}
