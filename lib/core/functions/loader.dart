import 'package:chondohealth/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:chondohealth/util/services/navigation_service.dart';

showLoader() {
  showDialog(
    context: NavigationService.currentContext,
    builder: (_) {
      return AlertDialog.adaptive(
        content: Wrap(
          children: [
            // WOnScreenLoading(),
            Image.asset(Assets.images.loading.path)
          ],
        ),
      );
    },
  );
}

hideLoader() {
  Navigation.pop();
}
