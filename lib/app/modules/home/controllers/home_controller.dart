import 'package:kuraimas/app/modules/home/models/button_model.dart';
import 'package:kuraimas/app/utils/season.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // var buttonListData = [
  //   ButtonModel(
  //           isActive: false,
  //           icon: FontAwesomeIcons.canadianMapleLeaf,
  //           title: 'Fall')
  //       .toMap(),
  //   ButtonModel(
  //           isActive: false, icon: FontAwesomeIcons.snowflake, title: 'Winter')
  //       .toMap(),
  //   ButtonModel(isActive: false, icon: FontAwesomeIcons.leaf, title: 'Spring')
  //       .toMap(),
  //   ButtonModel(isActive: false, icon: FontAwesomeIcons.sun, title: 'Summer')
  //       .toMap(),
  // ].obs;

  // HomeController() {
  //   var buttonListIndex = buttonListData.indexWhere(
  //       (i) => i['title'].toString().toLowerCase() == Season.getSeason());

  //   buttonListData[buttonListIndex].update('isActive', (value) => true);
  // }

  // void reset() {
  //   buttonListData.forEach((element) {
  //     element.update("isActive", (value) => false);
  //   });
  // }

  // void selectSeason(int i) {
  //   if (buttonListData[i]['isActive'] == false) {
  //     reset();
  //     buttonListData[i].update('isActive', (value) => true);
  //     buttonListData.refresh();
  //   }
  // }
}
