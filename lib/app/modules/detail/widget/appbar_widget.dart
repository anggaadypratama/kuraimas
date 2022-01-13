import 'dart:ui';

import 'package:kuraimas/app/modules/detail/controllers/detail_controller.dart';
import 'package:kuraimas/app/utils/hero_tag.dart';
import 'package:kuraimas/app/widget/hero_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailAppBar extends SliverPersistentHeaderDelegate {
  var detailController = Get.find<DetailController>();

  DetailAppBar({this.data});

  final Map<String, dynamic>? data;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double offsetNegative = 400 / shrinkOffset;
    double appbarBorder = offsetNegative >= 30 ? 30 : offsetNegative;
    double offsetFade = 1 * offsetNegative;
    double isPosterDissapear = offsetFade <= 10 ? (offsetFade / 10) : 1;

    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding:
              EdgeInsets.all(appbarBorder / 2.5 >= 2.3 ? appbarBorder / 3 : 0),
          child: ClipRRect(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: data?['imgUrl'],
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.all(Radius.circular(appbarBorder)),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.all(appbarBorder / 2.5 >= 2.3 ? appbarBorder / 3 : 0),
          child: detailController.obx(
            (detailData) => InkWell(
              onTap: () async {
                var _url = detailData?.trailer ?? '';
                if (!await launch(_url)) throw 'Could not launch';
              },
              child: Container(
                height: 400.0,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(appbarBorder)),
                    color: Colors.white,
                    gradient: LinearGradient(
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black,
                        ],
                        stops: [
                          0.0,
                          1
                        ])),
                child: Center(
                  child: Opacity(
                    opacity: isPosterDissapear <= 0.163 ? 0 : isPosterDissapear,
                    child: InkWell(
                      child: IconButton(
                          // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                          icon: FaIcon(FontAwesomeIcons.play),
                          color: Colors.white,
                          onPressed: () async {
                            if (!await launch(detailData?.trailer ?? ''))
                              throw 'Could not launch';
                          }),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
            height: 200,
            width: 150,
            bottom: -75,
            child: Opacity(
              opacity: isPosterDissapear <= 0.135 ? 0 : isPosterDissapear,
              child: HeroWidget(
                tag: HeroTag.image(data?['imgUrl']),
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 50.0,
                          spreadRadius: 0.0,
                        )
                      ],
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(data?['imgUrl']))),
                ),
              ),
            )),
        Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: AppBar(
            title: Text(
              isPosterDissapear <= 0.12 ? data!['title'] : '',
              style: TextStyle(color: Colors.white),
            ),
            leading: Transform.translate(
              offset: Offset(15, 0),
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: isPosterDissapear <= 0.135457570967642
                          ? Colors.transparent
                          : Colors.white38,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            backgroundColor: isPosterDissapear >= 0.135457570967642
                ? Colors.transparent
                : Color(0xFFFF7A00),
            elevation: 0,
          ),
        ),

        // Container(color: Colors.amber),
      ],
    );
  }

  @override
  double get maxExtent => 400;

  @override
  double get minExtent => 106;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
