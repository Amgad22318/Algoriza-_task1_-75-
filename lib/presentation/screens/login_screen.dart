import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:task1/constants/screens.dart';
import 'package:task1/presentation/styles/colors.dart';
import 'package:task1/presentation/widgets/default_asset_image.dart';
import 'package:task1/presentation/widgets/default_google_sign_button.dart';
import 'package:task1/presentation/widgets/default_horizontal_divider.dart';
import 'package:task1/presentation/widgets/default_material_button.dart';
import 'package:task1/presentation/widgets/default_outlined_button.dart';
import 'package:task1/presentation/widgets/default_phone_form_field.dart';
import 'package:task1/presentation/widgets/default_svg.dart';
import 'package:task1/presentation/widgets/default_text.dart';
import 'package:task1/presentation/widgets/default_text_button.dart';
import 'package:task1/presentation/widgets/help_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            SizedBox(
              height: 30.h,
              width: double.infinity,
              child: const DefaultAssetImage(
                  imagePath: 'assets/images/login_appbar_background1.png',
                  fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                  start: 20.0, end: 20.0, top: 30),
              child: Form(
                key: loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultText(
                      text: 'Welcome to 7Krave',
                      fontSize: 12.sp,
                      color: defaultLightGreyColor,
                      textAlign: TextAlign.start,
                      maxLines: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: DefaultText(
                              text: 'Sign in',
                              fontSize: 25.sp,
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const HelpButton()
                        ],
                      ),
                    ),
                    DefaultText(
                      text: 'Phone Number',
                      fontSize: 12.sp,
                      color: defaultGreyColor,
                      textAlign: TextAlign.start,
                      maxLines: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0, top: 12),
                      child: DefaultPhoneFormField(
                        controller: phoneController,
                        validator: (text) {
                          if (text!.length < 11) {
                            return 'Phone number must be more than 10 digits';
                          }
                          return null;
                        },
                      ),
                    ),
                    DefaultMaterialButton(
                      fontSize: 12.sp,
                      text: 'Sign in',
                      onPressed: () {
                        if (loginFormKey.currentState!.validate()) {}
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        children: [
                          const Expanded(child: DefaultHorizontalDivider()),
                          DefaultText(
                            text: 'Or',
                            fontSize: 12.sp,
                            color: defaultGreyColor,
                            textAlign: TextAlign.start,
                            maxLines: 5,
                          ),
                          const Expanded(child: DefaultHorizontalDivider()),
                        ],
                      ),
                    ),
                    DefaultGoogleSignButton(
                      onPressed: () {},
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                            child: DefaultText(
                          text: "Don't have account?",
                          fontSize: 12.sp,
                          maxLines: 2,
                        )),
                        const SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          child: DefaultTextButton(
                              child: DefaultText(
                                text: 'Register here',
                                fontSize: 12.sp,
                                color: defaultAppColor,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, registerScreenRoute);
                              }),
                        ),
                      ],
                    ),
                    DefaultText(
                      text:
                          'Use the application according to policy rules. Any kinds of violations will be subject to sanctions',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      color: defaultGreyColor,
                      fontSize: 10.sp,
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
