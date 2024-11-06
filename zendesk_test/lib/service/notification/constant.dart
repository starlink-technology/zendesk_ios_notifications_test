import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel',
  'High Importance Channel',
  description: 'This channel is used for important notifications',
  importance: Importance.high,
  playSound: true,
);
const androidNotificationDetail = AndroidNotificationDetails(
  'test_zendesk_dev_channel',
  'test_zendesk_dev_channel_id',
  importance: Importance.max,
  playSound: true,
);

const notificationDetails = NotificationDetails(
  android: androidNotificationDetail,
);
