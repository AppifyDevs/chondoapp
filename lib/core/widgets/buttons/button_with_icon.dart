import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chondohealth/util/extensions/extension.dart';
import 'package:flutter/material.dart';

class WButtonWithIcon extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;
  final IconData? icon;
  const WButtonWithIcon({super.key, this.title, this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon ?? Icons.edit),
      label: Text(title ?? "Button"),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
    ).gapY;
  }
}
