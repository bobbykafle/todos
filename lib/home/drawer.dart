import 'package:flutter/material.dart';
import 'package:to_do_app/Remove/remove_page.dart';
import 'package:to_do_app/SignOut/sign_out.dart';
import 'package:to_do_app/ThemeChange/theme_color.dart';
import 'package:to_do_app/ThemeChange/theme_page.dart';
import 'package:to_do_app/about_app.dart'; 
import 'package:to_do_app/home.dart';
import 'package:to_do_app/tasks/task_page.dart';
import 'package:to_do_app/widgets/app_text.dart';



// ignore: camel_case_types
class MyDrawer extends StatelessWidget {
  final ValueChanged<String?> onSelectStatus;
  const MyDrawer({super.key, required this.onSelectStatus});

  @override
  Widget build(BuildContext context) {
    return Drawer(
             
              backgroundColor: ThemeColor.drawerBg(context),
              child: Padding(        //Center all ListView
                padding: const EdgeInsets.all(40),  
                child: ListView( 
                  shrinkWrap: true,    
                  children: [
                   Padding(                         // for DrawerHeader 
                     padding:  EdgeInsets.only(
                     top : MediaQuery.of(context).padding.top,
                     bottom: 10),
                     
                     child:  Container(
                      height: 80,
                       child: DrawerHeader(
                       
                        child: 
                        AppText(text: 'Let’s Get Things Done 🗂️'),
                        ),
                       
                            ),
                     ),
                   
                  ListTile(
                  leading: Icon(Icons.home, color: ThemeColor.drawerIcon(context)),
                  title:  Text('Home', style: TextStyle(color: ThemeColor.drawerText(context))),
                  onTap: () {
                     Navigator.push(
                      context,
                       MaterialPageRoute(
                        builder: (context)=> MyHomePage(),
                       ),
                        );
                      },
                    ),
                
                  ListTile(
                  leading: Icon(Icons.dashboard),
                  title: Text('All Tasks', style: TextStyle(color: ThemeColor.drawerText(context))),
                  onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                        context,
                         MaterialPageRoute(
                        builder: (_) => const TaskPage(status: null),
                   ),
                    );
                   },
                  ),               
                
                  ListTile(
                  leading: Icon(Icons.assignment_late, color: ThemeColor.drawerIcon(context)),
                  title:  Text('Pending Tasks', style: TextStyle(color: ThemeColor.drawerText(context))),
                  onTap: () {
                  Navigator.pop(context);
                   Navigator.push(
                        context,
                         MaterialPageRoute(
                        builder: (_) => const TaskPage(status: 'pending'),
                   ),
                    );
     
                  }
                    ),
                  ListTile(
                  leading: Icon(Icons.fact_check, color: ThemeColor.drawerIcon(context)),
                  title:  Text('Completed Taks', style: TextStyle(color: ThemeColor.drawerText(context))),               
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                         MaterialPageRoute(
                        builder: (_) => const TaskPage(status: 'completed',),
                   ),
                    );
                  }
                    ),
                
                   const Divider(),
                 

                  ListTile(
                      leading: Icon(Icons.brightness_6, color: ThemeColor.drawerIcon(context)),
                      title: Text('Theme', style: TextStyle(color: ThemeColor.drawerText(context))),
                      onTap: () {
                        Navigator.push(context,
                         MaterialPageRoute(builder: (_) => ThemePage(),
                         ),
                         );
                      },
                    ),
                    RemovePage(),

                    const Divider(),
                  
                  ListTile(
                      leading: Icon(Icons.help, color: ThemeColor.drawerIcon(context)),
                      title: Text('About App', style: TextStyle(color: ThemeColor.drawerText(context))),
                      onTap: () {
                        Navigator.push(context,
                         MaterialPageRoute(
                          builder: (_) => AboutPage(),
                          ),
                          );
                      },
                    ),
                 
                  const Divider(),

                   SignOutTile(),
                  
                  ],
                          
                ),
              ),       
    );
  }
}
  