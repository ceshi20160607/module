import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'config/const/key_const.dart';
import 'config/enum/module_type.dart';
import 'config/env/global.dart';
import 'config/env/themConfig.dart';
import 'config/route/routes.dart';
import 'config/util/shared_preferences.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  ///app 全局context
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;

    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) => GetMaterialApp(
              getPages: AppRoutes.routes,
              // localizationsDelegates: const [
              //   GlobalMaterialLocalizations.delegate,
              //   GlobalWidgetsLocalizations.delegate,
              //   GlobalCupertinoLocalizations.delegate, //iOS
              // ],
              defaultTransition: Transition.cupertino,
              // supportedLocales: const [
              //   Locale('zh', 'CN'),
              //   Locale('en', 'US'),
              // ],
              builder: (context, widget) {
                return MediaQuery(
                  //设置文字大小不随系统设置改变
                  data: MediaQuery.of(context).copyWith(
                    textScaleFactor: 1.0,
                  ),
                  child: FlutterEasyLoading(
                    child: widget,
                  ),
                );
              },
              // navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,
              // home: TabbarPage(),
              // initialBinding: TabbarBinding(),
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: ThemeMode.light,
              // routingCallback: (routing) {},
              initialRoute: SharedPreferencesUtil.getBool(KSConst.isLogin)
                  ? ModuleTypeEnum.NAVBAR.routepath
                  : ModuleTypeEnum.LOGIN.routepath,
            ));
  }
}
