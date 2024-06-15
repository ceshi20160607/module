import 'package:get/get.dart';

import '../../around/login/login_binding.dart';
import '../../around/login/login_view.dart';
import '../../around/navbar/navbar_binding.dart';
import '../../around/navbar/navbar_view.dart';
import '../enum/module_type.dart';

class AppRoutes {
  ///pages map
  static List<GetPage> routes = [
    GetPage(
        name: ModuleTypeEnum.MAIN.routepath,
        page: () => LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: ModuleTypeEnum.NAVBAR.routepath,
        page: () => NavbarPage(),
        binding: NavbarBinding()),

  ];
}
