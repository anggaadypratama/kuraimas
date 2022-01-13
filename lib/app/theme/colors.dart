import 'package:flutter/material.dart';

class _Colors {
  const _Colors(this.color, this.name);

  final Color? color;
  final String? name;
}

List<_Colors> colors = const <_Colors>[
  _Colors(null, 'Clear'),
  _Colors(Color(0xFFFF7A00), 'primary'),
  _Colors(Color(0xFFA7A7A7), 'greyText')
];

Map<int, Color> primaryColor = {
  50: const Color.fromRGBO(255, 112, 0, .1),
  100: const Color.fromRGBO(255, 112, 0, .2),
  200: const Color.fromRGBO(255, 112, 0, .3),
  300: const Color.fromRGBO(255, 112, 0, .4),
  400: const Color.fromRGBO(255, 112, 0, .5),
  500: const Color.fromRGBO(255, 112, 0, .6),
  600: const Color.fromRGBO(255, 112, 0, .7),
  700: const Color.fromRGBO(255, 112, 0, .8),
  800: const Color.fromRGBO(255, 112, 0, .9),
  900: const Color.fromRGBO(255, 112, 0, 1),
};
