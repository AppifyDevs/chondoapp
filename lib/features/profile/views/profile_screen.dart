import 'package:chondohealth/core/widgets/buttons/primary_button.dart';
import 'package:chondohealth/features/profile/controller/profile_controller.dart';
import 'package:chondohealth/util/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SProfile extends StatelessWidget {
  const SProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final CProfile cProfile = Get.put(CProfile());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WPrimaryButton(
            text: "Log-Out",
            onTap: cProfile.logOut,
          ),
        ],
      ).paddingXY,
    );
  }
}
