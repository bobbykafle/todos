import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationServices{
  FirebaseMessaging messaging = FirebaseMessaging.instance;
 
Future<void> init() async{
  await requestNotificationPremission();

}

 Future<void> requestNotificationPremission() async{
    NotificationSettings settings = await messaging.requestPermission(
     alert: true,
     announcement: true,
     badge:  true,
     carPlay:  true,
     criticalAlert: true,
     provisional: true,
     sound: true,
    );

if(settings.authorizationStatus == AuthorizationStatus.authorized){
  print("User granted premission");
}else if(settings.authorizationStatus == AuthorizationStatus.provisional){
  print('User granted provisional permissio');
}else{
  AppSettings.openAppSettings();
  print('User denial permission');
}

  }


  /*Future<String> getDeviceToken() async{
    String? token = await messaging.getToken();
    return token!;
  }

  void isTokenRefresh() async{
     messaging.onTokenRefresh.listen((event){
      event.toString();
      print('refresh');
     });
  }*/
}