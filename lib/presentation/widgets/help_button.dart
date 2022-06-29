import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:task1/presentation/styles/colors.dart';
import 'package:task1/presentation/widgets/default_text.dart';

class HelpButton extends StatelessWidget {
  const HelpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(children: [
        DefaultText(
          text: 'Help',
          color: defaultAppColor,
          fontSize: 12.sp,
        ),
        const SizedBox(
          width: 8,
        ),
        Icon(
          Icons.help,
          color: defaultAppColor,
          size: 3.h,
        )
      ]),
    );
  }
}
