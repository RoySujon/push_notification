import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:push_notification/firebase/firebase_service.dart';
import 'package:push_notification/views/notification_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();
messeging(message) async {
  print('object');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseServices().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      routes: {
        "/notification_page": (context) => NotificationScreen(),
        "/": (context) => HomeScreen()
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // initialRoute: '',
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
    );
  }
}
