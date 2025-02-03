import 'package:flutter/material.dart';

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
}
