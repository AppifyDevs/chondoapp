import 'package:flutter/material.dart';
import 'package:chondohealth/util/services/navigation_service.dart';

showSnackBar(
  String message, {
  TextAlign? textAlign = TextAlign.left,
  double? fontSize,
}) {
  final snackBar = SnackBar(
    content: Text(
      message,
      textAlign: textAlign,
      style: TextStyle(fontSize: fontSize ?? 15),
    ),
  );
  ScaffoldMessenger.of(NavigationService.currentContext).showSnackBar(snackBar);
}
