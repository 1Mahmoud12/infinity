import 'dart:io';
import 'dart:ui';

import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/subjects.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationServiceRoutine {
  NotificationServiceRoutine();

  static FlutterLocalNotificationsPlugin localNotifications = FlutterLocalNotificationsPlugin();
  final BehaviorSubject<String> behaviorSubject = BehaviorSubject();

  Future<void> initializePlatformNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    final IOSInitializationSettings initializationSettingsIOS =
    IOSInitializationSettings(
        requestSoundPermission: true,
        requestBadgePermission: true,
        requestAlertPermission: true,
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    final InitializationSettings initializationSettings =
    InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await localNotifications.initialize(initializationSettings,
        onSelectNotification: selectNotification);
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation(
        await FlutterNativeTimezone.getLocalTimezone(),
      ),
    );



  }

  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    //print('id $id');
  }

  void selectNotification(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      behaviorSubject.add(payload);
    }
  }



  Future<NotificationDetails> notificationDetails() async {


    AndroidNotificationDetails androidPlatformChannelSpecifics =const AndroidNotificationDetails(
      'channel id',
      'channel name',
      groupKey: 'com.example.flutter_push_notifications',
      channelDescription: 'channel description',

      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      ticker: 'ticker',
      //largeIcon: const DrawableResourceAndroidBitmap('watch.png'),
      styleInformation: BigPictureStyleInformation(
        FilePathAndroidBitmap('gymTime.png'),
        hideExpandedLargeIcon: false,
      ),
      color:  Color(0xff2196f3),
    );

    IOSNotificationDetails iosNotificationDetails =const IOSNotificationDetails(
        threadIdentifier: "thread1",
        attachments: <IOSNotificationAttachment>[
          IOSNotificationAttachment('gymTime.png')
        ]);

      final details = await localNotifications.getNotificationAppLaunchDetails();
    if (details != null && details.didNotificationLaunchApp) {
      behaviorSubject.add(details.payload!);
    }
    NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iosNotificationDetails);

    return platformChannelSpecifics;
  }

  Future<void> showLocalNotification({
    required int id,
    required String title,
    required String body,
    required String payload,
  }) async {
    final platformChannelSpecifics = await notificationDetails();
    await localNotifications.show(
      id,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  Future<void> showScheduledLocalNotification({
    required int id,
    required String title,
    required String body,
    required String payload,
    required  int year,
    required  int month,
    required  int day,
    required  int hour,
    required  int minute,

  }) async {
     // print(DateTime(year,month,day,hour,minute,1));
      //print(DateTime(year,month,day,hour,minute,1).toUtc());
    final platformChannelSpecifics = await notificationDetails();
    await localNotifications.zonedSchedule(
      id,
      title,
      body,
     // tz.TZDateTime.now(tz.local).add(Duration(days:day,hours:hour ,minutes: minute,seconds: 1)),
      tz.TZDateTime.from(DateTime(year,month,day,hour,minute),tz.local),
      platformChannelSpecifics,
      payload: payload,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      //matchDateTimeComponents: DateTimeComponents.time,
      androidAllowWhileIdle: true,
    );
  }

   cancelAll() => localNotifications.cancelAll();
   cancel(int id)=>localNotifications.cancel(id);

}

class DownloadUtil {
  static Future<String> downloadAndSaveFile(String url, String fileName) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/$fileName.png';
    final http.Response response = await http.get(Uri.parse(url));
    final File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }
}