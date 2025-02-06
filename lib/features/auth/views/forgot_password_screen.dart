import 'package:chondohealth/core/widgets/app_bar_widget.dart';
import 'package:chondohealth/core/widgets/buttons/primary_button.dart';
import 'package:chondohealth/core/widgets/primay_text_field.dart';
import 'package:chondohealth/features/onboarding/models/language_model.dart';
import 'package:chondohealth/gen/assets.gen.dart';
import 'package:chondohealth/util/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SForgotPassword extends StatefulWidget {
  const SForgotPassword({super.key});

  @override
  State<SForgotPassword> createState() => _SForgotPasswordState();
}

class _SForgotPasswordState extends State<SForgotPassword> {
  ValueNotifier<bool> isChecked = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WAppBar(text: ""),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  MTranslate.forgotPassword.tr,
                  style: context.theme.textTheme.bodyLarge?.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ).gapY,
                Text(
                  MTranslate.dontWorryMessageForgotPassword.tr,
                  style: context.theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                gapY(30),
                WTextField(
                  controller: TextEditingController(),
                  isprefixIconPathSvg: true,
                  prefixIconPath: Assets.logo.message,
                  hintText: MTranslate.email.tr,
                )
              ],
            ),
            WPrimaryButton(
              text: MTranslate.sendResetLink.tr,
              onTap: () {},
            ).gapLY.gapLY.gapLY,
          ],
        ).paddingXY,
      ),
    );
  }
}
