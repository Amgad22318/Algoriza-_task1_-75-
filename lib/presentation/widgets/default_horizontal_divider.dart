import 'package:flutter/material.dart';
import 'package:task1/presentation/styles/colors.dart';

class DefaultHorizontalDivider extends StatelessWidget {
  final double? endIndent;
  final double? indent;
  const DefaultHorizontalDivider(
      {Key? key, this.endIndent = 10, this.indent = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: defaultLightGreyColor,
      thickness: 1,
      endIndent: endIndent,
      indent: indent,
    );
  }
}
