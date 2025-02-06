import 'package:chondohealth/util/constants/default_values.dart';
import 'package:chondohealth/util/extensions/extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WTextSpanAuth extends StatelessWidget {
  final String? title, subTitle;
  final Function()? ontap;
  const WTextSpanAuth({super.key, this.title, this.subTitle, this.ontap});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          text: title ?? PDefaultValues.noName,
          style: context.themes.textTheme.bodyMedium?.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          children: <TextSpan>[
            TextSpan(
              text: " ${subTitle ?? PDefaultValues.noName}",
              recognizer: TapGestureRecognizer()..onTap = ontap,
              style: context.themes.textTheme.bodyLarge?.copyWith(
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
