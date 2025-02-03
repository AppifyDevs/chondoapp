import 'package:chondohealth/core/models/view_state_model.dart';
import 'package:chondohealth/core/widgets/load_and_error/error_section.dart';
import 'package:chondohealth/core/widgets/load_and_error/no_data_found_section.dart';
import 'package:chondohealth/core/widgets/load_and_error/loading_widget.dart';
import 'package:flutter/material.dart';

class ViewStateHandler extends StatelessWidget {
  final dynamic controller;
  final Function()? onRetry;
  final Widget loadedWidget;
  final ViewState? viewState;

  const ViewStateHandler({
    super.key,
    required this.controller,
    required this.onRetry,
    required this.loadedWidget,
    this.viewState,
  });

  @override
  Widget build(BuildContext context) {
    switch (viewState ?? controller.viewState) {
      case ViewState.loading:
        return WOnScreenLoading();
      case ViewState.empty:
        return Center(child: WNoDataFound());
      case ViewState.error:
        return WError(
          onRetry: onRetry,
          message: controller.errorMsg(),
        );
      case ViewState.loaded:
        return loadedWidget;
      default:
        return const SizedBox.shrink();
    }
  }
}
