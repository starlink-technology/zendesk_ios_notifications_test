import 'package:flutter/material.dart';
import 'package:intercom_flutter/intercom_flutter.dart';
import 'package:zendesk_test/app/presintation/HomePage.dart';
import 'package:zendesk_test/service/notification/firebase_notification.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseNotification.config();
  await Intercom.instance.initialize('chmmgnoc',
      iosApiKey: 'ios_sdk-c49a6d99dbb3903cce24aff2160801db51756f72',
      androidApiKey: 'android_sdk-c4b38864cd330763587fee14a66c5a3aba5ab326');

  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zendesk Notification Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      navigatorKey: navigatorKey,
      home: const HomePage(),
    );
  }
}
