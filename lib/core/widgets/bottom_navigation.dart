import 'package:chondohealth/util/constants/colors.dart';
import 'package:flutter/material.dart';
import 'nav/nav_bar_model.dart';
import 'nav/nav_bar_widget.dart';

class WBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final List<NavigationBarItem> navItems;
  final void Function(int)? onChanged;
  const WBottomNavigation({
    super.key,
    required this.currentIndex,
    this.onChanged,
    required this.navItems,
  });

  @override
  Widget build(BuildContext context) {
    return WNavigationBar(
      currentIndex: currentIndex,
      unselectedItemColor: Colors.black,
      selectedItemColor: PColors.primaryButtonColor,
      onTap: (value) {
        onChanged?.call(value);
      },
      items: navItems,
    );
  }
}
