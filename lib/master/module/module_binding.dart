import 'package:get/get.dart';
import 'package:module/master/modulerecord/modulerecord_logic.dart';

import '../modulefield/modulefield_logic.dart';
import 'module_logic.dart';

class ModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ModuleLogic());
  }
}
