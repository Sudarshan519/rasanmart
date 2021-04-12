import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'notification_repository.dart';
import 'notificatoinModel.dart';

class NotificationController extends GetxController {
  FlutterLocalNotificationsPlugin _flutterLocalNotificationPlugin =
      FlutterLocalNotificationsPlugin();

  //NotificationProvider notificationProvider = new NotificationRepository();
  RxInt notification = 0.obs;
  var loading = false.obs;
  RxBool togglenotice = false.obs;
  Rx<List<NotificationData>> list;
  var notificationData = List<NotificationData>.empty(growable: true).obs;
  @override
  void onInit() {
    initialize();
    listenStream();
    //inistantNotification(0, 'Firebase Message ', 'ler');
    // print(list.value);
    // for (int i = 0; i < notificationData.length; i++)
    //imageNotification('', '');
   // stylishNotification();
    super.onInit();
  }

  listenStream() {
    loading.value = true;
    notificationData.bindStream(notificationService.allNotification());
    loading.value = false;
    for (int i = 0; i < notificationData.length; i++)
      imageNotification(
          'https://lh3.googleusercontent.com/-TJ4K4KHhQkk/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucnO0KqtmeWm40Cuo4dcfflkUghLoA/photo.jpg?sz=46',
          '');
    stylishNotification();
    secheduledNotification();
    // print(notificationData.value.length);
  }

