import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as modal;

Future<T?> showModal<T>(
    {required BuildContext context,
    required Widget Function(BuildContext, ScrollController) builder,
    double? topMargin,
    bool? enableDrag}) {
  return modal.showCupertinoModalBottomSheet<T>(
      closeProgressThreshold: 0.0,
      bounce: false,
      context: context,
      animationCurve: Curves.fastOutSlowIn,
      enableDrag: enableDrag ?? true,
      duration: const Duration(milliseconds: 300),
      topRadius: const Radius.circular(12),
      elevation: 0,
      builder: (context) => Container(
            child: builder(
              context,
              ScrollController(),
            ),
          ));
}

Future<T?> showModalKD<T>(
    {required BuildContext context,
    required Widget Function(BuildContext, ScrollController) builder,
    double? topSpace,
    bool? enableDrag,
    double? horizontalMargin}) {
  return showModalBottomSheet<T>(
      isScrollControlled: true,
      enableDrag: true,
      context: context,
      builder: (context) {
        return Stack(
          children: [
            Container(
              margin: topSpace != null
                  ? EdgeInsets.symmetric(
                      vertical: topSpace / 2, horizontal: horizontalMargin ?? 0)
                  : EdgeInsets.symmetric(horizontal: horizontalMargin ?? 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: builder(
                  context,
                  ScrollController(),
                ),
              ),
            ),
          ],
        );
      },
      backgroundColor: Colors.transparent,
      elevation: 0);
}
