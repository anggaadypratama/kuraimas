import 'package:kuraimas/app/widget/slide_up.dart';
import 'package:flutter/material.dart';

void modalBottomSheet(ctx, {initialSlide, minSlide, maxSlide, title, value}) {
  showModalBottomSheet(
      context: ctx,
      isScrollControlled: true,
      isDismissible: true,
      backgroundColor: Colors.transparent,
      builder: (context) => SlideUp(
          initialSlide: initialSlide,
          minSlide: minSlide,
          maxSlide: maxSlide,
          title: title,
          value: value));
}
