import 'package:flutter/material.dart';

class SlideUp extends StatelessWidget {
  SlideUp(
      {Key? key,
      required double this.initialSlide,
      required double this.minSlide,
      required double this.maxSlide,
      String? this.title,
      String? this.value})
      : super(key: key);

  double? initialSlide;
  double? minSlide;
  double? maxSlide;
  String? title;
  String? value;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: initialSlide ?? 0,
      minChildSize: minSlide ?? 0,
      maxChildSize: maxSlide ?? 0,
      builder: (context, scrollController) {
        return Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(
              children: [
                Container(
                  width: 48,
                  height: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xffDADBDF),
                  ),
                ),
                Expanded(
                    child: ListView(
                  controller: scrollController,
                  children: [
                    Container(
                        margin:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Text(
                          title ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
                        )),
                    Container(
                        margin:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Text(value ?? ''))
                  ],
                )),
              ],
            ));
      },
    );
  }
}
