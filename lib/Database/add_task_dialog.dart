import 'package:flutter/material.dart';
import 'package:to_do_app/Notification/time_picker.dart';
import 'package:to_do_app/Notification/todo_notification.dart';
import 'curd_database.dart';
class AddTaskDialog extends StatefulWidget {
  //final String  category;
  const AddTaskDialog({
    super.key, 
   // required this.category,
    });

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final TextEditingController taskController = TextEditingController();
  bool isLoading = false;
  DateTime? selectedDateTime;

  Future<void> pickDateTime() async{
    final DateTime? pickDateTime = await Navigator.push(
      context, MaterialPageRoute(builder: (_)
      =>  DueTimePage(),
      ),
    );
    if (pickDateTime != null){
      setState(() {
        selectedDateTime = pickDateTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Task'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: taskController,
            decoration: InputDecoration(
              hintText: "Enter your tasks",
            ),
          
          ),
         const SizedBox(height: 14),
          // Button to pick date & time
          ElevatedButton(
            onPressed: pickDateTime,
            child: Text(selectedDateTime == null
                ? 'Pick Due Date & Time'
                : 'Selected: ${selectedDateTime.toString()}'),
          ),
        ],
      ),

       actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),

    
          ElevatedButton(
               onPressed: isLoading || selectedDateTime == null? null : () async {
               final text = taskController.text.trim();
               if (text.isEmpty) return;

                 setState(() => isLoading = true);

               try {
               await CurdDatabase().createTodo(text, selectedDateTime!);
               await TodoNotificationService.scheduleTodo(
                     id: DateTime.now().millisecondsSinceEpoch ~/ 1000,
                     title: text,
                      time: selectedDateTime!,
                    );

                 if (mounted) Navigator.pop(context);
                } catch (e) {
                print("Firestore error: $e");
               setState(() => isLoading = false);
               }
                },
                child: isLoading
                  ? const SizedBox(
                  height: 20,
                  width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                   )          
                   : const Text('Add'),
                 ),

          /*onPressed: isLoading
              ? null
              : () async {
                  final text = taskController.text.trim();
                  if (text.isEmpty) return;

                  await CurdDatabase().createTodo(
                    text,
                    widget.category,
                  );

                  if (mounted) Navigator.pop(context);
                },
          child: isLoading
              ? const CircularProgressIndicator()
              : const Text('Add'),*/
        
      ],
    );
  }
}