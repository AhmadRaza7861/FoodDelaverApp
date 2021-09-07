import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app=await Firebase.initializeApp();

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

class MyHomePage extends StatelessWidget
{
  String title;
  FirebaseApp app;

  MyHomePage({required this.title,required this.app});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Text("${app.name}"),
    );
  }

}
