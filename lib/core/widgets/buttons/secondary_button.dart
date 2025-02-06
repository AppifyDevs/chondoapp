import 'package:chondohealth/core/functions/unfocus.dart';
import 'package:chondohealth/gen/assets.gen.dart';
import 'package:chondohealth/util/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chondohealth/util/constants/dimension_theme.dart';
import 'package:chondohealth/util/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WSecondaryButton extends StatelessWidget {
  final void Function()? onTap;
  final double? height;
  final double width;
  final Color? borderColor;
  final String text;
  final TextStyle? textStyle;
  final bool isIconWith;
  final String? iconPath;
  final bool isSVGIcon;
  final bool isArrowRight;

  const WSecondaryButton({
    super.key,
    this.onTap,
    this.height,
    this.width = double.infinity,
    this.borderColor,
    this.text = 'Secondary Button',
    this.textStyle,
    this.isIconWith = false,
    this.isSVGIcon = true,
    this.iconPath,
    this.isArrowRight = true,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
          side: WidgetStatePropertyAll(BorderSide(
        color: borderColor ?? PColors.border,
      ))),
      onPressed: () {
        unFocus();
        onTap?.call();
      },
      child: SizedBox(
        height: height ?? PTheme.fieldHeight,
        width: width,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  isIconWith == false
                      ? const SizedBox.shrink()
                      : Padding(
                          padding: EdgeInsets.only(right: 8.w),
                          child: isSVGIcon == false
                              ? Image.asset(
                                  iconPath ?? "",
                                  height: 20.h,
                                )
                              : SvgPicture.asset(
                                  iconPath ?? "",
                                  height: 20.h,
                                ),
                        ),
                  Text(
                    text,
                    style: context.themes.textTheme.bodyLarge,
                  ),
                ],
              ),
              isArrowRight == false
                  ? const SizedBox.shrink()
                  : Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: SvgPicture.asset(
                        Assets.logo.arrowRight,
                        height: 20.h,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
