import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'notificationController.dart';
import 'notification_repository.dart';

class NotificationsPage extends StatelessWidget {
  final notificationController = Get.find<NotificationController>();

  @override
  Widget build(BuildContext context) {
    Stream notificationStream =
        FirebaseFirestore.instance.collection('notification').snapshots();
    return Scaffold(
        body:
            // Column(
            //children: [
            StreamBuilder<QuerySnapshot>(
      stream: notificationStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return new ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            for (int i = 0; i < document.data().length; i++)
              if (document.data()['viewed'] == true)
                notificationController.showcustomNotification(
                    i,
                    document.data()['title'] ?? 'error on mesage',
                    document.data()['body'] ?? 'error');

            return new ListTile(
              onTap: () {
                notificationService.update(document.id);
              },
              title: new Text(document.data()['id'] ?? ""),
              // /subtitle: new Text(document.data()['company']),
            );
          }).toList(),
        );
      },
    )
        // TextButton(
        //     onPressed: () {
        //       notificationController.showNotification(
        //           "testing", 'this is new no', 1, 'payload');
        //     },
        //     child: Text("Show notifications"))
        //  ],
        /// )
        );
  }
}
