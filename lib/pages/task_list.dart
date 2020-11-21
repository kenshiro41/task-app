import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:task_app/pages/index.dart';
import 'package:task_app/utils/index.dart';

class TaskList extends StatefulWidget {
  TaskList();

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    final hp = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('タスク一覧'),
        leading: FlatButton(
          onPressed: () {
            print(context);
          },
          child: Icon(Icons.close),
          shape: CircleBorder(
            side: BorderSide(color: Colors.transparent),
          ),
        ),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              print('right button');
            },
            child: Text('Edit'),
            shape: CircleBorder(
              side: BorderSide(color: Colors.transparent),
            ),
          ),
        ],
      ),
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  // const _Body();

  @override
  Widget build(BuildContext context) {
    final hp = MediaQuery.of(context).size.height;
    final wp = MediaQuery.of(context).size.width;

    void _showFullScreenModal() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Container(
            height: hp * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(25),
                topRight: const Radius.circular(25),
              ),
            ),
            child: AddTask(),
          );
        },
      );
    }

    _showNotification() async {
      final android = AndroidNotificationDetails(
        'id',
        'channel ',
        'description',
        priority: Priority.high,
        importance: Importance.max,
      );
      final iOS = IOSNotificationDetails();
      final platform = NotificationDetails(android: android, iOS: iOS);

      final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
      await flutterLocalNotificationsPlugin.show(
        0,
        'Flutter devs',
        'Flutter Local Notification Demo',
        platform,
        payload: 'Welcome to the Local Notification demo',
      );
    }

    return Center(
      child: Stack(
        children: [
          ListView(
            children: people
                .map(
                  (p) => Row(
                    children: [
                      Text(p['name']),
                      Text('${p['age']}'),
                    ],
                  ),
                )
                .toList(),
          ),
          MaterialButton(
            onPressed: () {
              _showNotification();
              print('pressed');
            },
            child: Text('notify'),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, wp * 0.05, hp * 0.05),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                backgroundColor: primaryColor,
                onPressed: () {
                  _showFullScreenModal();
                },
                child: Icon(Icons.edit),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const people = [
  {'name': 'kenshiro', 'age': 21},
  {'name': 'kenshiro', 'age': 21},
  {'name': 'kenshiro', 'age': 21},
  {'name': 'kenshiro', 'age': 21},
  {'name': 'kenshiro', 'age': 21},
  {'name': 'kenshiro', 'age': 21},
];
