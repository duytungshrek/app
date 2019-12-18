import 'package:flutter/material.dart';
import 'package:tiki/models/notification_recent.dart';
import 'package:tiki/models/notification_total.dart';
import 'package:tiki/ui/shared/flutter_screenutil.dart';

class TabNotification extends StatefulWidget {
  @override
  TabNotificationState createState() => TabNotificationState();
}

class TabNotificationState extends State<TabNotification> {
  bool status = true;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 320, height: 568)..init(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Notification Tab'),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () {})
          ],
        ),
        body: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.grey[300],
                  child: Column(
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                  color: status ? Colors.blue : Colors.grey,
                                  width: 3.0),
                              bottom:
                                  BorderSide(color: Colors.grey, width: 0.5),
                              top: BorderSide(color: Colors.grey, width: 0.5),
                              right: BorderSide(color: Colors.grey, width: 0.5),
                            ),
                            color: status ? Colors.white : Colors.grey[300],
                          ),
                          width: 50,
                          height: 50,
                          child: Icon(
                            Icons.home,
                            size: 30,
                            color: Colors.grey,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            status = true;
                          });
                        },
                      ),
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                  color: status ? Colors.grey : Colors.blue,
                                  width: 3.0),
                              bottom:
                                  BorderSide(color: Colors.grey, width: 0.5),
                              top: BorderSide(color: Colors.grey, width: 0.5),
                              right: BorderSide(color: Colors.grey, width: 0.5),
                            ),
                            color: status ? Colors.grey[300] : Colors.white,
                          ),
                          width: 50,
                          height: 50,
                          child:
                              Icon(Icons.timer, size: 30, color: Colors.grey),
                        ),
                        onTap: () {
                          setState(() {
                            status = false;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child:
                    status ? contentNotificationTotal() : recentNotification(),
              )
            ],
          ),
        ));
  }
}

Widget contentNotificationTotal() {
  return ListView.builder(
      itemCount: totalNotifications.length,
      itemBuilder: (BuildContext context, int index) => Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.new_releases,
                        color: Colors.orange,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            totalNotifications[index].title,
                            style: TextStyle(
                                fontSize: ScreenUtil.getInstance().setSp(16),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            totalNotifications[index].dateOfTime,
                            style: TextStyle(
                                fontSize: ScreenUtil.getInstance().setSp(12)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  totalNotifications[index].description,
                  style:
                      TextStyle(fontSize: ScreenUtil.getInstance().setSp(14)),
                ),
                Divider()
              ],
            ),
          ));
}

Widget recentNotification() {
  return ListView.builder(
      itemCount: recentNotifications.length,
      itemBuilder: (BuildContext context, int index) => Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.timer,
                        color: Colors.pink,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            recentNotifications[index].titleNotification,
                            style: TextStyle(
                                fontSize: ScreenUtil.getInstance().setSp(16),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            recentNotifications[index].dateOfTime,
                            style: TextStyle(
                                fontSize: ScreenUtil.getInstance().setSp(12)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  recentNotifications[index].contentNotification,
                  style:
                      TextStyle(fontSize: ScreenUtil.getInstance().setSp(14)),
                ),
                Divider()
              ],
            ),
          ));
}
