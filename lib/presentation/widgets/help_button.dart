import 'package:flutter/material.dart';
import 'package:task1/presentation/styles/colors.dart';
import 'package:task1/presentation/widgets/default_text.dart';

class HelpButton extends StatelessWidget {
  const HelpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(children: const [
        DefaultText(
          text: 'Help',
          color: defaultAppColor,
        ),
        SizedBox(
          width: 8,
        ),
        Icon(
          Icons.help,
          color: defaultAppColor,
        )
      ]),
    );
  }
}
