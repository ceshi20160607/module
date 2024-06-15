import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/base/base_controller.dart';
import '../../master/examine/examine_view.dart';
import '../../master/module/module_view.dart';

class NavbarLogic extends BaseController {
  List<Widget> tabPageList = [
    ModulePage(),
    ExaminePage(),
  ];
  var tabIndex = 0.obs;

  @override
  void initData() {}

  @override
  void onHidden() {
    // TODO: implement onHidden
  }
}
