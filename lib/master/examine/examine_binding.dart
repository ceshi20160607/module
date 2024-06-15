import 'package:get/get.dart';

import 'examine_logic.dart';

class ExamineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExamineLogic());
  }
}
