import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:task1/presentation/styles/colors.dart';
import 'package:task1/presentation/widgets/default_asset_image.dart';
import 'package:task1/presentation/widgets/default_form_field.dart';
import 'package:task1/presentation/widgets/default_google_sign_button.dart';
import 'package:task1/presentation/widgets/default_horizontal_divider.dart';
import 'package:task1/presentation/widgets/default_icon_button.dart';
import 'package:task1/presentation/widgets/default_material_button.dart';
import 'package:task1/presentation/widgets/default_phone_form_field.dart';
import 'package:task1/presentation/widgets/default_text.dart';
import 'package:task1/presentation/widgets/default_text_button.dart';
import 'package:task1/presentation/widgets/help_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late bool _passwordVisible;
  @override
  void initState() {
    _passwordVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                SizedBox(
                  height: 16.h,
                  width: double.infinity,
                  child: const DefaultAssetImage(
                      imagePath: 'assets/images/login_appbar_background2.png',
                      fit: BoxFit.cover),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultIconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      background: defaultAppColor,
                      icon: const Icon(
                        Icons.arrow_back,
                        color: defaultAppWhiteColor,
                      )),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                  start: 20.0, end: 20.0, top: 15),
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
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: DefaultText(
                              text: 'Register',
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
                      text: 'Email',
                      fontSize: 12.sp,
                      color: defaultGreyColor,
                      textAlign: TextAlign.start,
                      maxLines: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: DefaultFormField(
                        controller: emailController,
                        hintText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        validator: (text) {
                          if (text!.isEmpty) {
                            return 'Email is empty';
                          }
                          return null;
                        },
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
                      padding: const EdgeInsets.symmetric(vertical: 8),
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
                    DefaultText(
                      text: 'Password',
                      fontSize: 12.sp,
                      color: defaultGreyColor,
                      textAlign: TextAlign.start,
                      maxLines: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: DefaultFormField(
                        controller: passwordController,
                        hintText: 'password',
                        obscureText: _passwordVisible,
                        maxLines: 1,
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                            icon: Icon(_passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off)),
                        keyboardType: TextInputType.text,
                        validator: (text) {
                          if (text!.length < 11) {
                            return 'Password must be at least 8 digits';
                          }
                          return null;
                        },
                      ),
                    ),
                    DefaultMaterialButton(
                      fontSize: 12.sp,
                      text: 'Register',
                      onPressed: () {
                        if (loginFormKey.currentState!.validate()) {}
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                          text: "Has any account?",
                          fontSize: 12.sp,
                          maxLines: 2,
                        )),
                        const SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          child: DefaultTextButton(
                              child: DefaultText(
                                text: 'Sign in here',
                                fontSize: 12.sp,
                                color: defaultAppColor,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: DefaultText(
                        text:
                            'By registering your account, you are agree to our',
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        color: defaultGreyColor,
                        fontSize: 10.sp,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: DefaultTextButton(
                          child: DefaultText(
                            text: 'Terms and conditions',
                            fontSize: 12.sp,
                            color: defaultAppColor,
                          ),
                          onPressed: () {}),
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
