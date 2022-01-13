import 'package:flutter/material.dart';

class AppSection extends StatelessWidget {
  const AppSection({Key? key, this.title, this.child, this.margin})
      : super(key: key);

  final String? title;
  final Widget? child;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.only(top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? '',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Container(
            margin: const EdgeInsets.only(top: 22),
            child: child ?? Container(),
          )
        ],
      ),
    );
  }
}
