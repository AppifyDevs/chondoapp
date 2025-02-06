import 'package:chondohealth/util/extensions/extension.dart';
import 'package:chondohealth/util/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WAppBar extends AppBar {
  final String text;
  final List<Widget>? rightWidgets;
  final bool textPositionCenter;
  final bool hideBackButton;

  WAppBar({
    super.key,
    required this.text,
    this.rightWidgets,
    this.textPositionCenter = false,
  }) : hideBackButton = true;

  WAppBar.withoutBack({
    super.key,
    required this.text,
    this.rightWidgets,
    this.textPositionCenter = false,
  }) : hideBackButton = false;

  @override
  bool get automaticallyImplyLeading => hideBackButton;

  @override
  bool? get centerTitle => textPositionCenter;

  @override
  Widget? get title => Text(text);

  @override
  List<Widget>? get actions => rightWidgets;

  /// **Add Bottom Border**
  @override
  PreferredSizeWidget? get bottom => PreferredSize(
        preferredSize: const Size.fromHeight(1.0), // Border height
        child: Container(
          color: NavigationService.currentContext.themes.colorScheme.secondary, // Border color
          height: 5.h,
        ),
      );
}
