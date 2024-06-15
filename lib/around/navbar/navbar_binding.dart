import 'package:get/get.dart';

import '../../master/examine/examine_logic.dart';
import '../../master/module/module_logic.dart';
import 'navbar_logic.dart';

class NavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavbarLogic());

    Get.lazyPut(() => ModuleLogic());
    Get.lazyPut(() => ExamineLogic());
  }
}
