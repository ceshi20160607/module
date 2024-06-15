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
    state.username = "";
    state.password = "";
    state.loginType = 0;
    state.deviceType = 0;
    state.isObscure = false;
  }

  on_login() {
    var dio = new Dio();
    var data = {
      "username": "admin",
      "password": "123123aa",
      "loginType": 0,
      "deviceType": 0
    };
    print(data);
    var resss = dio.post("http://192.168.0.6:9099/user/doLogin", data: data);

    print(resss);
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
      SharedPreferencesUtil.sharedPreferences.setBool(KS.isLogin, true);
      SharedPreferencesUtil.sharedPreferences
          .setString(KS.saToken, user.tokenValue);

      //跳转页面
      Get.offAllNamed(ModuleTypeEnum.NAVBAR.routepath);
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
