import 'package:flutter/cupertino.dart';

extension ExpandWidgets on List<Widget> {
  List<Widget> setAllExpanded() => map(
        (w) => Expanded(child: w),
      ).toList();
}
