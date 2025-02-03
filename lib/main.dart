import 'package:chondohealth/core/controllers/notification_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:chondohealth/check_point.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CNotification().requestPermission();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await CNotification().initNotification();
  runApp(const SCheckPoint());
}
