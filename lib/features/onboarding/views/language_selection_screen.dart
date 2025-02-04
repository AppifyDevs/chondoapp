import 'package:chondohealth/core/widgets/buttons/secondary_button.dart';
import 'package:chondohealth/core/widgets/divider.dart';
import 'package:chondohealth/features/language/model/language_model.dart';
import 'package:chondohealth/gen/assets.gen.dart';
import 'package:chondohealth/util/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SLanguageSelection extends StatelessWidget {
  const SLanguageSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Image.asset(
                Assets.images.languageSelection.path,
                height: 400.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ).gapLY,
              WDivider(
                width: 60.w,
                height: 3.h,
              ),
              Column(
                children: [
                  Text(
                    MTranslate.languageSelection.tr,
                    style: context.theme.textTheme.bodyLarge?.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 40.w,
                    ),
                    child: Text(
                      MTranslate.languageSelectionDescription.tr,
                      textAlign: TextAlign.start,
                      style: context.themes.textTheme.bodyMedium?.copyWith(),
                    ),
                  ).gapLY,
                  WSecondaryButton(
                    isIconWith: true,
                    isSVGIcon: true,
                    iconPath: Assets.logo.bangla,
                    text: "Bangla",
                    onTap: () => Get.updateLocale(const Locale('bn', 'BD')),
                  ),
                  gapY(15),
                  WSecondaryButton(
                    isIconWith: true,
                    isSVGIcon: true,
                    iconPath: Assets.logo.en,
                    text: "English",
                    onTap: () => Get.updateLocale(const Locale('en', 'US')),
                  ),
                ],
              ).paddingXY,
            ],
          ),
        ),
      ),
    );
  }
}
