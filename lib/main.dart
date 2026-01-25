
import 'package:firebase_auth/firebase_auth.dart' hide AuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Notification/notification_services.dart';
import 'package:to_do_app/Notification/todo_notification.dart';
import 'package:to_do_app/Remove/task_providr.dart';
import 'package:to_do_app/authentication/auth_provider.dart' show AuthProvider;
import 'package:to_do_app/home.dart';
import 'package:to_do_app/login.dart';
import 'package:to_do_app/ThemeChange/theme_chenge.dart';
import 'package:timezone/data/latest.dart' as tz;




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  await Firebase.initializeApp();
  NotificationServices notificationServices = NotificationServices();
  await notificationServices.init();
  await TodoNotificationService.init();
 
  runApp(
    
    MultiProvider(
      providers: [ 
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChenge()),
        ChangeNotifierProvider(create: (_) => TaskProvider()),
   

    
    ],
     
         child:  MyApp(),
    ),
  
     );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  Consumer<ThemeChenge>(builder:(context, themeProvider, child){

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TO DO APP',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeProvider.themeMode,
      home:  StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(snapshot.data != null){
            return  MyHomePage();
          }
          return  Login();
  }),
    );
    }
    );
  }
}
