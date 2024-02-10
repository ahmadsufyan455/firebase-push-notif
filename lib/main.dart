import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_notification_app/firebase_api.dart';
import 'package:firebase_notification_app/home_screen.dart';
import 'package:firebase_notification_app/notification_screen.dart';
import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      navigatorKey: navigatorKey,
      home: const HomeScreen(),
      routes: {
        NotificationScreen.route: (context) => const NotificationScreen(),
      },
    );
  }
}
