import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chondohealth/features/profile/controller/profile_controller.dart';
import 'package:chondohealth/util/extensions/extension.dart';
import 'package:chondohealth/core/functions/call_back_function.dart';
import 'package:chondohealth/core/functions/is_null.dart';
import 'package:chondohealth/features/home/widgets/card_home_widget.dart';
import 'package:chondohealth/features/home/widgets/header_home_widget.dart';

class SHome extends StatefulWidget {
  const SHome({super.key});

  @override
  State<SHome> createState() => _SHomeState();
}

class _SHomeState extends State<SHome> {
  final CProfile cProfile = Get.put(CProfile());

  @override
  void initState() {
    super.initState();
    if (isNullCheck(cProfile.userDetails.name)) {
      callBackFunction(() {
        cProfile.getUserDetails();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const WHeaderHome().gapLY,
            const WCardHome(),
          ],
        ).paddingXY,
      ),
    );
  }
}
