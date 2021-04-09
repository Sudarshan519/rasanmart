import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasanmart/views/notification/notificationController.dart';

class NotificationsPage extends StatelessWidget {
  final notificationController = Get.find<NotificationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        TextButton(onPressed: () {
          notificationController.showNotification("testing", 'this is new no', 1, 'payload');
        }, child: Text("Show notifications"))
      ],
    ));
  }
}
