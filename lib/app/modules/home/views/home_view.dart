import 'package:kuraimas/app/modules/home/widget/home_nav.dart';
import 'package:kuraimas/app/modules/home/widget/main_content.dart';
import 'package:kuraimas/app/theme/colors.dart';
import 'package:kuraimas/app/utils/acc_svg.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colors[1].color,
        body: SizedBox(
          height: Get.height,
          child: Stack(children: [
            Positioned(
                right: -50,
                top: 0,
                child: CustomPaint(
                    painter: AccSVG(),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width / 1.4,
                        height: 200))),
            // DetailAnimeTabWidget()
            Positioned(
              top: 160,
              left: -35,
              child: Container(
                height: 121,
                width: 121,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffF89235), width: 20),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SizedBox(
              width: Get.width,
              height: 200,
              child: const HomeNav(),
            ),
            MainContent()
          ]),
        ));
  }
}
