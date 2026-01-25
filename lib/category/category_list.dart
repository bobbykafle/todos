import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
class CategoryList {
  String tasknumber;
  final String name;
  Color progresscolor;
  double value;
  final IconData icon;

 CategoryList ({
  required this.name,
  required this.tasknumber,
  required this.progresscolor,
   this.value =0,
   required this.icon,
});
} 

// creating the DataList:
 List<CategoryList> categoryData= [
  CategoryList(name: "Work", tasknumber: "50 tasks", progresscolor: const Color.fromARGB(255, 236, 126, 119), value: 0.5, icon: Symbols.work_outline),
  CategoryList(name: "Study", tasknumber: "50 tasks", progresscolor: const Color.fromARGB(255, 227, 203, 106), value: 0.5, icon:Symbols.menu_book),
  CategoryList(name: "Personal", tasknumber: "50 tasks", progresscolor: const Color.fromARGB(255, 121, 164, 211), value: 0.5, icon: Symbols.person),
  CategoryList(name: "Shopping", tasknumber: "50 tasks", progresscolor: const Color.fromARGB(255, 184, 118, 173), value: 0.5, icon: Symbols.shopping_bag),
  CategoryList(name: "Health", tasknumber: "50 tasks", progresscolor: const Color.fromARGB(255, 205, 129, 175), value: 0.5, icon: Symbols.health_and_safety),
  CategoryList(name: "Finance/Bills", tasknumber: "50 tasks", progresscolor: const Color.fromARGB(255, 215, 151, 147), value: 0.5, icon: Symbols.attach_money),
  CategoryList(name: "Others/Misc", tasknumber: "50 tasks", progresscolor: const Color.fromARGB(255, 137, 203, 143), value: 0.5, icon: Symbols.mic),

 ];


//Task widget
/*class TaskItem extends StatelessWidget {
   final String task;
   final bool isCompleted;
   final ValueChanged<bool?> onChanged;

  const TaskItem({
  super.key,
  required this.task,
  required this.isCompleted,
  required this.onChanged,
   });*/

   @override
  Widget build(BuildContext context) {
  return GridView.builder(
    padding: const EdgeInsets.all(16.0),
    gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
       childAspectRatio: 3.0),

       itemCount: categoryData.length,
       itemBuilder: (context, index){
        final category = categoryData[index];
        return Card(
      elevation: 4,
      shape: RoundedSuperellipseBorder(
        side: const BorderSide(width: 0.4, 
        color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(14.0),
      ),
      /*child: CheckboxListTile(
        title: Text(task),
        value: isCompleted, 
        onChanged: onChanged),*/
      child: Center(
        child: Text(
          category.name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
     );
       },

  );
  
}

