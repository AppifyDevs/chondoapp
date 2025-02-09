import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'nav_bar_model.dart';

class WNavigationBar extends StatelessWidget {
  const WNavigationBar({
    super.key,
    required this.items,
    this.currentIndex = 0,
    required this.onTap,
    this.selectedItemColor,
    this.unselectedItemColor,
  });
  final List<NavigationBarItem> items;
  final int currentIndex;
  final Function(int index) onTap;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
        horizontal: 30.w,
      ),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.black26)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          for (final item in items)
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () => onTap.call(items.indexOf(item)),
              child: SvgPicture.asset(
                // items.indexOf(item) == currentIndex ? item.icon : (item.unselectedIcon ?? item.icon),
                item.icon,
                height: 24.h,
                width: 24.w,
                colorFilter: ColorFilter.mode(
                  items.indexOf(item) == currentIndex
                      ? selectedItemColor ?? Colors.transparent
                      : unselectedItemColor ?? Colors.transparent,
                  BlendMode.srcIn,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
