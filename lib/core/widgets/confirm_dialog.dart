import 'package:chondohealth/core/widgets/buttons/primary_button.dart';
import 'package:chondohealth/core/widgets/buttons/secondary_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chondohealth/gen/assets.gen.dart';
import 'package:chondohealth/util/constants/default_values.dart';
import 'package:chondohealth/util/constants/dimension_theme.dart';
import 'package:chondohealth/util/extensions/extension.dart';
import 'package:chondohealth/util/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ConfirmationDialog extends StatelessWidget {
  final String? title;
  final String description;
  final Function onYesPressed;
  final Color? titleColor;
  final bool? okButton;
  final double? iconHeight;
  final double? iconWidth;
  final bool isSignUp;

  const ConfirmationDialog({
    super.key,
    this.title,
    required this.description,
    required this.onYesPressed,
    this.titleColor,
    this.okButton,
    this.iconHeight,
    this.iconWidth,
    this.isSignUp = false,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      insetPadding: const EdgeInsets.all(30),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: PTheme.paddingY, horizontal: PTheme.paddingX),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            isSignUp == true
                ? SvgPicture.asset(
                    Assets.logo.logout,
                    height: iconHeight ?? 50.h,
                  )
                : Icon(
                    Icons.exit_to_app,
                    size: iconHeight ?? 50.h,
                  ),
            title != null
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: PTheme.paddingX),
                    child: Text(
                      title ?? PDefaultValues.noName,
                      textAlign: TextAlign.center,
                    ),
                  )
                : const SizedBox.shrink(),
            Text(
              description,
              textAlign: TextAlign.center,
            ).gapLY,
            okButton == true
                ? WPrimaryButton(
                    text: "Okay",
                    onTap: () => Navigation.pop(),
                    height: 40.h,
                    width: 150.w,
                  )
                : Row(
                    children: [
                      Expanded(
                        child: WSecondaryButton(
                          text: 'No',
                          onTap: () => Navigation.pop(),
                        ),
                      ),
                      gapX(10),
                      Expanded(
                        child: WPrimaryButton(
                          text: 'Yes',
                          onTap: () => onYesPressed(),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
