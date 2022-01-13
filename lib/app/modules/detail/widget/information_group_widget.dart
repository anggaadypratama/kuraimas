import 'package:kuraimas/app/modules/detail/controllers/detail_controller.dart';
import 'package:kuraimas/app/modules/detail/models/detail_model.dart';
import 'package:kuraimas/app/modules/detail/widget/information_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class InformationGroupWidget extends StatelessWidget {
  InformationGroupWidget({Key? key, required this.detailData})
      : super(key: key);

  DetailModel? detailData;

  @override
  Widget build(BuildContext context) {
    List splitDuration = detailData?.duration?.split(' ') ?? [];
    String? duration = splitDuration.length > 2
        ? splitDuration[0] + " " + splitDuration[1]
        : detailData?.duration;
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: InformationDetailWidget(
            value: detailData?.episodes.toString() ?? '?',
            type: 'Episode',
          ),
        ),
        Expanded(
          child: InformationDetailWidget(
            value: detailData?.status ?? '?',
            type: 'Status',
          ),
        ),
        Expanded(
          child:
              InformationDetailWidget(value: duration ?? '?', type: 'Duration'),
        ),
      ],
    );
  }
}
