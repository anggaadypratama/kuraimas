import 'package:get/get.dart';

import 'package:kuraimas/app/modules/home/controllers/season_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SeasonController>(
      () => SeasonController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
