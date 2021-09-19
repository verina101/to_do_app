import 'package:flutter/material.dart';
import 'package:to_do_app/screens/tasks_screen.dart';
import 'package:to_do_app/models/task.dart';
import 'package:to_do_app/screens/add_task_screen.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

const backgroundColor = Color(0xFF6578D3);

class TaskTitle extends StatefulWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxcallback;
  final List<Task> tasks;
  final String date;

  TaskTitle(
      {this.isChecked = false,
      this.taskTitle = '',
      required this.checkboxcallback,
      required this.tasks,this.date=''});

  @override
  State<TaskTitle> createState() => _TaskTitleState();
}

class _TaskTitleState extends State<TaskTitle> {
  List<Icon> optionsString = [
    Icon(Icons.edit),
    Icon(Icons.delete),
    Icon(Icons.repeat)
  ];

  List<DropdownMenuItem> optionsfunction() {
    List<DropdownMenuItem> options = [];
    for (int i = 0; i < 3; i++) {
      Icon value = optionsString[i];
      var newitem = DropdownMenuItem(
        child: value,
        value: i,
      );
      options.add(newitem);
    }
    return options;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          widget.taskTitle,
          style: TextStyle(
              decoration: widget.isChecked ? TextDecoration.lineThrough : null),
        ),
        trailing: Container(
          child: DropdownButton<dynamic>(
              items: optionsfunction(),
              value: null,
              onChanged: (value) {
                setState(() {
                  if (value == 1) {
                    print(value);
                    for (int i = 0; i < widget.tasks.length; i++) {
                      print(widget.taskTitle);
                      print(widget.tasks[i].name);
                      if (widget.taskTitle == widget.tasks[i].name) {
                        widget.tasks.removeAt(i).name;
                        break;
                      }
                    }
                  } else if (value == 0) {
                    for (int i = 0; i < widget.tasks.length; i++) {
                      print(widget.taskTitle);
                      print(widget.tasks[i].name);
                      if (widget.taskTitle == widget.tasks[i].name) {
                        widget.tasks.removeAt(i).name;
                        break;
                      }
                    }
                  } else if (value == 0) {
                    for (int i = 0; i < widget.tasks.length; i++) {
                      print(widget.taskTitle);
                      print(widget.tasks[i].name);
                      if (widget.taskTitle == widget.tasks[i].name) {
                        widget.tasks.removeAt(i).name;
                        break;
                      }
                    }
                  }
                });
              }),
        ),
        leading: Checkbox(
          value: widget.isChecked,
          onChanged: (newValue) {
            widget.checkboxcallback(newValue);
            //   setState(() {
            //     isChecked = newValue!;
            //     //
            //   });
          },
        ),
        subtitle: Text(widget.date),
      ),
    );
  }
}

// class TaskCheckbox extends StatelessWidget {
//   final bool checkBoxState;
//   final Function toggleCheckboxState;
//
//   TaskCheckbox(this.checkBoxState, this.toggleCheckboxState);
//
//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//       value: checkBoxState,
//       activeColor: backgroundColor,
//       onChanged: toggleCheckboxState,
//     );
//
// }
