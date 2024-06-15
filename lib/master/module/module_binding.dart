import 'package:get/get.dart';

import 'module_logic.dart';

class ModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ModuleLogic());
  }
}
