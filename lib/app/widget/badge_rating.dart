import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BadgeRating extends StatelessWidget {
  const BadgeRating(
      {Key? key,
      required this.rating,
      this.height,
      this.width,
      this.padding,
      this.size,
      this.color})
      : super(key: key);

  final double rating;
  final int? height;
  final int? width;
  final EdgeInsetsGeometry? padding;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width?.toDouble(),
      height: height?.toDouble(),
      padding: padding,
      decoration: BoxDecoration(
        color: color ?? Color(0xFFEEEEEE),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            FontAwesomeIcons.solidStar,
            color: Color(0xFFFF7A00),
            size: size ?? 13,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
            child: Text(
              rating.toString(),
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: size ?? 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
