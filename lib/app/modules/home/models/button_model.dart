import 'package:flutter/material.dart';

class ButtonModel {
  ButtonModel({this.icon, this.title, this.isActive});

  IconData? icon;
  String? title;
  late bool? isActive;

  Map<String, dynamic> toMap() => ({
        'isActive': isActive,
        'title': title,
        'icon': icon,
      });
}
