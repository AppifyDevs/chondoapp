import 'package:chondohealth/core/widgets/buttons/primary_button.dart';
import 'package:chondohealth/core/widgets/primay_text_field.dart';
import 'package:chondohealth/features/onboarding/models/language_model.dart';
import 'package:chondohealth/gen/assets.gen.dart';
import 'package:chondohealth/util/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SSignIn extends StatelessWidget {
  const SSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                MTranslate.logInToYourAccount.tr,
                style: context.theme.textTheme.bodyLarge?.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                ),
              ).gapY,
              Text(
                "Enter your valid email and password for login on CHONDO.",
                style: context.theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ).gapLY.gapLY,
              WTextField(
                prefixIconPath: Assets.logo.message,
                isprefixIconPathSvg: true,
                hintText: MTranslate.email.tr,
                controller: TextEditingController(),
              ).gapY,
              WTextField(
                prefixIconPath: Assets.logo.lock,
                isprefixIconPathSvg: true,
                hintText: MTranslate.password.tr,
                controller: TextEditingController(),
              ).gapLY,
              WPrimaryButton(
                text: "Sign In",
                onTap: () {},
              )
            ],
          ).paddingXY,
        ),
      ),
    );
  }
}
