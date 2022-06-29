import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:task1/presentation/styles/colors.dart';
import 'package:task1/presentation/widgets/default_svg.dart';
import 'package:task1/presentation/widgets/default_text.dart';

import 'default_outlined_button.dart';

class DefaultGoogleSignButton extends StatelessWidget {
  final VoidCallback onPressed;
  const DefaultGoogleSignButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultOutlinedButton(
      onPressed: onPressed,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const DefaultSvg(iconPath: 'assets/icons/google.svg'),
        const SizedBox(width: 10),
        Flexible(
          child: DefaultText(
              text: 'Sign In with Google',
              color: defaultAppColor,
              fontSize: 12.sp),
        ),
      ]),
    );
  }
}
