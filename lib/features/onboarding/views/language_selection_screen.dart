import 'package:chondohealth/core/widgets/buttons/secondary_button.dart';
import 'package:chondohealth/core/widgets/divider.dart';
import 'package:chondohealth/features/onboarding/models/language_model.dart';
import 'package:chondohealth/features/onboarding/views/on_boarding_screen.dart';
import 'package:chondohealth/gen/assets.gen.dart';
import 'package:chondohealth/util/constants/keys.dart';
import 'package:chondohealth/util/extensions/extension.dart';
import 'package:chondohealth/util/services/navigation_service.dart';
import 'package:chondohealth/util/services/shared_preference_service.dart';
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
                    onTap: () async {
                      Get.updateLocale(const Locale('bn', 'BD'));
                      try {
                        SharedPrefService.instance.getBool(PKeys.isBoardingShown).then((bool value) {
                          if (value == true) {
                          } else {
                            SOnBoarding().push();
                          }
                        });
                      } catch (e) {
                        await SOnBoarding().push();
                      }
                    },
                  ),
                  gapY(15),
                  WSecondaryButton(
                    isIconWith: true,
                    isSVGIcon: true,
                    iconPath: Assets.logo.en,
                    text: "English",
                    onTap: () async {
                      Get.updateLocale(const Locale('en', 'US'));
                      await SOnBoarding().push();
                    },
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
