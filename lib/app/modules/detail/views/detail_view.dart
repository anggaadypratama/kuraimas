import 'package:kuraimas/app/modules/detail/controllers/character_controller.dart';
import 'package:kuraimas/app/modules/detail/widget/appbar_widget.dart';
import 'package:kuraimas/app/modules/detail/widget/detail_tab_widget.dart';
import 'package:kuraimas/app/modules/detail/widget/information_group_widget.dart';
import 'package:kuraimas/app/modules/detail/widget/synopsis_widget.dart';
import 'package:kuraimas/app/modules/detail/widget/title_group_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  var charactersControllers = Get.put(CharacterController());

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> argument = Get.arguments[0];

    if (argument.length > -1) {
      controller.setIdPost(argument['malId']);
      charactersControllers.setIdCharacters(argument['malId']);
    }

    return Scaffold(
      backgroundColor: Color(0xffFDFDFD),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
              pinned: true, delegate: DetailAppBar(data: argument)),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 95,
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(<Widget>[
            TitleGroup(
              data: argument,
            ),
            Container(
                margin: const EdgeInsets.only(top: 50, bottom: 32),
                child: controller.obx((detailData) => InformationGroupWidget(
                      detailData: detailData,
                    ))),
            Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: controller.obx((detailData) =>
                    Synopsis(text: detailData?.synopsis ?? ''))),
            charactersControllers.obx(
              (state) => Container(
                width: Get.width,
                height: state!.character! != null
                    ? (state.character!.length * 150) + 80
                    : 250,
                margin: const EdgeInsets.only(left: 20, right: 20, top: 35),
                child: DetailTabWidget(),
              ),
            ),
          ]))
        ],
      ),
    );
  }
}
