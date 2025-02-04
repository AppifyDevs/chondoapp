import 'package:chondohealth/core/widgets/custom_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chondohealth/util/extensions/extension.dart';
import 'package:flutter/material.dart';

class WCloseIcon extends StatelessWidget {
  const WCloseIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return WCustomContainer(
      onTap: () => Navigator.pop(context),
      color: context.themes.cardColor.withOpacity(0.1),
      verticalPadding: 6.h,
      horizontalPadding: 6.w,
      child: const Icon(Icons.close),
    );
  }
}
