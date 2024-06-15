import 'package:get/get.dart';

import 'modulefield_logic.dart';

class ModulefieldBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ModulefieldLogic());
  }
}
