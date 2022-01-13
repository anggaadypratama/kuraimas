import 'package:kuraimas/app/utils/hero_tag.dart';
import 'package:kuraimas/app/widget/badge_rating.dart';
import 'package:kuraimas/app/widget/hero_widget.dart';
import 'package:flutter/material.dart';

class TitleGroup extends StatelessWidget {
  TitleGroup({Key? key, required this.data}) : super(key: key);

  Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 250,
            child: HeroWidget(
              tag: HeroTag.title(data),
              child: Text(data['title'] ?? '?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          SizedBox(
            width: 250,
            child: HeroWidget(
              tag: HeroTag.score(data),
              child: BadgeRating(
                rating: data['score'] ?? 0.0,
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
