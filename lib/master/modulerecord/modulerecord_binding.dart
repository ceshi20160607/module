import 'package:get/get.dart';

import 'modulerecord_logic.dart';

class ModulerecordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ModulerecordLogic());
  }
}
