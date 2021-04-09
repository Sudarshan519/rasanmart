import 'package:cloud_firestore/cloud_firestore.dart';

import 'notificatoinModel.dart';

class NotificationRepository {
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

  fetchNotification(String userId) async {
    try {
      bool complete = false;
      List<NotificationData> newData = [];

      await FirebaseFirestore.instance
          .collection('User')
          .doc(userId)
          .collection('notification')
          .get()
          .then((value) {
        value.docs.forEach((element) {
          newData.add(NotificationData(
            id: element.id,
            title: element['title'].toString(),
            imgpath: element['imgpath'].toString(),
            message: element['message'],
            noticedate: element['noticedate'],
            payload: element['payload'],
            noticeRead: element['noticeRead'] as bool,
          ));
        });
      }).whenComplete(() => complete = true);
      // if (complete)
      //   return right(newData);
      // else
      //   return left('Error while fetching notification');
    } catch (error) {
      //return left('Error Occured while updating notifications');
    }
  }

  updateNotification(String userId, List<NotificationData> notification) async {
    try {
      for (NotificationData notice in notification) {
        await FirebaseFirestore.instance
            .collection('User')
            .doc(userId)
            .collection('notification')
            .doc(notice.id)
            .update({'noticeRead': true}).then((value) => null);
      }

      // return right(null);
    } catch (error) {
      //  return left('Error Occured while updating notifications');
    }
  }

  addNotification(String userId, NotificationData notification) async {
    try {
      bool complete = false;
      String id = '';

      await FirebaseFirestore.instance
          .collection('User')
          .doc(userId)
          .collection('notification')
          .add(notification.toMap())
          .then((value) {
        id = value.id;
      }).whenComplete(() => complete = true);
      // if (complete)
      //   return right(id);
      // else
      //   return left('Error while adding in notification');
    } catch (error) {
      //  return left('Error Occured while adding in notifications');
    }
  }

  @override
  deleteNotification(String userId, NotificationData notification) async {
    try {
      bool complete = false;
      String id = '';

      await FirebaseFirestore.instance
          .collection('User')
          .doc(userId)
          .collection('notification')
          .doc(notification.id)
          .delete()
          .whenComplete(() => complete = true);
      if (complete)
        print('completed');
      //  return right('Successfully Deleted');
      else
        print('error');
      //  return left('Error while adding in notification');
    } catch (error) {
      //return left('Error Occured while adding in notifications');
    }
  }
}