  Future initialize() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationPlugin =
        FlutterLocalNotificationsPlugin();
    AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("assets/logo.png");
    final MacOSInitializationSettings initializationSettingsMacOS =
        MacOSInitializationSettings(
            requestAlertPermission: true,
            requestBadgePermission: false,
            requestSoundPermission: true);
    IOSInitializationSettings iosInitializationSettings =
        IOSInitializationSettings();
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: androidInitializationSettings,
            iOS: iosInitializationSettings);

    await flutterLocalNotificationPlugin.initialize(initializationSettings);
  }

  Future inistantNotification(int id, String name, String description) async {
    var android = AndroidNotificationDetails("id", "name", "description");
    var ios = IOSNotificationDetails();
    var platform = new NotificationDetails(android: android, iOS: ios);
    await _flutterLocalNotificationPlugin.show(id, name, description, platform,
        payload: 'Welcome to Demo app');
  }

  //image notifications
  Future imageNotification(String url1, String url2) async {
    // var bigPicture = BigPictureStyleInformation(
    //     DrawableResourceAndroidBitmap("ic_launcher"),
    //     largeIcon: DrawableResourceAndroidBitmap("ic_launcher"),
    //     contentTitle: "Demo image notification",
    //     summaryText: "This",
    //     htmlFormatContent: true,
    //     htmlFormatContentTitle: true);
    // var android = AndroidNotificationDetails("id", "channel", "description",
    //     styleInformation: bigPicture);

    // // var ios = IOSNotificationDetails();
    // var platform = new NotificationDetails(
    //   android: android,
    // );
    // await _flutterLocalNotificationPlugin.show(
    //     1, "Demo Image notification", "Tap to do somethins", platform,
    //     payload: 'Welcome to Demo app');

    final String largeIconPath = await _downloadAndSaveFile(url1, 'largeIcon');
    final String bigPicturePath =
        await _downloadAndSaveFile(url1, 'bigPicture');
    final BigPictureStyleInformation bigPictureStyleInformation =
        BigPictureStyleInformation(FilePathAndroidBitmap(bigPicturePath),
            largeIcon: FilePathAndroidBitmap(largeIconPath),
            contentTitle: 'overridden <b>big</b> content title',
            htmlFormatContentTitle: true,
            summaryText: 'summary <i>text</i>',
            htmlFormatSummaryText: true);
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('big text channel id',
            'big text channel name', 'big text channel description',
            styleInformation: bigPictureStyleInformation);
    final NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await _flutterLocalNotificationPlugin.show(
        0, 'big text title', 'silent body', platformChannelSpecifics);
  }

  //stylish notification
  Future stylishNotification() async {
    var android = AndroidNotificationDetails("id", "channel", "description",
        color: Colors.deepOrange,
        enableLights: true,
        enableVibration: true,
        largeIcon: DrawableResourceAndroidBitmap("ic_launcher"),
        styleInformation: MediaStyleInformation(
            htmlFormatContent: true, htmlFormatTitle: true));

    var ios = IOSNotificationDetails();
    var platform = new NotificationDetails(
      android: android,
    );
    await _flutterLocalNotificationPlugin.show(
      0,
      "Demo notification",
      "Tap to do somethins",
      platform,
    );

    //imagefromNetwork
    Future<String> _downloadAndSaveFile(String url, String fileName) async {
      final Directory directory = await getApplicationDocumentsDirectory();
      final String filePath = '${directory.path}/$fileName';
      final http.Response response = await http.get(Uri.parse(url));
      final File file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);
      return filePath;
    }

    Future<void> showBigPictureNotification() async {
      final String largeIconPath = await _downloadAndSaveFile(
          'https://via.placeholder.com/48x48', 'largeIcon');
      final String bigPicturePath = await _downloadAndSaveFile(
          'https://via.placeholder.com/400x800', 'bigPicture');
      final BigPictureStyleInformation bigPictureStyleInformation =
          BigPictureStyleInformation(FilePathAndroidBitmap(bigPicturePath),
              largeIcon: FilePathAndroidBitmap(largeIconPath),
              contentTitle: 'overridden <b>big</b> content title',
              htmlFormatContentTitle: true,
              summaryText: 'summary <i>text</i>',
              htmlFormatSummaryText: true);
      final AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails('big text channel id',
              'big text channel name', 'big text channel description',
              styleInformation: bigPictureStyleInformation);
      final NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics);
      await _flutterLocalNotificationPlugin.show(
          0, 'big text title', 'silent body', platformChannelSpecifics);
    }

    Future<void> _showBigPictureNotificationHiddenLargeIcon() async {
      final String largeIconPath = await _downloadAndSaveFile(
          'https://via.placeholder.com/48x48', 'largeIcon');
      final String bigPicturePath = await _downloadAndSaveFile(
          'https://via.placeholder.com/400x800', 'bigPicture');
      final BigPictureStyleInformation bigPictureStyleInformation =
          BigPictureStyleInformation(FilePathAndroidBitmap(bigPicturePath),
              hideExpandedLargeIcon: true,
              contentTitle: 'overridden <b>big</b> content title',
              htmlFormatContentTitle: true,
              summaryText: 'summary <i>text</i>',
              htmlFormatSummaryText: true);
      final AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails('big text channel id',
              'big text channel name', 'big text channel description',
              largeIcon: FilePathAndroidBitmap(largeIconPath),
              styleInformation: bigPictureStyleInformation);
      final NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics);
      await _flutterLocalNotificationPlugin.show(
          0, 'big text title', 'silent body', platformChannelSpecifics);
    }

    Future<void> _showNotificationMediaStyle() async {
      final String largeIconPath = await _downloadAndSaveFile(
          'https://via.placeholder.com/128x128/00FF00/000000', 'largeIcon');
      final AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
        'media channel id',
        'media channel name',
        'media channel description',
        largeIcon: FilePathAndroidBitmap(largeIconPath),
        styleInformation: const MediaStyleInformation(),
      );
      final NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics);
      await _flutterLocalNotificationPlugin.show(0, 'notification title',
          'notification body', platformChannelSpecifics);
    }

    Future<void> _showBigTextNotification() async {
      const BigTextStyleInformation bigTextStyleInformation =
          BigTextStyleInformation(
        'Lorem <i>ipsum dolor sit</i> amet, consectetur <b>adipiscing elit</b>, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        htmlFormatBigText: true,
        contentTitle: 'overridden <b>big</b> content title',
        htmlFormatContentTitle: true,
        summaryText: 'summary <i>text</i>',
        htmlFormatSummaryText: true,
      );
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails('big text channel id',
              'big text channel name', 'big text channel description',
              styleInformation: bigTextStyleInformation);
      const NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics);
      await _flutterLocalNotificationPlugin.show(
          0, 'big text title', 'silent body', platformChannelSpecifics);
    }
  }

  //image notifications
  Future secheduledNotification() async {
    var interval = RepeatInterval.everyMinute;
    // var bigPicture = BigPictureStyleInformation(
    //     DrawableResourceAndroidBitmap("ic_launcher"),
    //     largeIcon: DrawableResourceAndroidBitmap("ic_launcher"),
    //     contentTitle: "Demo image notification",
    //     summaryText: "This",
    //     htmlFormatContent: true,
    //     htmlFormatContentTitle: true);

    var android = AndroidNotificationDetails(
      "id",
      "channel",
      "description",
    );

    var ios = IOSNotificationDetails();
    var platform = new NotificationDetails(
      android: android,
    );
    await _flutterLocalNotificationPlugin.periodicallyShow(
      0,
      "Demo Shedule notification",
      "Tap to do somethins",
      interval,
      platform,
    );
  }

  //cancel notification
  cancelNotificaion() async {
    await _flutterLocalNotificationPlugin.cancelAll();
  }

  //imagefromNetwork
  Future<String> _downloadAndSaveFile(String url, String fileName) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/$fileName';
    final http.Response response = await http.get(Uri.parse(url));
    final File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }

  // load(InitializationSettings initializationSettings) async {
  //   await flutterLocalNotificationsPlugin.initialize(initializationSettings,
  //       onSelectNotification: selectNotification);
  // }

  // Future selectNotification(String payload) async {
  //   if (payload != null) {
  //     debugPrint('notification payload: $payload');
  //     //Get.to(()=>PageProductView())
  //   }
  // }

  // showcustomNotification(int id, String title, String body) async {
  //   var android = new AndroidNotificationDetails(
  //       'id', 'channel ', 'description',
  //       priority: Priority.high, importance: Importance.max);
  //   // var notificationdata=NotificationData(title: 'title', message: 'message', imgpath: 'assets/logo.png', noticedate: 'noticedate', noticeRead: true);
  //   var iOS = new IOSNotificationDetails();
  //   var platform = new NotificationDetails(android: android, iOS: iOS);
  //   await flutterLocalNotificationsPlugin.show(id, title, body, platform,
  //       payload: 'payload');
  // }

  // fetchdata() {
  //   // if (notificationService.fetchNotification().data() != null)
  //   //showcustomNotification();
  // }

  // void fetchNotification() async {
  //   //  notificationService.fetchNotification();
  //   var user = await FirebaseAuth.instance.currentUser;
  //   List<NotificationData> newNotification = [];
  //   if (user != null) {
  //     String id = user.uid;
  //     // List<NotificationData> data =
  //     //     await NotificationRepository().fetchNotification();
  //     // data.fold((l) => print(l), (r) {
  //     //   newNotification = r.toList();
  //     //   notificationList = newNotification.obs;
  //     //   checkList(false);
  //   }
  // }

  // Future onDidReceiveLocalNotification(
  //     int id, String title, String body, String payload) async {
  //   // Get.dialog(
  //   //     Container(
  //   //       child: Column(
  //   //         children: [Text(title), Text(body)],
  //   //       ),
  //   //     ),
  //   //     barrierDismissible: true);
  // }

  // scheduleNotification(
  //     {int id, String title, String body, int duration = 5}) async {
  //   tz.initializeTimeZones();
  //   //tz.setLocalLocation(tz.getLocation(timeZoneName));

  //   print('secheduled run');
  //   print(DateTime.now());
  //   await flutterLocalNotificationsPlugin.zonedSchedule(
  //       0,
  //       'scheduled title',
  //       'scheduled body',
  //       tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
  //       const NotificationDetails(
  //           android: AndroidNotificationDetails('your channel id',
  //               'your channel name', 'your channel description')),
  //       androidAllowWhileIdle: true,
  //       uiLocalNotificationDateInterpretation:
  //           UILocalNotificationDateInterpretation.absoluteTime);
  //   await flutterLocalNotificationsPlugin.zonedSchedule(
  //       0,
  //       'scheduled title',
  //       'scheduled body',
  //       tz.TZDateTime.now(tz.local).add(const Duration(seconds: 15)),
  //       const NotificationDetails(
  //           android: AndroidNotificationDetails('your channel id',
  //               'your channel name', 'your channel description')),
  //       androidAllowWhileIdle: true,
  //       uiLocalNotificationDateInterpretation:
  //           UILocalNotificationDateInterpretation.absoluteTime);

  //   // await flutterLocalNotificationsPlugin.zonedSchedule(
  //   //     id,
  //   //     title,
  //   //     body,
  //   //     tz.TZDateTime.now(tz.local).add(Duration(seconds: duration)),
  //   //     const NotificationDetails(
  //   //         android: AndroidNotificationDetails('your channel id',
  //   //             'your channel name', 'your channel description')),
  //   //     androidAllowWhileIdle: true,
  //   //     uiLocalNotificationDateInterpretation:
  //   //         UILocalNotificationDateInterpretation.absoluteTime);
  // }

  // repeatedShowNotification() async {
  //   const AndroidNotificationDetails androidPlatformChannelSpecifics =
  //       AndroidNotificationDetails('repeating channel id',
  //           'repeating channel name', 'repeating description');
  //   const NotificationDetails platformChannelSpecifics =
  //       NotificationDetails(android: androidPlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.periodicallyShow(0, 'repeating title',
  //       'repeating body', RepeatInterval.everyMinute, platformChannelSpecifics,
  //       androidAllowWhileIdle: true);
  // }

  // showNotification(String title, String body, int id, String payload) async {
  //   var android = new AndroidNotificationDetails(
  //       'id', 'channel ', 'description',
  //       priority: Priority.high, importance: Importance.max);
  //   // var notificationdata=NotificationData(title: 'title', message: 'message', imgpath: 'assets/logo.png', noticedate: 'noticedate', noticeRead: true);
  //   var iOS = new IOSNotificationDetails();
  //   var platform = new NotificationDetails(android: android, iOS: iOS);
  //   await flutterLocalNotificationsPlugin.show(id, title, body, platform,
  //       payload: 'payload');
  //   //await flutterLocalNotificationsPlugin.show(id, title, body, notificationDetails)
  // }
}
