import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTile;
  final Function checkboxCallback;
  TaskTile({Key key, this.isChecked, this.taskTile, this.checkboxCallback});

  // void checkboxCallback(bool checkboxState) {
  //   isChecked = checkboxState;
  // }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "This is a text",
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: (newValue) => checkboxCallback(newValue),
      ),
    );
  }
}
