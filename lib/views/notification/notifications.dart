import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'notificationController.dart';

class NotificationsPage extends StatelessWidget {
  final notificationController = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    // Stream notificationStream =
    //     FirebaseFirestore.instance.collection('notification').snapshots();
    return Scaffold(
        body: Obx(() => !notificationController.loading.value
            ? ListView.builder(
                itemCount: notificationController.notificationData.length,
                itemBuilder: (_, int i) {
                  notificationController.imageNotification('https://images.unsplash.com/photo-1490730141103-6cac27aaab94?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZnJlZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', 'https://images.unsplash.com/photo-1490730141103-6cac27aaab94?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZnJlZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60');
                  return ListTile(
                      title: Text(
                          "${i.toString()} ${notificationController.notificationData[i].id}" ??
                              ''));
                })
            : Center(child: CircularProgressIndicator()))
        //  ListTile(title:Text(''))
        //         StreamBuilder<QuerySnapshot>(
        //   stream: notificationStream,
        //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //     if (snapshot.hasError) {
        //       return Text('Something went wrong');
        //     }

        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return Text("Loading");
        //     }

        //     return new ListView(
        //       children: snapshot.data.docs.map((DocumentSnapshot document) {
        //         for (int i = 0; i < document.data().length; i++)
        //           if (document.data()['viewed'] == true)
        //             // notificationController.showcustomNotification(
        //             //     i,
        //             //     document.data()['title'] ?? 'error on mesage',
        //             //     document.data()['body'] ?? 'error');

        //         return new ListTile(
        //           onTap: () {
        //             notificationService.update(document.id);
        //           },
        //           title: new Text(document.data()['id']),
        //           // /subtitle: new Text(document.data()['company']),
        //         );
        //       }).toList(),
        //     );
        //   },
        // )
        //     // TextButton(
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
