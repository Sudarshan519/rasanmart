import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import 'notification_repository.dart';
import 'notificatoinModel.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationController extends GetxController {
  List<NotificationData> notificationList;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  //NotificationProvider notificationProvider = new NotificationRepository();
  RxInt notification = 0.obs;
  RxBool togglenotice = false.obs;

  @override
  void onInit() {
    //tz.initializeTimeZones();
    // tz.setLocalLocation(tz.getLocation('America/Detroit'));

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );
    final MacOSInitializationSettings initializationSettingsMacOS =
        MacOSInitializationSettings(
            requestAlertPermission: true,
            requestBadgePermission: false,
            requestSoundPermission: true);
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS,
            macOS: initializationSettingsMacOS);
    load(initializationSettings);
    //fetchNotification();
    showNotification('Hello', 'How are you', 0, '');
    scheduleNotification(id: 2,body: 'Text',duration: 6,title: 'Test ');
    super.onInit();
  }

  load(InitializationSettings initializationSettings) async {
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }

  Future selectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
      //Get.to(()=>PageProductView())
    }
  }

  void fetchNotification() async {
    var user = await FirebaseAuth.instance.currentUser;
    List<NotificationData> newNotification = [];
    if (user != null) {
      String id = user.uid;
      List<NotificationData> data =
          await NotificationRepository().fetchNotification(id);
      // data.fold((l) => print(l), (r) {
      //   newNotification = r.toList();
      //   notificationList = newNotification.obs;
      //   checkList(false);
    }
  }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    Get.dialog(
        Container(
          child: Column(
            children: [Text(title), Text(body)],
          ),
        ),
        barrierDismissible: true);
  }

  scheduleNotification(
      {int id, String title, String body, int duration = 5}) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.now(tz.local).add(Duration(seconds: duration)),
        const NotificationDetails(
            android: AndroidNotificationDetails('your channel id',
                'your channel name', 'your channel description')),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  repeatedShowNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('repeating channel id',
            'repeating channel name', 'repeating description');
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.periodicallyShow(0, 'repeating title',
        'repeating body', RepeatInterval.everyMinute, platformChannelSpecifics,
        androidAllowWhileIdle: true);
  }

  showNotification(String title, String body, int id, String payload) async {
    var android = new AndroidNotificationDetails(
        'id', 'channel ', 'description',
        priority: Priority.high, importance: Importance.max);
   // var notificationdata=NotificationData(title: 'title', message: 'message', imgpath: 'assets/logo.png', noticedate: 'noticedate', noticeRead: true);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin.show(id, title, body, platform,
        payload: 'payload');
   //await flutterLocalNotificationsPlugin.show(id, title, body, notificationDetails)
  }
}
