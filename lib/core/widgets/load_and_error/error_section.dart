import 'package:chondohealth/core/widgets/buttons/secondary_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chondohealth/gen/assets.gen.dart';
import 'package:chondohealth/util/constants/dimension_theme.dart';
import 'package:chondohealth/util/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WError extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const WError({
    super.key,
    this.message = "An error occurred",
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.logo.a404Error,
            height: 200.h,
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: context.theme.textTheme.displaySmall,
          ),
          if (onRetry != null) ...[
            gapY(10),
            WSecondaryButton(width: PTheme.imageDefaultX, text: "Retry", onTap: onRetry),
          ],
        ],
      ),
    );
  }
}
