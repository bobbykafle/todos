import 'package:flutter/material.dart';
import 'package:to_do_app/Database/add_task_dialog.dart';
import 'package:to_do_app/ThemeChange/theme_color.dart';
import 'package:to_do_app/category/category_list.dart';
import 'package:to_do_app/home/drawer.dart';
import 'package:to_do_app/home/overview_section.dart';
import 'package:to_do_app/home/search_bar_page.dart';
import 'package:to_do_app/home/today_focused.dart';
import 'package:to_do_app/widgets/app_text.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

String selectedCategory = ''; // For STATE
final List<String> todayTasks =[];
  String? selectedStatus;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: ThemeColor.background(context),
    //AppBar
          drawer: MyDrawer(
        onSelectStatus: (status) {
          setState(() {
            selectedStatus = status;
          });
        },),
             appBar: PreferredSize(
        preferredSize: const Size.fromHeight(190),
         child: AppBar(
          automaticallyImplyLeading: false, // we will add hamburger manually
            elevation: 0,
            backgroundColor:  ThemeColor.background(context),
            flexibleSpace: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                    Row(
                      children: [
                        Builder(
                         builder: (context) => IconButton(
                          icon:  Icon(Icons.menu, color: ThemeColor.icon(context)),
                         onPressed: () {
                         Scaffold.of(context).openDrawer();
                        },
                        ),
                        ),

                        const SizedBox(width: 12),
                        Expanded(child: SearchBarPage()),
                
                
                         const SizedBox(width: 12),
                         Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                           icon: const Icon (Icons.notifications),
                            onPressed: () {
                              
                            },
                            ),
                         )
                      ],
                    ),
                 const SizedBox(height: 20),
                AppText(text: "What's up 👋", fontSize: 18, fontWeight: FontWeight.bold, 
                color: ThemeColor.text(context)),
                const SizedBox(height: 10),
                AppText(text: 'Let’s plan your day',fontSize: 20, fontWeight: FontWeight.bold,  
                color: ThemeColor.text(context)),
                const SizedBox(height: 10),
                  ],
                ),
   

              ),
              
              ),
         
           ),
       ),
          
     //Body
        body: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color:  Theme.of(context).cardColor),    
               child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //scrollable categories
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryData.length,
                      itemBuilder: (context, index){
                        final category = categoryData[index];
                        final isSelected = selectedCategory == category.name;
                          return GestureDetector(
                          onTap:(){
                        }, //makes categories ClickAble and change the state 
                          
                          
                              child: Container(
                                width: 80,
                                margin: const EdgeInsets.symmetric(horizontal: 8), // space between items
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: isSelected
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context).dividerColor,
                                      child: Icon(category.icon,
                                      size:30, 
                                      color: Theme.of(context).iconTheme.color,
                                      ),
                                    ),
                                    const SizedBox( height:8),

                                    //Task number below icons
                                  AppText(text: category.tasknumber,
                                  fontSize: 12,
                                  color: Theme.of(context).iconTheme.color ?? Colors.white,
                                ),
                                const SizedBox(height:4),
                                //small linear progress bar below task number
                                LinearProgressIndicator(
                                  value: category.value,
                                  backgroundColor: Theme.of(context).dividerColor,
                                  color: Theme.of(context).colorScheme.primary,
                                )

                                  ],
                                ),
                                  
                              ),
                          
                         
                          );
                      },
                     ),
                  ),
                 const SizedBox( height: 30,),
                   OverviewSection(totalTasks: 3,
                    pendingTasks: 4,
                     completedTasks: 5,
                     ),
            
                    const SizedBox(height: 30),
                     TodayFocused(tasks: todayTasks),
            
                    ], 
                   ),
          ),
           ),   
          floatingActionButton: FloatingActionButton(
            backgroundColor:  Theme.of(context).colorScheme.primary,
            child: Icon(Icons.add,
            size:13,
            color: Theme.of(context).colorScheme.onPrimary),
            onPressed:(){
             showModalBottomSheet(
              context: context, 
              isScrollControlled: true, 
              builder: (context){
                return Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: AddTaskDialog(), 
                  );
              } 
              );
            } ),
    );
  }
}