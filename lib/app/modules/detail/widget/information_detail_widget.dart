import 'package:flutter/material.dart';

class InformationDetailWidget extends StatelessWidget {
  InformationDetailWidget({Key? key, required this.type, required this.value})
      : super(key: key);

  String value;
  String type;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(value,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            )),
        Text(type,
            style: TextStyle(
              color: const Color(0xFFC6C6C6),
              fontSize: 13,
            )),
      ],
    );
  }
}
