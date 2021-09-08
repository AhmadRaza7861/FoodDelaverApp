
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:foodapp1/firebase_notification_handler.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app=await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_backgroundHandler);

  runApp(MyApp(app: app,));
}

class MyApp extends StatelessWidget {
  FirebaseApp app;

  MyApp({required this.app}); // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page',app: app,),
    );
  }
}

class MyHomePage extends StatefulWidget {
String title;
FirebaseApp app;

  MyHomePage({required this.title, required this.app});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseNotificatons firebaseNotificatons=new FirebaseNotificatons();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      firebaseNotificatons.setupFirebase(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("CLOUD MESSAGING"),),
    );
  }
}

Future<void> _backgroundHandler(RemoteMessage message) async{
  await Firebase.initializeApp();
  print("Handle background service $message");
  dynamic data=message.data['data'];
  FirebaseNotificatons.showNotification(data['title'], data['body']);
}
