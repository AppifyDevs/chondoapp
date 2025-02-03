import 'package:chondohealth/core/widgets/nav/nav_bar_model.dart';
import 'package:chondohealth/gen/assets.gen.dart';
import 'package:chondohealth/util/extensions/extension.dart';
import 'package:chondohealth/util/services/navigation_service.dart';
import 'package:flutter/material.dart';

List<NavigationBarItem> rootBodyitems = [
  /// Home
  NavigationBarItem(
    icon: Assets.logo.a404Error,
    unselectedIcon: Assets.logo.emptyData,
    selectedColor: Colors.black,
    unselectedColor: Colors.black,
  ),
  NavigationBarItem(
    icon: Assets.logo.a404Error,
    unselectedIcon: Assets.logo.emptyData,
    selectedColor: NavigationService.currentContext.theme.buttonTheme.colorScheme?.primary,
  ),
  NavigationBarItem(
    icon: Assets.logo.a404Error,
    unselectedIcon: Assets.logo.emptyData,
    selectedColor: NavigationService.currentContext.theme.buttonTheme.colorScheme?.primary,
  ),

  NavigationBarItem(
    icon: Assets.logo.a404Error,
    unselectedIcon: Assets.logo.emptyData,
    selectedColor: NavigationService.currentContext.theme.buttonTheme.colorScheme?.primary,
  ),
];
