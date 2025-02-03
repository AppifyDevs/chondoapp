import 'package:chondohealth/util/extensions/extension.dart';
import 'package:flutter/material.dart';

class WDivider extends StatelessWidget {
  final Color? color;
  const WDivider({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? context.theme.textTheme.bodyLarge?.color,
      height: 1,
    );
  }
}
