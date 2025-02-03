import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      borderRadius: 14.r,
      marginR: const EdgeInsets.all(20),
      // unselectedItemColor: Colors.grey.withOpacity(0.55),
      selectedItemColor: Colors.transparent,
      backgroundColor: Colors.white,
      // outlineBorderColor: Colors.black.withOpacity(0.1),
      onTap: (value) {
        onChanged?.call(value);
      },
      items: navItems,
    );
  }
}
