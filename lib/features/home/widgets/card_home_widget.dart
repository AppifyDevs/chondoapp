import 'package:chondohealth/core/widgets/buttons/primary_button.dart';
import 'package:chondohealth/core/widgets/divider.dart';
import 'package:chondohealth/features/profile/controller/profile_controller.dart';
import 'package:chondohealth/gen/assets.gen.dart';
import 'package:chondohealth/util/constants/default_values.dart';
import 'package:chondohealth/util/constants/dimension_theme.dart';
import 'package:chondohealth/util/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WCardHome extends StatelessWidget {
  const WCardHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CProfile>(builder: (controller) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 187.h,
              width: 250.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  PTheme.boxRadius,
                ),
                image: DecorationImage(
                  image: AssetImage(Assets.images.cardHome.path),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Period in",
                    style: context.themes.textTheme.displayLarge?.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "04",
                    style: context.themes.textTheme.displayLarge?.copyWith(
                      fontSize: 75.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Days",
                    style: context.themes.textTheme.displayLarge?.copyWith(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 16,
                    ),
                  ).gapY,
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: PTheme.paddingX + PTheme.paddingX + PTheme.spaceX,
                    ),
                    child: WPrimaryButton(
                      height: 34.h,
                      radius: 0,
                      color: context.themes.textTheme.displayLarge?.color,
                      text: "Next Fertile 21st SEP",
                      style: context.themes.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ).gapX,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Period",
                style: context.themes.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),
              Text(
                "Length",
                style: context.themes.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w300,
                  fontSize: 15.sp,
                ),
              ),
              Text(
                controller.userDetails.period?.toString() ?? PDefaultValues.noName,
                style: context.themes.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 35.sp,
                  height: 1,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 4.h,
                ),
                child: WDivider(
                  width: 40.w,
                ),
              ),
              Text(
                "Cycle",
                style: context.themes.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),
              Text(
                "Length",
                style: context.themes.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w300,
                  fontSize: 15.sp,
                ),
              ),
              Text(
                controller.userDetails.cycle?.toString() ?? PDefaultValues.noName,
                style: context.themes.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 35.sp,
                ),
              ),
            ],
          )
        ],
      );
    });
  }
}
