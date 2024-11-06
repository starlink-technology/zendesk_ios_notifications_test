import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:rxdart/rxdart.dart';
import 'package:zendesk_test/app/presintation/HomePage.dart';
import 'package:zendesk_test/app/presintation/modal.dart';
import 'package:zendesk_test/main.dart';
import 'package:zendesk_test/utils/extention.dart';

final globalScrollController = ScrollController();

class HelpButton extends StatefulWidget {
  const HelpButton({
    super.key,
  });

  @override
  State<HelpButton> createState() => _HelpButtonState();
}

class _HelpButtonState extends State<HelpButton> {
  bool _isFabExtended = true;
  final StreamController<ScrollDirection> _debounceStreamController =
      StreamController<ScrollDirection>();
  @override
  void initState() {
    super.initState();

    globalScrollController.addListener(() {
      _debounceStreamController
          .add(globalScrollController.position.userScrollDirection);
    });
    _debouncedTermStream();
  }

  _debouncedTermStream() {
    _debounceStreamController.stream
        .distinct()
        .debounceTime(const Duration(milliseconds: 150))
        .listen((userScrollDirection) {
      if (mounted) {
        if (userScrollDirection == ScrollDirection.reverse) {
          if (_isFabExtended) {
            setState(() {
              _isFabExtended = false;
            });

            kdp(name: "userScrollDirection", msg: _isFabExtended, c: 'm');
          }
        } else if (userScrollDirection == ScrollDirection.forward) {
          if (!_isFabExtended) {
            setState(() {
              _isFabExtended = true;
            });

            kdp(name: "userScrollDirection_0", msg: _isFabExtended, c: 'm');
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showModal(
          context: navigatorKey.currentContext!,
          enableDrag: false,
          builder: (c, a) {
            return const HomePage();
          }),
      child: Container(
        // color: tmBodyTextColor,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: const BoxDecoration(
          color: Color(0xfffefefe),
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(1, 1),
              blurRadius: 5,
            ),
          ],
        ),

        child: AnimatedSize(
          duration: const Duration(milliseconds: 200),
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            direction: Axis.horizontal,
            children: [
              const Icon(
                LucideIcons.helpCircle,
              ),
              if (_isFabExtended) const SizedBox(width: 8, height: 8),
              if (_isFabExtended)
                Text(
                  "help",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Colors.grey, fontWeight: FontWeight.w600),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
