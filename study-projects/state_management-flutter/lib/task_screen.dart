import 'package:flutter/material.dart';
import 'package:state_management_examples/addtask_screen.dart';
import 'package:state_management_examples/models/task.dart';
import 'package:state_management_examples/models/task_list.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => AddTaskScreen());
        },
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding:
                  EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    child: Icon(
                      Icons.list,
                      size: 30,
                      color: Colors.lightBlueAccent,
                    ),
                    backgroundColor: Colors.white,
                    radius: 30,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Todoey",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 30),
                  ),
                  Text(
                    "12 Tasks",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  )
                ],
              ),
            ),
            Expanded(
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: TasksList())),
          ]),
    );
  }
}

// /// Task CheckBox
// class TaskCheckBox extends StatelessWidget {
//   final bool checkboxState;
//   final Function toggleCheckboxState;

//   TaskCheckBox(this.checkboxState, this.toggleCheckboxState);

//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(activeColor: Colors.lightBlueAccent, value: checkboxState);
//     // onChanged: toggleCheckboxState);
//   }
// }

/// Task Tile
