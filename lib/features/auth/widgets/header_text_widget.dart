import 'package:chondohealth/util/constants/default_values.dart';
import 'package:chondohealth/util/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WHeaderTextAuth extends StatelessWidget {
  final String? titleText, subTitleText;
  const WHeaderTextAuth({super.key, this.titleText, this.subTitleText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText ?? PDefaultValues.noName,
          style: context.themes.textTheme.bodyLarge?.copyWith(
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
          ),
        ).gapY,
        Text(
          subTitleText ?? PDefaultValues.noName,
          style: context.themes.textTheme.bodyMedium?.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
