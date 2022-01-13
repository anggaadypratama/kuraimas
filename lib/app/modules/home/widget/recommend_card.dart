import 'package:kuraimas/app/utils/hero_tag.dart';
import 'package:kuraimas/app/widget/badge_rating.dart';
import 'package:kuraimas/app/widget/hero_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommendCard extends StatelessWidget {
  const RecommendCard({Key? key, required this.data}) : super(key: key);

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/detail', arguments: [data]);
      },
      child: SizedBox(
        width: 148,
        height: 230,
        child: Column(
          children: [
            Stack(
              children: [
                HeroWidget(
                  tag: HeroTag.image(data['imgUrl']!.toString()),
                  child: Container(
                    width: 148,
                    height: 197,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEEEEE),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                          data['imgUrl'].toString(),
                        ),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(
                  width: 148,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10, right: 10),
                        child: HeroWidget(
                          tag: HeroTag.score(data),
                          child: BadgeRating(
                            rating: data['score']?.toDouble() ?? 0,
                            padding: const EdgeInsets.fromLTRB(7, 3, 8, 3),
                            size: 8,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
              child: HeroWidget(
                tag: HeroTag.title(data),
                child: Text(
                  data['title']?.length >= 16
                      ? data['title'].toString().substring(0, 16) + '...'
                      : data['title'].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
