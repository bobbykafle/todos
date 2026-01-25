import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/Database/curd_database.dart';
import 'package:to_do_app/tasks/task_item.dart';


class TaskList extends StatelessWidget {
  final String? status; 

  const TaskList({super.key,this.status});

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(
      stream: CurdDatabase().getTodoByStatus(status),
      builder: (context, snapshot) {
        
       if (snapshot.connectionState == ConnectionState.waiting){
          
        return Center (child: CircularProgressIndicator());
        } 
        

        if(!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('No Task Found'));
        } 
      
     /* if(!snapshot.hasData){
        return const Center(child: CircularProgressIndicator());
      }*/


         

      final doc = snapshot.data!.docs;
  
      /* if(doc.isEmpty){
        return const Center(child: Text('No Task Found'),
        );
       }*/

      return ListView.builder(
        padding: const EdgeInsets.only(
          bottom: 10.0,
          top: 15.0,
        ),
        itemCount: doc.length,
        itemBuilder: (context, index){
         //each doc is a QueryDocumentSnapshot
          final taskDoc = doc[index];

         //aecess field from doc

            final data = taskDoc.data() as Map<String, dynamic>;

            final title = data['title'] ?? 'Untitled';
            final statusValue = data['status'] ?? 'pending';



         

         // return null;
          return TaskItem(
            task: title,
            isCompleted: statusValue == 'completed',
            onChanged: (value) {
              CurdDatabase().updateTodoStatus(
                taskDoc.id,
                value == true ? 'completed' : 'pending',
                );
            }
            );
        },
        );

      },
    );
  }
}