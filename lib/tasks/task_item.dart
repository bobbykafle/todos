import 'package:flutter/material.dart';
import 'package:to_do_app/ThemeChange/theme_color.dart';

class TaskItem extends StatelessWidget {
  final String task;           
  final bool isCompleted;         
  final ValueChanged<bool?> onChanged; 
  const TaskItem({
    super.key,
    required this.task,
    required this.isCompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Material(
        elevation: isLight ? 2 : 6,
        color: Theme.of(context).cardColor, 
        shape: RoundedSuperellipseBorder(
          side: BorderSide(
            width: 0.4, 
           color:  isLight ?  Colors.black26 : Colors.white54,
            ),
          borderRadius: BorderRadius.circular(13.0),
        ),
        child: CheckboxListTile(
          title: Text(task,
          style: TextStyle(color: ThemeColor.text(context),
          fontWeight: FontWeight.w500,
          ),
          ),        
          value: isCompleted,      
          onChanged: onChanged,  
          controlAffinity: ListTileControlAffinity.platform,    
        ),
      ),
    );
  }
}
