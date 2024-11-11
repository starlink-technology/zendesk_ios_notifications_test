import 'dart:convert';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:zendesk_test/firebase_options.dart';
import 'package:zendesk_test/service/notification/local_notification.dart';
import 'package:zendesk_test/utils/extention.dart';

Future<void> _firebaseMessagingInAppAndONTerminated(
    RemoteMessage message) async {
  kdp(name: "FirebaseNotification", msg: jsonEncode(message.toMap()), c: 'gr');

  if (message.notification?.title != null &&
      message.notification?.body != null) {
    LocalNotification().showNotification(
        title: message.notification?.title ?? "title",
        subtitle: message.notification?.body ?? "body",
        id: DateTime.now().millisecond);
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.

  // kdp(name: "FirebaseNotification message ", msg: message.data, c: 'gr');
  if (message.notification != null) {
    // kdp(
    //     name: "FirebaseNotification message ",
    //     msg: message.notification?.title,
    //     c: 'gr');
  }
}

class FirebaseNotification {
  static String? deviceToken;
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static config() async {
    final platformConfig = DefaultFirebaseOptions.currentPlatform;
    await Firebase.initializeApp(
      name: "test_zendesk",
      options: platformConfig,
    );

    // return;
    if (Platform.isAndroid) {
      await FirebaseMessaging.instance.setAutoInitEnabled(true);
    }

    await messaging.setForegroundNotificationPresentationOptions(
      alert: false, // Required to display a heads up notification
      badge: false,
      sound: false,
    );
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    try {
      deviceToken = await messaging.getAPNSToken();
      L.info(name: "deviceToken:", msg: deviceToken);
    } catch (_) {}

    FirebaseMessaging.onMessage.listen(_firebaseMessagingInAppAndONTerminated);
    LocalNotification.setupFlutterNotifications();

    FirebaseMessaging.instance.getInitialMessage();
  }

  static Future<NotificationSettings> requestPermition() async {
    final settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    if (settings.authorizationStatus != AuthorizationStatus.authorized) {
      // if not granted, ask it again
      await FirebaseMessaging.instance.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );
    }

    return settings;
  }
}
