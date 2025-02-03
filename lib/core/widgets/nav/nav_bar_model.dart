import 'package:flutter/material.dart';

/// A tab to display in a [CrystalNavigationBar]
class NavigationBarItem {
  /// An icon to display.
  final String icon;

  /// An icon to display.
  final String? unselectedIcon;

  /// A primary color to use for this tab.
  final Color? selectedColor;

  /// The color to display when this tab is not selected.
  final Color? unselectedColor;

  NavigationBarItem({
    required this.icon,
    this.unselectedIcon,
    this.selectedColor,
    this.unselectedColor,
  });
}