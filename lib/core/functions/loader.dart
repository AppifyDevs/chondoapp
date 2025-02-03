import 'package:flutter/material.dart';
import 'package:chondohealth/core/widgets/load_and_error/loading_widget.dart';
import 'package:chondohealth/util/services/navigation_service.dart';

showLoader() {
  showDialog(
    context: NavigationService.currentContext,
    builder: (_) {
      return const AlertDialog.adaptive(
        content: Wrap(
          children: [
            WOnScreenLoading(),
          ],
        ),
      );
    },
  );
}

hideLoader() {
  Navigation.pop();
}
