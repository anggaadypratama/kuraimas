import 'package:kuraimas/app/modules/detail/controllers/character_controller.dart';
import 'package:kuraimas/app/modules/detail/widget/character_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCharacterCardWidget extends StatelessWidget {
  ListCharacterCardWidget({Key? key}) : super(key: key);

  var charactersControllers = Get.find<CharacterController>();

  @override
  Widget build(BuildContext context) {
    return charactersControllers.obx((state) => ListView.builder(
          itemBuilder: (ctx, i) {
            var data = state!.character?[i];
            dynamic va = data.va.length > 0 ? data.va[0]['name'] : '';
            return CharacterCardWidget(
              characterImage: data.imgUrl,
              characterName: data.name,
              characterVA: va,
            );
          },
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: state!.character!.length,
        ));
  }
}
