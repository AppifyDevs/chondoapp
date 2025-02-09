import 'package:chondohealth/core/widgets/custom_container.dart';
import 'package:chondohealth/core/widgets/custom_network_image_widget.dart';
import 'package:chondohealth/features/profile/controller/profile_controller.dart';
import 'package:chondohealth/gen/assets.gen.dart';
import 'package:chondohealth/util/constants/default_values.dart';
import 'package:chondohealth/util/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class WHeaderHome extends StatelessWidget {
  const WHeaderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CProfile>(
      builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                WImageNetwork(
                  imagePath: controller.userDetails.image,
                  isCircular: true,
                  height: 40.h,
                  width: 40.w,
                  fit: BoxFit.cover,
                ).gapX,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi, ${controller.userDetails.name ?? PDefaultValues.noName}!",
                      style: context.themes.textTheme.bodyLarge?.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "May feel energetic today",
                      style: context.themes.textTheme.bodyLarge?.copyWith(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                WCustomContainer(
                  horizontalPadding: 8.w,
                  verticalPadding: 8.h,
                  boxShape: BoxShape.circle,
                  borderColor: context.themes.colorScheme.secondary,
                  child: SvgPicture.asset(
                    Assets.logo.notification,
                    height: 24.h,
                    width: 24.w,
                  ),
                ).gapX,
                WCustomContainer(
                  horizontalPadding: 8.w,
                  verticalPadding: 8.h,
                  boxShape: BoxShape.circle,
                  borderColor: context.themes.colorScheme.secondary,
                  child: SvgPicture.asset(
                    Assets.logo.menu,
                    height: 24.h,
                    width: 24.w,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
