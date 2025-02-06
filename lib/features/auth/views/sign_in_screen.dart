import 'dart:io';

import 'package:chondohealth/core/widgets/buttons/primary_button.dart';
import 'package:chondohealth/core/widgets/custom_container.dart';
import 'package:chondohealth/core/widgets/primay_text_field.dart';
import 'package:chondohealth/features/auth/views/forgot_password_screen.dart';
import 'package:chondohealth/features/auth/views/sign_up_screen.dart';
import 'package:chondohealth/features/auth/widgets/bottom_text_span_widget.dart';
import 'package:chondohealth/features/auth/widgets/header_text_widget.dart';
import 'package:chondohealth/features/onboarding/models/language_model.dart';
import 'package:chondohealth/gen/assets.gen.dart';
import 'package:chondohealth/util/extensions/extension.dart';
import 'package:chondohealth/util/services/navigation_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SSignIn extends StatefulWidget {
  const SSignIn({super.key});

  @override
  State<SSignIn> createState() => _SSignInState();
}

class _SSignInState extends State<SSignIn> {
  ValueNotifier<bool> isChecked = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WHeaderTextAuth(
                      titleText: MTranslate.logInToYourAccount.tr,
                      subTitleText: MTranslate.enterYourValidEmail.tr,
                    ).gapLY.gapLY.gapLY,
                    WTextField(
                      prefixIconPath: Assets.logo.message,
                      isprefixIconPathSvg: true,
                      hintText: MTranslate.email.tr,
                      controller: TextEditingController(),
                    ).gapY,
                    WTextField.obsecureText(
                      prefixIconPath: Assets.logo.lock,
                      isprefixIconPathSvg: true,
                      hintText: MTranslate.password.tr,
                      controller: TextEditingController(),
                    ).gapY,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ValueListenableBuilder(
                                valueListenable: isChecked,
                                builder: (context, value, child) {
                                  return Checkbox(
                                    value: value,
                                    onChanged: (v) => isChecked.value = v!,
                                  );
                                }),
                            Text(
                              MTranslate.rememberMe.tr,
                              style: context.themes.textTheme.bodyMedium?.copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () => const SForgotPassword().push(),
                          child: Text(
                            "${MTranslate.forgotPassword.tr}?",
                            style: context.themes.textTheme.bodySmall?.copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ).gapLY.gapLY.gapY,
                    WPrimaryButton(
                      text: MTranslate.signIn.tr,
                      onTap: () {},
                    ).gapLY.gapLY.gapLY,
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        MTranslate.logInWith.tr,
                        textAlign: TextAlign.center,
                        style: context.themes.textTheme.bodyMedium?.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ).gapLY,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _socialLogin(),
                        if (Platform.isIOS) _socialLogin(logoPath: Assets.logo.apple),
                        _socialLogin(logoPath: Assets.logo.facebook),
                      ],
                    ).gapLY,
                  ],
                ),
              ),
            ),
            WTextSpanAuth(
              title: MTranslate.dontHaveAnAccount.tr,
              subTitle: MTranslate.signUp.tr,
              ontap: () => const SSignUp().pushAndRemoveUntil(),
            ),
          ],
        ).paddingXY,
      ),
    );
  }

  Widget _socialLogin({
    Function()? onTap,
    String? logoPath,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 4.w,
      ),
      child: WCustomContainer(
        borderColor: context.themes.dividerColor,
        horizontalPadding: 25.w,
        verticalPadding: 13.h,
        child: InkWell(
          onTap: onTap,
          child: SvgPicture.asset(
            logoPath ?? Assets.logo.google,
            height: 24.h,
          ),
        ),
      ),
    );
  }

  Widget tcWidget() {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          text: MTranslate.dontHaveAnAccount.tr,
          style: context.theme.textTheme.bodyMedium?.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          children: <TextSpan>[
            TextSpan(
              text: " ${MTranslate.signUp.tr}",
              recognizer: TapGestureRecognizer()..onTap = () => const SSignUp().push(),
              style: context.theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
