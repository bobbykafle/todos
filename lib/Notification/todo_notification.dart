import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;



class TodoNotificationService {
  static final _plugin = FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    await _plugin.initialize(
      const InitializationSettings(android: android),
    );
  }

  static Future<void> scheduleTodo({
    required int id,
    required String title,
    required DateTime time,
  }) async {
  //converting tz.TZDateTime
tz.TZDateTime scheduledDate = tz.TZDateTime.from(time, tz.local);

//Date for Future
if (scheduledDate.isBefore(tz.TZDateTime.now(tz.local))) {
      scheduledDate = scheduledDate.add(const Duration(seconds:5));
     
    }

    await _plugin.zonedSchedule(
      id,
      'Todo Reminder',
      title,
      scheduledDate,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'todo_channel',
          'Todo Reminder',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    

      
    );

    
  }

  //add method to cancel notification
  static Future <void> cancel(int id)async{
    await _plugin.cancel(id);
  }
}
