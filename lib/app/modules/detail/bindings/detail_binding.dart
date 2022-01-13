import 'package:get/get.dart';

import 'package:kuraimas/app/modules/detail/controllers/character_controller.dart';

import '../controllers/detail_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CharacterController>(
      () => CharacterController(),
    );
    Get.lazyPut<DetailController>(
      () => DetailController(),
    );
  }
}
