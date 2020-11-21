import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  AddTask({Key key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String title;
  DateTime date;
  @override
  void initState() {
    super.initState();
    title = '';
    date = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    final hp = MediaQuery.of(context).size.height;
    final wp = MediaQuery.of(context).size.height;
    final topSize = hp * 0.2;
    final sideSize = wp * 0.05;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(25),
          topRight: const Radius.circular(25),
        ),
      ),
      padding: EdgeInsets.fromLTRB(sideSize, topSize, sideSize, 0),
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
              hintText: 'タスク追加',
            ),
            onChanged: (String value) {
              setState(() {
                title = value;
              });
            },
          ),
          SizedBox(
            height: 200,
            child: CupertinoTheme(
              data: CupertinoThemeData(
                textTheme: CupertinoTextThemeData(
                  pickerTextStyle: TextStyle(color: Colors.white),
                ),
              ),
              child: CupertinoDatePicker(
                use24hFormat: true,
                onDateTimeChanged: (DateTime value) {
                  setState(() {
                    date = value;
                  });
                },
              ),
            ),
          ),
          MaterialButton(
            minWidth: wp,
            color: Colors.lightBlue[300],
            disabledColor: Color.fromARGB(130, 79, 195, 247),
            onPressed: title == ''
                ? null
                : () {
                    print('追加ボタン押された');
                    Navigator.of(context).pop();
                  },
            child: Text('追加'),
          )
        ],
      ),
    );
  }
}
