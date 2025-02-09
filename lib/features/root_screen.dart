import 'dart:io';

import 'package:chondohealth/core/widgets/bottom_navigation.dart';
import 'package:chondohealth/core/widgets/confirm_dialog.dart';
import 'package:chondohealth/features/bottom_items.dart';
import 'package:flutter/material.dart';
import 'package:chondohealth/util/extensions/extension.dart';
import 'package:flutter/services.dart';

class SRoot extends StatelessWidget {
  const SRoot({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, value) {
        showDialog(
          context: context,
          builder: (context) {
            return ConfirmationDialog(
              description: "Do you want to exit the app?",
              onYesPressed: () {
                SystemNavigator.pop();
                exit(0);
              },
            );
          },
        );
      },
      child: Scaffold(
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: currentIndex,
          builder: (context, value, child) {
            return WBottomNavigation(
              currentIndex: value,
              navItems: rootBodyitems,
              onChanged: (selectedIndex) {
                currentIndex.value = selectedIndex;
              },
            );
          },
        ),
        body: ValueListenableBuilder(
          valueListenable: currentIndex,
          builder: (context, value, child) {
            return rootBodyitems[value].child ?? SizedBox.shrink().paddingXY;
          },
        ),
      ),
    );
  }
}
