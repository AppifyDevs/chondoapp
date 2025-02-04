import 'package:chondohealth/gen/assets.gen.dart';
import 'package:chondohealth/util/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:chondohealth/core/controllers/check_point_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SSplash extends StatefulWidget {
  const SSplash({super.key});

  @override
  State<SSplash> createState() => _SSplashState();
}

class _SSplashState extends State<SSplash> {
  @override
  void initState() {
    super.initState();
    final CCheckPoint checkPoint = CCheckPoint();
    checkPoint.initilization();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.themes.buttonTheme.colorScheme?.secondary,
      body: Center(
        child: SvgPicture.asset(Assets.logo.splash),
      ),
    );
  }
}
