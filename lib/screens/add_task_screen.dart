import 'dart:async';

import 'package:flutter/material.dart';
import 'package:to_do_app/models/task.dart';
import 'package:to_do_app/Widgets/tasks_list.dart';
import 'package:to_do_app/Widgets/tasks_title.dart';
import 'package:to_do_app/screens/tasks_screen.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

const backgroundColor = Color(0xFF6578D3);

class AddTaskScreen extends StatelessWidget {
  final Function addtaskfunction;

  AddTaskScreen(this.addtaskfunction);

  @override
  Widget build(BuildContext context) {
    String newtasktitle = '';

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: backgroundColor,
                fontSize: 40.0,
              ),
            ),
            TextField(
              // autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newvalue) {
                newtasktitle = newvalue;
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            FlatButton(
              child: Container(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
              color: backgroundColor,
              onPressed: () {
                print(newtasktitle);
                addtaskfunction(newtasktitle);
                Navigator.pop(context);
              },
            ),
            TextButton(
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(2021, 3, 5),
                      maxTime: DateTime(2022, 6, 7), onChanged: (date) {
                    print('change $date');
                  }, onConfirm: (date) {
                    print('confirm $date');
                    String d = date.toString();
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                },
                child: Text(
                  'show date time picker (English)',
                  style: TextStyle(color: Colors.blue),
                )),
          ],
        ),
      ),
    );
  }
}
