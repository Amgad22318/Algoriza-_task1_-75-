import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task1/constants/screens.dart';
import 'package:task1/constants/shared_preferences_keys.dart';
import 'package:task1/data/data_provider/local/cache_helper.dart';
import 'package:task1/data/models/local/boarding_page_model.dart';
import 'package:task1/presentation/styles/colors.dart';
import 'package:task1/presentation/views/onboarding_screen/onboarding_page.dart';
import 'package:task1/presentation/widgets/default_material_button.dart';
import 'package:task1/presentation/widgets/default_rich_text.dart';
import 'package:task1/presentation/widgets/default_text.dart';
import 'package:task1/presentation/widgets/default_text_button.dart';
import 'package:task1/presentation/widgets/default_text_span.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isLast = false;
  final PageController boardPageController = PageController();

  final List<BoardingPageModel> boardingList = [
    BoardingPageModel(
        icon: 'assets/images/onboarding1.svg',
        title: 'Get food delivery to your doorstep asap',
        description:
            'We have young and professional delivery team that will bring your food as soon as possible to your doorstep'),
    BoardingPageModel(
        icon: 'assets/images/onboarding2.svg',
        title: 'Buy Any Food from your favorite restaurant',
        description:
            'We are constantly adding your favourite restaurant throughout the territory and around your area carefully selected'),
    BoardingPageModel(
        icon: 'assets/images/onboarding3.svg',
        title: 'Enjoy Delicious Food',
        description:
            'Just few click to enter our foodis online app to get best service and We maintained quality'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(children: [
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: DefaultTextButton(
              child: DefaultText(
                text: 'Skip',
                fontSize: 14.sp,
              ),
              onPressed: () {
                finishOnBoardingScreen(context);
              }),
        ),
        DefaultRichText(
            text: defaultTextSpan(children: [
          defaultTextSpan(text: '7', color: defaultBeigeColor),
          defaultTextSpan(
            text: 'Krave',
          ),
        ])),
        Expanded(
          child: PageView.builder(
            itemBuilder: (context, index) =>
                OnBoardingPage(pageModel: boardingList[index]),
            itemCount: boardingList.length,
            physics: const BouncingScrollPhysics(),
            controller: boardPageController,
            onPageChanged: (int index) {
              if (index == boardingList.length - 1) {
                setState(() {
                  isLast = true;
                });
              } else {
                isLast = false;
              }
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
          child: SmoothPageIndicator(
            controller: boardPageController,
            count: boardingList.length,
            effect: const JumpingDotEffect(
              dotColor: defaultLightGreyColor,
              activeDotColor: defaultBeigeColor,
              dotHeight: 6,
              dotWidth: 14,
              spacing: 5,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: DefaultMaterialButton(
            fontSize: 12.sp,
            onPressed: () {
              if (isLast == true) {
                finishOnBoardingScreen(context);
              } else {
                boardPageController.nextPage(
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.fastLinearToSlowEaseIn);
              }
            },
            text: 'Get Started',
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                  child: DefaultText(
                      text: "Don't have account? ", fontSize: 12.sp)),
              Flexible(
                child: DefaultTextButton(
                    child: DefaultText(
                      text: 'Sign Up',
                      fontSize: 12.sp,
                      color: defaultAppColor,
                    ),
                    onPressed: () {
                      CacheHelper.saveDataToSP(
                          key: SharedPreferencesKeys.onBoardingSeen,
                          value: true);
                      Navigator.pushNamedAndRemoveUntil(
                          context, loginScreenRoute, (route) => false);
                      Navigator.pushNamed(context, registerScreenRoute);
                    }),
              ),
            ],
          ),
        )
      ])),
    );
  }

  void finishOnBoardingScreen(BuildContext context) {
    CacheHelper.saveDataToSP(
        key: SharedPreferencesKeys.onBoardingSeen, value: true);
    Navigator.pushNamedAndRemoveUntil(
        context, loginScreenRoute, (route) => false);
  }
}
