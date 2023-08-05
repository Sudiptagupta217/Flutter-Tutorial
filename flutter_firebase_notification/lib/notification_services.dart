
import 'dart:ffi';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();



  void requestNotificationPermission()async{
    NotificationSettings settings = await messaging.requestPermission(
        alert:  true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true
    );
    if(settings.authorizationStatus == AuthorizationStatus.authorized){
      print("user granted permission");
    } else if(settings.authorizationStatus== AuthorizationStatus.provisional){
      print("user granted provisional permission");
    }else{
      print("user denied permission");
    }
  }

  void initLocalNotification(BuildContext context, RemoteMessage message)async{
    var androidInitializationSettings = const AndroidInitializationSettings("@mipmap/ic_launcher");

    var initializationSetting = InitializationSettings(
        android: androidInitializationSettings

    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSetting,
      onDidReceiveNotificationResponse: (payload) {

      },
    );

  }

  void firebaseInit(){
    FirebaseMessaging.onMessage.listen((message) {
    showNotification();
    });
  }

  Future<void> showNotification()async{

  }

  Future<String> getDeviceToken() async{
   String? token =  await messaging.getToken();
    return token!;
  }

  void isTokenRefresh()async{
    messaging.onTokenRefresh.listen((event) {
      event.toString();
    });
  }



}