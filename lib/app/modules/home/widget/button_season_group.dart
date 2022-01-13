import 'package:kuraimas/app/modules/home/controllers/home_controller.dart';
import 'package:kuraimas/app/modules/home/controllers/season_controller.dart';
import 'package:kuraimas/app/modules/home/widget/app_section.dart';
import 'package:kuraimas/app/modules/home/widget/button_season.dart';
import 'package:kuraimas/app/utils/season.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class ButtonSeasonGroup extends StatelessWidget {
  ButtonSeasonGroup({Key? key}) : super(key: key);

  final seasonController = Get.find<SeasonController>();

  @override
  Widget build(BuildContext context) {
    int activeSeason = seasonController.buttonListData.indexWhere(
        (i) => i['title'].toString().toLowerCase() == Season.getSeason());

    return AppSection(
        title: 'Season',
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: seasonController.buttonListData.asMap().entries.map((e) {
              return ButtonSeason(
                  isActive: e.value['isActive'] ?? false,
                  icon: e.value['icon'],
                  title: e.value['title'],
                  index: e.key,
                  status: (i) =>
                      seasonController.selectSeason(i ?? activeSeason));
            }).toList(),
          ),
        ));
  }
}
