import 'package:flutter/material.dart';

import 'package:to_do_app/tasks/task_list.dart';
class TaskPage extends StatelessWidget {
  final  String? status; 
  const TaskPage({super.key,  this.status});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
           status == null ?
            'All Tasks' : 
             status == 'pending'?
            'Pending Tasks' : 'Completed Tasks',
            ),
        ),
          ),
          
      

          
      body: TaskList(status: status),
    );
  }
}
