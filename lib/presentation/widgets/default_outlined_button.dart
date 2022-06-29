import 'package:flutter/material.dart';
import 'package:task1/presentation/styles/colors.dart';

class DefaultOutlinedButton extends StatelessWidget {
  final double width;
  final double? height;
  final double radius;
  final VoidCallback onPressed; // voidCallback = void Function()
  final Widget child;
  final Color borderColor;
  final EdgeInsetsGeometry padding;

  const DefaultOutlinedButton({
    Key? key,
    required this.onPressed,
    this.width = double.infinity,
    this.radius = 8,
    required this.child,
    this.height,
    this.borderColor = defaultAppColor,
    this.padding = const EdgeInsets.symmetric(vertical: 6),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            side: BorderSide(width: 2, color: borderColor),
          ),
          onPressed: onPressed,
          child: Padding(
            padding: padding,
            child: child,
          )),
    );
  }
}
