import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHandler
{
  static final flutterLocalNotificationPlugin=
      FlutterLocalNotificationsPlugin();
  static late BuildContext myContext;
  static void initNotification(BuildContext context)
  {
    myContext=context;
    var initAndroid=AndroidInitializationSettings("@mipmap/ic_launcher");
    var initIOS=IOSInitializationSettings(
      onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    var initsetting=InitializationSettings(android: initAndroid,
    iOS: initIOS);
    flutterLocalNotificationPlugin.initialize(initsetting,onSelectNotification: onSelectNotification);

  }
// static Future onDidReceiveLocalNotification(
//     init,id,String title,String body,String payload) async{}

  static Future onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload)async {
    showDialog(context: myContext, builder: (context)=>CupertinoAlertDialog(
      title: Text(title!),
      content: Text(body!),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          child: Text("ok"),
          onPressed: ()=>Navigator.of(context,rootNavigator: true).pop(),
        )
      ],

    ));
  }

  static Future onSelectNotification(String? payload)async {
    if(payload!=null) print("Get payload:$payload");
  }
}