import 'package:chondohealth/util/constants/colors.dart';
import 'package:chondohealth/util/constants/dimension_theme.dart';
import 'package:chondohealth/util/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WDot extends StatelessWidget {
  final int length;
  final int selectedIndex;
  final double? width;
  const WDot({super.key, this.length = 0, this.selectedIndex = 0, this.width});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: PTheme.spaceX),
            height: 3.h,
            width: width ?? 25.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              color: selectedIndex == index
                  ? context.themes.buttonTheme.colorScheme?.secondary
                  : PColors.primaryTextColor.withOpacity(0.33),
            ),
          );
        },
      ),
    );
  }
}
