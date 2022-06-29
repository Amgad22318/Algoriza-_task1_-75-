import 'package:flutter/material.dart';
import 'package:task1/presentation/styles/colors.dart';

class DefaultIconButton extends StatelessWidget {
  final Widget icon;
  final double radius;
  final Color background;
  final Color? splashColor;
  final VoidCallback onPressed;
  final Widget? child;

  const DefaultIconButton({
    Key? key,
    required this.onPressed,
    this.background = defaultBlackColor,
    this.radius = 24,
    this.child,
    this.splashColor,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(radius),
      color: background,
      child: IconButton(
        splashRadius: radius,
        alignment: AlignmentDirectional.center,
        splashColor: splashColor,
        color: background,
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}
