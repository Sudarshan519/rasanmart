import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class NotificationData {
  String id;
  String title;
  String message;
  String imgpath;
  String noticedate;
  bool noticeRead;
  //final String payload;

  NotificationData({
    @required this.title,
    @required this.message,
    @required this.imgpath,
    @required this.noticedate,
    @required this.noticeRead,
    // this.payload = '',
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'message': message,
      'imgpath': imgpath,
      'noticedate': noticedate,
      'noticeRead': noticeRead,
      // 'payload': payload,
    };
  }

  // factory NotificationData.fromMap(Map<String, dynamic> map) {
  //   return NotificationData(
  //     title: map['title'] ?? 'empty',
  //     message: map['message'] ?? "empty",
  //     //imgpath: map['imgpath'],
  //     //noticedate: map['noticedate'],
  //     //noticeRead: map['noticeRead'],
  //     //  payload: map['payload'],
  //   );
  // }

  // NotificationData.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
  //   id:
  //   documentSnapshot.id;
  //   title:
  //   documentSnapshot.data()['title'];
  //   message:
  //   documentSnapshot.data()['message'];
  // }
  NotificationData.fromDocumentSnapshot(DocumentSnapshot doc) {
    id = doc.id;
    //print(doc.id);
     // title = doc["title"];
     // message = doc["message"];
    // city = doc["city"];
    // phone = doc["phone"];
    // street = doc["street"];
    // zip = doc['zip'];
  }
  // NotificationData.fromJson(Map<String, dynamic> doc) {
  //   id = doc["id"];
  //   name = doc["name"];
  //   email = doc["email"];
  //   city = doc["city"];
  //   phone = doc["phone"];
  //   street = doc["street"];
  // }

  // String toJson() => json.encode(toMap());

  // factory NotificationData.fromJson(String source) =>
  //     NotificationData.fromMap(json.decode(source));

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;

  //   return other is NotificationData &&
  //       other.title == title &&
  //       other.message == message &&
  //       other.imgpath == imgpath &&
  //       other.noticedate == noticedate &&
  //       other.noticeRead == noticeRead &&
  //       other.payload == payload;
  // }

  // @override
  // int get hashCode {
  //   return title.hashCode ^
  //       message.hashCode ^
  //       imgpath.hashCode ^
  //       noticedate.hashCode ^
  //       noticeRead.hashCode ^
  //       payload.hashCode;
  // }
}
