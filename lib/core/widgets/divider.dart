import 'package:chondohealth/util/extensions/extension.dart';
import 'package:flutter/material.dart';

class WDivider extends StatelessWidget {
  final Color? color;
  final double? height, width;
  const WDivider({
    super.key,
    this.color,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? context.themes.dividerColor,
      height: height ?? 1,
      width: width ?? double.infinity,
    );
  }
}
