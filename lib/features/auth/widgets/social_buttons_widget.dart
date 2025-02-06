import 'package:chondohealth/core/widgets/custom_container.dart';
import 'package:chondohealth/gen/assets.gen.dart';
import 'package:chondohealth/util/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class WSocialButtonAuth extends StatelessWidget {
  final String? logoPath;
  final Function()? onTap;
  const WSocialButtonAuth({super.key, this.logoPath, this.onTap});

  @override
  Widget build(BuildContext context) {
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
}
