import 'package:flutter/material.dart';
import 'package:zendesk_test/app/presintation/HomePage.dart';
import 'package:zendesk_test/service/notification/firebase_notification.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseNotification.config();
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
