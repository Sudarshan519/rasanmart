import 'package:cloud_firestore/cloud_firestore.dart';

import 'notificatoinModel.dart';

class NotificationRepository {
  final collectionStream = FirebaseFirestore.instance.collection('notification')
      //.where(FirebaseAuth.instance.currentUser.uid)
      ;
  CollectionReference reference =
      FirebaseFirestore.instance.collection('notification');

  getnotification() async {
    var data = await reference.get();
    return data.docs
        .map<NotificationData>((e) => NotificationData.fromDocumentSnapshot(e))
        .toList();
  }

  Stream<List<NotificationData>> allNotification() {
    return collectionStream.snapshots().map((QuerySnapshot query) {
      List<NotificationData> value = [];
      query.docs.forEach((element) {
        print(element.id);
        value.add(NotificationData.fromDocumentSnapshot(element));
      });
     // print(value.length);
      return value;
      // query.docs.forEach((element) {value.add(Notifications.);})
    });
  }

  updatenotification() async {}
  //notification
  clearNotification(String userId) async {
    try {
      bool complete = false;

      await FirebaseFirestore.instance
          .collection('User')
          .doc(userId)
          .delete()
          .whenComplete(() => complete = true);

      // if (complete)
      //   return right('Successfully cleared notifications.');
      // else
      //   return left('Some Error occured while clearing notification');
    } catch (error) {
      //return left('Error while fetching information');
    }
  }

  // fetchNotification() async {
  //   try {
  //     bool complete = false;
  //     List<NotificationData> newData = [];
  //     collectionStream.snapshots().forEach((element) {
  //       return element;
  //       newData.add(NotificationData(
  //         id: element.id,
  //         title: element['title'].toString(),
  //         imgpath: element['imgpath'].toString(),
  //         message: element['message'],
  //         noticedate: element['noticedate'],
  //         //  payload: element['payload'],
  //         noticeRead: element['noticeRead'] as bool,
  //       ));
  //     });

  //     print(newData.length);
  //     return newData;
  // await FirebaseFirestore.instance
  //     .collection('notification')
  //     .where('id', isEqualTo: userId)
  //     .get()
  //     .then((value) {
  //   value.docs.forEach((element) {
  //     newData.add(NotificationData(
  //       id: element.id,
  //       title: element['title'].toString(),
  //       imgpath: element['imgpath'].toString(),
  //       message: element['message'],
  //       noticedate: element['noticedate'],
  //       payload: element['payload'],
  //       noticeRead: element['noticeRead'] as bool,
  //     ));
  //   });
  // }).whenComplete(() => complete = true);
  // if (complete)
  //   return right(newData);
  // else
  //   return left('Error while fetching notification');
  //   } catch (error) {
  //     //return left('Error Occured while updating notifications');
  //   }
  // }

  void update(String id) {
    reference.doc(id).update({'viewed': true});
  }

  // updateNotification(String userId, List<NotificationData> notification) async {
  //   try {
  //     for (NotificationData notice in notification) {
  //       await FirebaseFirestore.instance
  //           .collection('User')
  //           .doc(userId)
  //           .collection('notification')
  //           .doc(notice.id)
  //           .update({'noticeRead': true}).then((value) => null);
  //     }

  //     // return right(null);
  //   } catch (error) {
  //     //  return left('Error Occured while updating notifications');
  //   }
  // }

  // addNotification(String userId, NotificationData notification) async {
  //   try {
  //     bool complete = false;
  //     int id = 0;

  //     await FirebaseFirestore.instance
  //         .collection('User')
  //         .doc(userId)
  //         .collection('notification')
  //         .add(notification.toMap())
  //         .then((value) {
  //       id = value.id;
  //     }).whenComplete(() => complete = true);
  //     // if (complete)
  //     //   return right(id);
  //     // else
  //     //   return left('Error while adding in notification');
  //   } catch (error) {
  //     //  return left('Error Occured while adding in notifications');
  //   }
  //}

  // @override
  // deleteNotification(String userId, NotificationData notification) async {
  //   try {
  //     bool complete = false;
  //     String id = '';

  //     await FirebaseFirestore.instance
  //         .collection('User')
  //         .doc(userId)
  //         .collection('notification')
  //         .doc(notification.id)
  //         .delete()
  //         .whenComplete(() => complete = true);
  //     if (complete)
  //       print('completed');
  //     //  return right('Successfully Deleted');
  //     else
  //       print('error');
  //     //  return left('Error while adding in notification');
  //   } catch (error) {
  //     //return left('Error Occured while adding in notifications');
  //   }
  // }
}

final notificationService = NotificationRepository();
