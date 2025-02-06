import 'package:chondohealth/features/onboarding/models/language_model.dart';
import 'package:flutter/material.dart';
import 'package:chondohealth/core/controllers/theme_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chondohealth/splash_screen.dart';
import 'package:chondohealth/util/services/navigation_service.dart';
import 'package:chondohealth/util/services/shared_preference_service.dart';
import 'package:get/get.dart';

class SCheckPoint extends StatefulWidget {
  const SCheckPoint({super.key});

  @override
  State<SCheckPoint> createState() => _SCheckPointState();
}

class _SCheckPointState extends State<SCheckPoint> {
  final CTheme themeController = Get.put(CTheme());

  @override
  void initState() {
    super.initState();
    SharedPrefService.instance.init();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CTheme>(
      builder: (_) {
        return ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return GetMaterialApp(
              translations: Languages(),
              locale: Get.deviceLocale,
              fallbackLocale: const Locale('en', 'US'),
              debugShowCheckedModeBanner: false,
              navigatorKey: NavigationService.key,
              theme: themeController.currentTheme,
              darkTheme: themeController.currentTheme,
              home: const SSplash(),
            );
          },
        );
      },
    );
  }
}
