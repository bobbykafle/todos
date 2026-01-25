import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_app/Notification/todo_notification.dart';

class CurdDatabase {
  final CollectionReference todosRef = 
  FirebaseFirestore.instance.collection("todos");
  
  //CREATE
  Future<void> createTodo(String? title, DateTime dueTime) async{
      // Create a unique notification ID
  int notificationId = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    await todosRef.add({
        'title': title,
        //'category' : category,
        'status' : 'pending',
        'createdAt': FieldValue.serverTimestamp(),
        'dueTime' : dueTime.toIso8601String(),
        'notification': notificationId,
    });

     // schedule  notification
    TodoNotificationService.scheduleTodo(
      id: notificationId, 
      title: title?? 'To Remember', 
      time: dueTime,
      );
      
    }
  
  //READ
  /*generally there are two way of Read one: simplefetch no realTime Updates.
  QuerySnapshot snapShot = await.todoRef.get();
  for(var doc in the snapshot.docs){
  print(doc.data());
  }  which is  not generally used in realworld projects*/
Stream<QuerySnapshot> getTodo() {
return todosRef.orderBy('createdAt',
         descending: true).snapshots();
}

// filter acc to category and status :
Stream<QuerySnapshot> getTodoByStatus( String? status){
  Query query =todosRef;
 
  /*if(category != null){l
   query = query.where('category', isEqualTo: category);
  }*/
  if(status != null){
    query = query.where('status', isEqualTo: status);
  }
  return query.snapshots();
}

  //UPDATE
  Future<void> updateTodoStatus (String docId,
  String status){
    return todosRef.doc(docId).update({
       'status' : status,
    }
     
  );
  }

  //DELETE
 Future<void> deleteTodo (String docId) async{
 
// Get documents to read  notification Id
  DocumentSnapshot doc = await todosRef.doc(docId).get();
  if(doc.exists){
    int? notificationId = doc['notificaion'] as int?;
    if (notificationId != null){
      await TodoNotificationService.cancel(notificationId);

    }
  }
  //Delete from FireStore
  await todosRef.doc(docId).delete();
 }
 //Delete all completed tasks properly
 Future<void> deleteAllCompletedTasks() async {
  QuerySnapshot snapshot = await todosRef.where('status', isEqualTo: 'completed').get();

  for (var doc in snapshot.docs) {
    int? notificationId = doc['notification'] as int?;
    if (notificationId != null) {
      await TodoNotificationService.cancel(notificationId);
    }
    await doc.reference.delete();
  }
}

}