import 'package:kuraimas/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonSeason extends StatelessWidget {
  ButtonSeason(
      {Key? key,
      this.title,
      this.icon,
      this.isActive = false,
      this.index,
      required this.status})
      : super(key: key);

  final String? title;
  final IconData? icon;
  final bool isActive;
  final int? index;
  final Function(int? status) status;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.fromLTRB(5, 6, 5, 6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: isActive ? primaryColor[900] : primaryColor[100]),
            child: IconButton(
                onPressed: () => status(index),
                icon: FaIcon(
                  icon,
                  size: 20,
                  color: isActive ? Colors.white : primaryColor[900],
                ))),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            title ?? 'Title',
            style: TextStyle(
                color: isActive ? Colors.black : Color(0xff9E9EA7),
                fontSize: 12),
          ),
        )
      ],
    );
  }
}
