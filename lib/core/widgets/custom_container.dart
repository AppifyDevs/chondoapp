import 'package:chondohealth/util/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:chondohealth/util/constants/dimension_theme.dart';

class WCustomContainer extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final double? width;
  final Function()? onTap;
  final Color? borderColor;
  final double? verticalPadding, horizontalPadding, borderRadius;
  final BoxShape? boxShape;
  const WCustomContainer({
    super.key,
    this.child,
    this.color,
    this.width,
    this.onTap,
    this.verticalPadding,
    this.horizontalPadding,
    this.borderColor,
    this.borderRadius,
    this.boxShape,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? PTheme.paddingY,
          horizontal: horizontalPadding ?? PTheme.paddingX,
        ),
        decoration: BoxDecoration(
          color: color ?? context.theme.primaryColor,
          shape: boxShape ?? BoxShape.rectangle,
          border: Border.all(
            color: borderColor ?? context.theme.colorScheme.secondary,
          ),
          borderRadius: boxShape == null
              ? BorderRadius.circular(
                  borderRadius ?? PTheme.boxRadius,
                )
              : null,
        ),
        child: child,
      ),
    );
  }
}
