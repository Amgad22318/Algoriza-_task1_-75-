import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:task1/data/models/local/boarding_page_model.dart';
import 'package:task1/presentation/styles/colors.dart';
import 'package:task1/presentation/widgets/default_svg.dart';
import 'package:task1/presentation/widgets/default_text.dart';

class OnBoardingPage extends StatelessWidget {
  final BoardingPageModel pageModel;

  const OnBoardingPage({Key? key, required this.pageModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Column(
        children: [
          Expanded(
            child: DefaultSvg(
              iconPath: pageModel.icon,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: DefaultText(
              text: pageModel.title,
              fontSize: 16.sp,
              textAlign: TextAlign.center,
              maxLines: 3,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: DefaultText(
              text: pageModel.description,
              fontSize: 12.sp,
              color: defaultLightGreyColor,
              textAlign: TextAlign.center,
              maxLines: 5,
            ),
          )
        ],
      ),
    );
  }
}
