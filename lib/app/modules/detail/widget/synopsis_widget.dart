import 'package:kuraimas/app/widget/modal_bottom_sheet.dart';
import 'package:flutter/material.dart';

class Synopsis extends StatelessWidget {
  const Synopsis({Key? key, this.text = ""}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        modalBottomSheet(context,
            initialSlide: 0.64,
            minSlide: 0.2,
            maxSlide: 0.95,
            value: text,
            title: 'Synopsis');
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: const Color(0xFFF1F1F1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 15, 20, 15),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Synopsis',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 13, 0, 0),
                  child: Text(text,
                      maxLines: 7,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        fontStyle: FontStyle.normal,
                        color: const Color(0xFF474747),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
