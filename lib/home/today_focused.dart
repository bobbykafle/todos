import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/app_text.dart';

class TodayFocused extends StatelessWidget {
  final List<String> tasks;
  const TodayFocused({super.key, required this.tasks,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       AppText(text: "Today - ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
       fontSize: 14,
       color:const Color.fromARGB(255, 213, 148, 148) ,
       ),
       const SizedBox(height: 10),

       AppText(text: "Focus Task",
       fontWeight: FontWeight.bold,
       color:Colors.white,),
       const SizedBox(height: 10),
       ...tasks.take(5).map(
        (task)=> Card(
          margin: const EdgeInsets.symmetric(vertical: 4),
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppText(text: task),
          ),
        ),
       ),

       

      ],
    );
  }
}