import 'package:flutter/material.dart';
import 'package:zendesk_test/main.dart';

Future<dynamic> showTMDialog(
    {required String title,
    String? msg,
    required Icon icon,
    Function()? onDissmiss,
    Widget? view,
    bool? barrierDismissible}) {
  final theme = Theme.of(navigatorKey.currentContext!);
  final query = MediaQuery.of(navigatorKey.currentContext!);
  Widget okButton = ElevatedButton(
    child: const Text("back"),
    onPressed: () {
      navigatorKey.currentState!.pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    // titlePadding:
    //     const EdgeInsets.all(kDefaultPadding * 1.5).copyWith(bottom: 0),
    contentPadding: const EdgeInsets.all(15 * 1.5).copyWith(top: 12),
    insetPadding: const EdgeInsets.symmetric(horizontal: 12),
    actionsPadding: const EdgeInsets.all(12 * 1.5).copyWith(top: 0),
    title: SizedBox(
      width: query.size.width,
      child: Row(
        children: [
          Text(
            title,
            maxLines: 1,
            style: theme.textTheme.titleMedium?.copyWith(
              color: icon.color,
            ),
          ),
          const Spacer(),
          icon,
        ],
      ),
    ),
    content: view ??
        Wrap(
          children: [
            Text(msg!, style: theme.textTheme.bodySmall),
            const SizedBox(height: 12, width: double.infinity),
            okButton,
          ],
        ),
  );

  return showDialog(
    barrierDismissible: barrierDismissible ?? true,
    context: navigatorKey.currentContext!,
    builder: (BuildContext context) {
      return alert;
    },
  ).then((value) => onDissmiss != null ? onDissmiss() : null);
}
