import 'package:get/get.dart';

import 'drawer_logic.dart';

class DrawerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DrawerLogic());
  }
}
