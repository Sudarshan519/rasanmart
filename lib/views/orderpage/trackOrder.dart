import 'package:flutter/material.dart';
import 'package:rasanmart/models/orderModel.dart';

class TrackOrder extends StatelessWidget {
  final OrderModelModel order;

  const TrackOrder({Key key, this.order}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 30, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Track Order',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text('Wed , 12 min ago'),
                    SizedBox(height: 5),
                    Text('October 10, 2016'),
                  ],
                ),
                Spacer(),
                Text(
                  'Total amt: \$123',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'ETA: 15 Min',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  for (int i = 0; i < 5; i++) CircleAvatar(radius: 2),
                  CircleAvatar(
                    radius: 5,
                    backgroundColor: Colors.red.shade800,
                  ),
                  for (int i = 0; i < 5; i++) CircleAvatar(radius: 2),
                ]),
                SizedBox(width: 10),
                Icon(
                  Icons.note,
                  color: Colors.grey[300],
                ),
                SizedBox(width: 3),
                Column(
                  children: [Text('ORder received'), Text('Descrpiton')],
                ),
                Spacer(),
                Text('11:30 PM')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  for (int i = 0; i < 5; i++) CircleAvatar(radius: 2),
                  CircleAvatar(radius: 5),
                  for (int i = 0; i < 5; i++) CircleAvatar(radius: 2),
                ]),
                SizedBox(width: 10),
                // Icon(
                //   Icons.note,
                //   color: Colors.grey[300],
                // ),
                // SizedBox(width: 3),
                // Column(
                //   children: [Text('ORder received'), Text('Descrpiton')],
                // ),
                // Spacer(),
                // Text('11:30 PM')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  for (int i = 0; i < 5; i++) CircleAvatar(radius: 2),
                  CircleAvatar(radius: 5),
                  for (int i = 0; i < 5; i++) CircleAvatar(radius: 2),
                ]),
                SizedBox(width: 10),
                // Icon(
                //   Icons.note,
                //   color: Colors.grey[300],
                // ),
                // SizedBox(width: 3),
                // Column(
                //   children: [Text('ORder received'), Text('Descrpiton')],
                // ),
                // Spacer(),
                // Text('11:30 PM')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  for (int i = 0; i < 5; i++) CircleAvatar(radius: 2),
                  CircleAvatar(radius: 5),
                  for (int i = 0; i < 5; i++) CircleAvatar(radius: 2),
                ]),
                SizedBox(width: 10),
                // Icon(
                //   Icons.note,
                //   color: Colors.grey[300],
                // ),
                // SizedBox(width: 3),
                // Column(
                //   children: [Text('ORder received'), Text('Descrpiton')],
                // ),
                // Spacer(),
                // Text('11:30 PM')
              ],
            ),
            SizedBox(height: 10),
            Divider(),
            Row(
              children: [
                Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Deleivery Address",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text("Delivery details",
                        style: TextStyle(
                          color: Colors.grey,
                        ))
                  ],
                )
              ],
            ),
            Divider(),
            Row(
              children: [
                Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
                SizedBox(width: 10),
                Column(
                  children: [Text(""), Text("")],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
