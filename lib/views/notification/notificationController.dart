import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import 'notification_repository.dart';
import 'notificatoinModel.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationController extends GetxController {
  final notificationstream = List().obs;

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  Stream notificationStream = FirebaseFirestore.instance
      .collection('notification')
      .where('id', isEqualTo: FirebaseAuth.instance.currentUser.uid)
      .snapshots();
  //NotificationProvider notificationProvider = new NotificationRepository();
  RxInt notification = 0.obs;
  RxBool togglenotice = false.obs;

  @override
  void onInit() {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher.png');
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
    // load(initializationSettings);
    super.onInit();
  }

  listenStream() async {
    List<NotificationData> data = await notificationService.getnotification();
    print(data.length);
    data = (notificationService.allNotification()) as List<NotificationData>;
    print(data.length);
  }

  Stream<List<NotificationData>> listen() {
    return notificationStream.map((event) => event.docs
        .map((e) => NotificationData.fromDocumentSnapshot(e))
        .toList());
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

  showcustomNotification(int id, String title, String body) async {
    var android = new AndroidNotificationDetails(
        'id', 'channel ', 'description',
        priority: Priority.high, importance: Importance.max);
    // var notificationdata=NotificationData(title: 'title', message: 'message', imgpath: 'assets/logo.png', noticedate: 'noticedate', noticeRead: true);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin.show(id, title, body, platform,
        payload: 'payload');
  }

  fetchdata() {
    // if (notificationService.fetchNotification().data() != null)
    //showcustomNotification();
  }

  void fetchNotification() async {
    notificationService.fetchNotification();
    var user = await FirebaseAuth.instance.currentUser;
    List<NotificationData> newNotification = [];
    if (user != null) {
      String id = user.uid;
      List<NotificationData> data =
          await NotificationRepository().fetchNotification();
      // data.fold((l) => print(l), (r) {
      //   newNotification = r.toList();
      //   notificationList = newNotification.obs;
      //   checkList(false);
    }
  }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    // Get.dialog(
    //     Container(
    //       child: Column(
    //         children: [Text(title), Text(body)],
    //       ),
    //     ),
    //     barrierDismissible: true);
  }

  scheduleNotification(
      {int id, String title, String body, int duration = 5}) async {
    tz.initializeTimeZones();
    //tz.setLocalLocation(tz.getLocation(timeZoneName));

    print('secheduled run');
    print(DateTime.now());
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'scheduled title',
        'scheduled body',
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        const NotificationDetails(
            android: AndroidNotificationDetails('your channel id',
                'your channel name', 'your channel description')),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'scheduled title',
        'scheduled body',
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 15)),
        const NotificationDetails(
            android: AndroidNotificationDetails('your channel id',
                'your channel name', 'your channel description')),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);

    // await flutterLocalNotificationsPlugin.zonedSchedule(
    //     id,
    //     title,
    //     body,
    //     tz.TZDateTime.now(tz.local).add(Duration(seconds: duration)),
    //     const NotificationDetails(
    //         android: AndroidNotificationDetails('your channel id',
    //             'your channel name', 'your channel description')),
    //     androidAllowWhileIdle: true,
    //     uiLocalNotificationDateInterpretation:
    //         UILocalNotificationDateInterpretation.absoluteTime);
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
