import 'package:flutter/material.dart';
import 'package:to_do_app/Database/curd_database.dart';
import 'package:to_do_app/ThemeChange/theme_color.dart';
import 'package:to_do_app/widgets/app_text.dart';

class RemovePage extends StatelessWidget {
  const RemovePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
                    leading: Icon(Icons.cleaning_services, 
                    color: ThemeColor.drawerIcon(context),
                    ),
                    title: Text('Remove Done',
                     style: TextStyle(
                      color: ThemeColor.drawerText(context),
                      ),
                      ),
                    onTap: () {
                      Navigator.pop(context);
                        showDialog(
                          context: context, 
                          builder: (context) => AlertDialog(
                            backgroundColor: Theme.of(context).cardColor,
                            content: SizedBox(
                              width: 280,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AppText(text: 'All completed task will be permanently deleted.',
                                  fontSize: 16,
                                  textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 20),
                                         Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: AppText(text: 'Cancel',
                        fontSize: 12,),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () async{
                          // Call the method that deletes all completed tasks
                           await CurdDatabase().deleteAllCompletedTasks();
                           Navigator.pop(context);

                           //Show a confirmation to the user
                            ScaffoldMessenger.of(context).showSnackBar(
                             const SnackBar(content: Text('All completed tasks removed!')),
                           );
                        },
                        child: const AppText(text: 'Remove',
                        fontSize: 12,),
                      ),
                    ],
                  ),
                                ],
                              ),
                            ),
          
                          ),
                          ); 
                      },
                    );
  }
}