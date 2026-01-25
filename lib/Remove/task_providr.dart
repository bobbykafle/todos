import 'package:flutter/material.dart';
import 'package:to_do_app/Database/curd_database.dart';
import 'package:to_do_app/Notification/todo_notification.dart';

class TaskProvider extends ChangeNotifier {
  final CurdDatabase db = CurdDatabase();

  //Remove all completed tasks from firestore

  Future<void> removeCompletedTasks() async{
    final snapshot = await db.todosRef.
    where('status', isEqualTo: 'completed').get();

  for (var doc in snapshot.docs) {
    final data = doc.data() as Map<String, dynamic>?;
      // Cancel notification if exists
       if(data !=null){
          int? notificationId = data['notification'] as int?;
         

      if (notificationId != null) {
        await TodoNotificationService.cancel(notificationId);
      } 
       }
         
      // Delete from Firestore
      await doc.reference.delete();
    }

    notifyListeners();
  }

 /* final List<String> _tasks = [];
  final Set<int> _completedIndexes = {};

  List<String> get tasks => _tasks;
  Set<int> get completedIndexes => _completedIndexes;

  void addTask(String task) {
    _tasks.add(task);
    notifyListeners();
  }

  void toggleTask(int index, bool isCompleted) {
    if (isCompleted) {
      _completedIndexes.add(index);
    } else {
      _completedIndexes.remove(index);
    }
    notifyListeners();
  }

  void removeCompletedTasks() {
    _tasks.removeWhere((task) {
      final index = _tasks.indexOf(task);
      return _completedIndexes.contains(index);
    });

    _completedIndexes.clear();
    notifyListeners();
  }*/
}
