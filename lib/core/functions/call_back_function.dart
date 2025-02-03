import 'package:flutter/material.dart';

// Execute a callback after the first frame is rendered.
// This function takes a callback function and ensures it runs only after
// the first frame has been rendered. This is useful for triggering UI updates
// or animations that rely on the layout being built first.
void callBackFunction(Function callback) {
  // Ensure WidgetsBinding is initialized
  WidgetsBinding.instance.addPostFrameCallback((_) {
    callback();
  });
}
