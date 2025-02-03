import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:chondohealth/core/controllers/base_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../functions/printer.dart';

class CNotification {
  // final NotficationApi _notificationApi = NotficationApi();
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    //'This channel is used for important notifications.',  // description
    importance: Importance.high,
    playSound: true,
    enableVibration: true,
    showBadge: true,
  );

  // Flag to prevent double notifications

  CNotification() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings(
      defaultPresentAlert: true,
      defaultPresentBadge: true,
      defaultPresentSound: true,
      requestSoundPermission: true,
    );

    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    flutterLocalNotificationsPlugin.initialize(initializationSettings);
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  Future<String?> getFCMToken() async {
    return await FirebaseMessaging.instance.getToken();
  }

  Future<void> updateFCMTokenToUserProfile() async {
    try {
      final String? token = await getFCMToken();
      if (token != null) {
        // final CProfile cProfile = PowerVault.find();
        // await cProfile.fcmTokenUpdate(token: token);
      }
    } catch (e, s) {
      CBase().setException(error: e, stackTrace: s, setExceptionOnly: true, showSnackbar: false);
    }
  }

  Future<void> requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    if (Platform.isIOS) {
      NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
        provisional: false,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        infoPrint('User granted permission');
      } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
        infoPrint('User granted provisional permission');
      } else {
        infoPrint('User declined permission');
      }
    }
  }

  Future<void> initNotification() async {
    // Check if Firebase has already been initialized
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        // Extract notification details
        RemoteNotification notification = message.notification!;

        // Show the notification using flutterLocalNotificationsPlugin
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: 'This channel is used for important notifications.',
              importance: Importance.high,
              priority: Priority.high,
              playSound: true,
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      printer("OnMessageOPENED App${message.data}");
      printer("OnMessageOPENED App ${message.notification}");
    });
  }

  Future<void> showLocalNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'default_channel',
      'Default Channel',
      importance: Importance.max,
      priority: Priority.high,
    );

    const DarwinNotificationDetails iOSPlatformChannelSpecifics = DarwinNotificationDetails();

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      message.notification.hashCode,
      message.notification?.title,
      message.notification?.body,
      platformChannelSpecifics,
      payload: json.encode(message.data),
    );
  }
}

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {}
