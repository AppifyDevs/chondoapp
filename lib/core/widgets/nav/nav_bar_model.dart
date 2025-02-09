import 'package:flutter/material.dart';

/// A tab to display in a [CrystalNavigationBar]
class NavigationBarItem {
  /// An icon to display.
  final String icon;

  /// A primary color to use for this tab.
  final Color? selectedColor;

  /// The color to display when this tab is not selected.
  final Color? unselectedColor;

  final Widget? child;

  NavigationBarItem({
    required this.icon,
    this.selectedColor,
    this.unselectedColor,
    this.child,
  });
}
