import 'dart:io';
import 'package:chondohealth/core/widgets/buttons/primary_button.dart';
import 'package:chondohealth/core/widgets/primay_text_field.dart';
import 'package:chondohealth/features/auth/views/create_account_screen.dart';
import 'package:chondohealth/features/auth/views/sign_in_screen.dart';
import 'package:chondohealth/features/auth/widgets/bottom_text_span_widget.dart';
import 'package:chondohealth/features/auth/widgets/header_text_widget.dart';
import 'package:chondohealth/features/auth/widgets/social_buttons_widget.dart';
import 'package:chondohealth/features/onboarding/models/language_model.dart';
import 'package:chondohealth/gen/assets.gen.dart';
import 'package:chondohealth/util/extensions/extension.dart';
import 'package:chondohealth/util/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SSignUp extends StatefulWidget {
  const SSignUp({super.key});

  @override
  State<SSignUp> createState() => _SSignUpState();
}

class _SSignUpState extends State<SSignUp> {
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
                      titleText: MTranslate.createAccount.tr,
                      subTitleText: MTranslate.signUpWithOneOfTheFollowingOptions.tr,
                    ).gapLY.gapY,
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
                    WTextField.obsecureText(
                      prefixIconPath: Assets.logo.lock,
                      isprefixIconPathSvg: true,
                      hintText: "Confirm Password",
                      controller: TextEditingController(),
                    ).gapLY.gapY,
                    _tcWidget().gapLY.gapLY,
                    WPrimaryButton(
                      text: MTranslate.signUp.tr,
                      onTap: () => const SCreateAccount().push(),
                    ).gapLY.gapLY.gapLY,
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        MTranslate.signUpWith.tr,
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
                        WSocialButtonAuth(),
                        if (Platform.isIOS) WSocialButtonAuth(logoPath: Assets.logo.apple),
                        WSocialButtonAuth(logoPath: Assets.logo.facebook),
                      ],
                    ).gapLY,
                  ],
                ),
              ),
            ),
            WTextSpanAuth(
              title: MTranslate.alreadyHaveAnAaccount.tr,
              subTitle: MTranslate.signIn.tr,
              ontap: () => const SSignIn().pushAndRemoveUntil(),
            ),
          ],
        ).paddingXY,
      ),
    );
  }

  Widget _tcWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
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
          "I accept the",
          style: context.themes.textTheme.bodyMedium?.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          " Terms",
          style: context.themes.textTheme.bodyLarge?.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          " &",
          style: context.themes.textTheme.bodyMedium?.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          " Conditions",
          style: context.themes.textTheme.bodyLarge?.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
