import 'package:get/get.dart';

import '../../around/login/login_binding.dart';
import '../../around/login/login_view.dart';
import '../../around/navbar/navbar_binding.dart';
import '../../around/navbar/navbar_view.dart';
import '../../master/examine/examine_binding.dart';
import '../../master/examine/examine_view.dart';
import '../../master/module/module_binding.dart';
import '../../master/module/module_view.dart';
import '../../master/modulefield/modulefield_binding.dart';
import '../../master/modulefield/modulefield_view.dart';
import '../../master/modulerecord/modulerecord_binding.dart';
import '../../master/modulerecord/modulerecord_view.dart';
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

    GetPage(
        name: ModuleTypeEnum.MODULE.routepath,
        page: () => ModulePage(),
        binding: ModuleBinding()),
    GetPage(
        name: ModuleTypeEnum.MODULEFIELD.routepath,
        page: () => ModulefieldPage(),
        binding: ModulefieldBinding()),
    GetPage(
        name: ModuleTypeEnum.MODULERECORD.routepath,
        page: () => ModulerecordPage(),
        binding: ModulerecordBinding()),
    GetPage(
        name: ModuleTypeEnum.EXAMINE.routepath,
        page: () => ExaminePage(),
        binding: ExamineBinding()),

  ];
}
