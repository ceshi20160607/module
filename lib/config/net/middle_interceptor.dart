import 'dart:convert';

import 'package:dio/dio.dart';

import '../const/key_const.dart';
import '../util/log_util.dart';
import '../util/shared_preferences.dart';

class MiddleInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // options.headers["Access-Control-Allow-Origin"] = "*";
    // 将数据内容json 转为字符串
    // String content = json.encode(options);
    // 获取url 路径
    String urlPath = options.path;
    // logD("requestcontent---->:$content");
    logD("requestPath---->:$urlPath");
    logD("requestParam--->:${options.queryParameters}");
    logD("data--->:${options.data}");
    //---------------------------token-----------------------------
    bool isLogin = SharedPreferencesUtil.getBool(KSConst.isLogin) ?? false;
    if (isLogin) {
      String satoken = SharedPreferencesUtil.getString(KSConst.saToken) ?? "";
      if (satoken != "") {
        options.headers["satoken"] = satoken;
      }
      logD("satoken---->:$satoken");
    }
    // String content = json.encode(options);
    // logD("satoken---->:$content");
    //---------------------------token-----------------------------
    return handler.next(options);
  }
}
