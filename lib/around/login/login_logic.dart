import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../config/const/key_const.dart';
import '../../config/enum/module_type.dart';
import '../../config/net/http.dart';
import '../../config/util/log_util.dart';
import '../../config/util/shared_preferences.dart';
import '../../config/widget/loading_widget.dart';
import '../../models/loginuser/loginuser.dart';
import '../../models/loginuser/user.dart';

class LoginLogic extends GetxController {
  final Loginuser state = Loginuser();

  @override
  void onInit() {
    state.username = "admin";
    state.password = "123123aa";
    state.loginType = 0;
    state.deviceType = 0;
    state.isObscure = false;
  }
  on_login() {
    // BaseOptions baseOptions = new BaseOptions(
    //     baseUrl: "http://localhost:9099/"
    // );
    // Dio dio = new Dio(baseOptions);
    // // var ret = dio.get("user/isLogin");
    // // print(ret);
    //
    // var data = {
    //   "username": "admin",
    //   "password": "123123aa",
    //   "loginType": 0,
    //   "deviceType": 0
    // };
    // print(data);
    // dio.post("user/doLogin", data: data,options: Options(responseType: ResponseType.json)).then((ret){
    //   print(ret.data);
    // });
    /// 展示loading
    Loading.show();

    Http().client.doLogin(state.toJson()).then((value) {
      Loading.dissmiss();
      // netState = NetState.dataSussessState;
      // infoWorkModel = value.data!;
      // SharedPreferencesUtil.sharedPreferences.set
      User user = value.data!;

      logD("msg" + value.toString());

      ///设置缓存token
      SharedPreferencesUtil.sharedPreferences.setBool(KSConst.isLogin, true);
      SharedPreferencesUtil.sharedPreferences
          .setString(KSConst.saToken, user.tokenValue);

      //跳转页面
      // Get.offAllNamed(ModuleTypeEnum.NAVBAR.routepath);
      Get.offAllNamed(ModuleTypeEnum.DRAWER.routepath);
      //更新
      update();
    }).catchError((onError) {
      /// 结束loading
      Loading.dissmiss();
      print(onError);
      // netState = NetState.errorshowRelesh;
      update();
    });
  }

  on_password() {}

  on_password_show() {}
}
