import 'package:flutter/material.dart';
import 'package:flutter_firebase_notification/notification_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();
    notificationServices.requestNotificationPermission();
    //notificationServices.isTokenRefresh();
    notificationServices.firebaseInit();

    notificationServices.getDeviceToken().then((value) {
      print('device token');
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
         color: Colors.green,
         height: 100,
         width: 40,
       ),

    );
  }
}
