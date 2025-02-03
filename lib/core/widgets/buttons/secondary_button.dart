import 'package:chondohealth/core/functions/unfocus.dart';
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
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        unFocus();
        onTap?.call();
      },
      child: SizedBox(
        height: height ?? PTheme.fieldHeight,
        width: width,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
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
                style: context.theme.textTheme.displayMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
