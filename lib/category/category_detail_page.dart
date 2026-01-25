/*import 'package:flutter/material.dart';
import 'package:to_do_app/Database/add_task_dialog.dart';
import 'package:to_do_app/tasks/task_list.dart';

/*class CategoryDetailPage extends StatefulWidget {
  final String categoryName;

  const CategoryDetailPage({super.key, required this.categoryName});

  @override
  State<CategoryDetailPage> createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends State<CategoryDetailPage> {
  int selectedTab = 0; // 0 - All, 1 - Pending, 2 - Completed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.categoryName)),
        actions: [
          IconButton(
            onPressed: () {
              // Firestore delete function will go here
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: Column(
        children: [
          // Tabs
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () => setState(() => selectedTab = 0),
                child: const Text('All'),
              ),
              TextButton(
                onPressed: () => setState(() => selectedTab = 1),
                child: const Text('Pending'),
              ),
              TextButton(
                onPressed: () => setState(() => selectedTab = 2),
                child: const Text('Completed'),
              ),
            ],
          ),

          // Task list
          Expanded(
            child: Center(
              child: Text(
                'No tasks found', // Placeholder, your StreamBuilder will replace this
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),

      // FloatingActionButton placeholder
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          //  custom dialog here
        },
      ),
    );
  }
}*/

//main
class CategoryDetailPage extends StatefulWidget {
 final String categoryName ;
  
const CategoryDetailPage(
 {super.key, required this.categoryName,});

  @override
  State<CategoryDetailPage> createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends State<CategoryDetailPage> {
  int selectedTab = 0;

 /*late Map<String, List<String>> taskMap;
 Set<String> completedTasks = {};
 int selectedTab = 0; // for tasks 0-all, 1-pandding, 2-complete
 Set<String> complete ={};

 
  // Placeholder task list (will later be replaced by Firestore)
  List<String> placeholderTasks = [
    "Example Task 1",
    "Example Task 2",
    "Example Task 3",
  ];

 /*
  @override
  void initState(){
    super.initState();
    taskMap = {
 
   
     "Work/Study":[
     "Read Dart documentation",
     "Learn Logic of programming",
     "Watch programming tutorial",
     "Complete Project",
     "Complete unit tests",
     "Prepare presentation",
     "Submit assignment",
     "Review notes",
     "Practice coding problems",
     "Plan study schedule",
     "Organize project files",
     "Check emails",
     "Collaborate with team",
     "Debug code",
     "Update resume",
     "Attend online lecture"
     ],


     "Personal":[
     "Call mom",
     "Meditate",
     "Exercise",
     "Read a book",
     "Plan weekend",
     "Journal daily",
     "Cook breakfast",
     "Listen to music",
     "Clean room",
     "Water plants",
     "Write gratitude list",
     "Drink enough water",
     "Plan budget",
     "Relax with tea",
     "Go for a walk"
     ],


     "Shopping":[
     "Buy groceries",
     "Order shoes",
     "Get vegetables",
     "Buy stationery",
     "Pick up parcel",
     "Purchase gift",
     "Check online deals",
     "Restock pantry",
     "Buy snacks",
     "Get medicine",
     "Buy new clothes",
     "Purchase phone accessories",
     "Get cleaning supplies",
     "Check fridge items",
     "Buy fruit"
     ],


     "Health":[
     "Morning run",
     "Yoga session",
     "Drink water",
     "Take vitamins",
     "Sleep 8 hours",
     "Track calories",
     "Go for walk",
     "Meditation",
     "Check blood pressure",
     "Healthy breakfast",
     "Avoid junk food",
     "Stretching exercises",
     "Visit doctor",
     "Wash hands regularly",
     "Take supplements"
     ],
      
      
     "Finance/Bills":[
     "Pay electricity bill",
     "Check bank statement",
     "Pay internet bill",
     "Review budget",
     "Invest in savings",
     "Track expenses",
     "Pay credit card",
     "Plan monthly goals",
     "Update finance app",
     "Check bills",
     "Withdraw cash",
     "Deposit money",
     "Check loan status",
     "File tax documents",
     "Review subscriptions"
     ],


     "Others/Misc":[
     "Plan weekend trip",
     "Clean room",
     "Fix broken items",
     "Read magazine",
     "Call friend",
     "Organize files",
     "Plan birthday party",
     "Watch documentary",
     "Learn new skill",
     "Take online course",
     "Update contacts",
     "Backup photos",
     "Decorate room",
     "Recycle old items",
     "Write blog post"
     ],

    };
  }
  */

   List<String> get filteredTasks{
    if(selectedTab == 1){
      return placeholderTasks.where((t) => !completedTasks.contains(t)).toList();
    }
    else if(selectedTab == 2){
      return placeholderTasks.where((t) => !completedTasks.contains(t)).toList();
    }
    return placeholderTasks;
   }*/
    @override
     Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.categoryName)),
        /*actions: [
       IconButton(
            onPressed: (){
               setState(() {
                completedTasks.removeWhere((t)
                 => filteredTasks.contains(t));      
          }); 
            },
             icon: Icon(Icons.delete),
          ),
        ],*/
      ),
      body: Column(
        children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: () => setState(() => selectedTab = 0),
                  child: const Text('All')),
              TextButton(
                  onPressed: () => setState(() => selectedTab = 1),
                  child: const Text('Pending')),
              TextButton(
                  onPressed: () => setState(() => selectedTab = 2),
                  child: const Text('Completed')),
        ],
       ),
         Expanded(
          child: TaskList(
          category: widget.categoryName,
          status: selectedTab == 0
          ? null : selectedTab ==1 ?
          'pending' : 'complete',
          ),
          ),

           ],
      ),
      floatingActionButton:  FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
           showDialog(
           context: context,
            builder: (_) => AddTaskDialog(category: widget.categoryName),
           );
          
        }),
    );
     }
}
        
     /*  // Task List
       Expanded(
        child: filteredTasks.isEmpty?
        const Center(child: Text('No tasks found'),)
        : ListView.builder(
           itemCount: filteredTasks.length,
          itemBuilder: (context,index){
            final task = filteredTasks[index];
            return TaskItem(
              task: task, 
              isCompleted: completedTasks.contains(task),
               onChanged: (value){
                setState(() {
                  if (value == true) {
                    completedTasks.add(task);
                  }
                  else{
                    completedTasks.remove(task);
                  }
                });
               }
            );
          },
        ),*/
    
      */ 