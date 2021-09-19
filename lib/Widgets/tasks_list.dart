import 'package:flutter/material.dart';
import 'package:to_do_app/Widgets/tasks_title.dart';
import 'package:to_do_app/models/task.dart';
import 'package:to_do_app/screens/add_task_screen.dart';

class TasksList extends StatefulWidget {
  final List<Task> tasks;

  TasksList(this.tasks);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTitle(
          taskTitle: widget.tasks[index].name,
          isChecked: widget.tasks[index].isDone,
          //anonymous function
          checkboxcallback: (checkboxstate) {
            setState(() {
              widget.tasks[index].toggleDone();
              //to move it down//
              if (widget.tasks[index].isDone == true) {
                final String first = widget.tasks.removeAt(index).name;
                widget.tasks.add(Task(
                  name: first,
                  isDone: true,
                ));
              }
            });
          },
          tasks: widget.tasks,
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}
