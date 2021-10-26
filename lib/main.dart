import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

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

class MyHomePage extends StatefulWidget
{
  String title;
  FirebaseApp app;

  MyHomePage({required this.title,required this.app});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 List<ImageItem> data=[];
//  List<String>data=["sss","ssss","llll","sss","ssss","llll","sss","ssss","llll","sss","ssss","llll","sss","ssss","llll",
//    "sss","ssss","llll","sss","ssss","llll","sss","ssss","llll","sss","ssss","llll","sss","ssss","llll","sss","ssss","llll",
//    "sss","ssss","llll","sss","ssss","llll","sss","ssss","llll","sss","ssss","llll","sss","ssss","llll","sss","ssss","llll",
//    "sss","ssss","llll","sss","ssss","llll","sss","ssss","llll",];
  int currentLength=0;
  final int increment=10;
  bool isLoading=false;
  @override
  void initState() {
    // TODO: implement initState
    _loadMore();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Lazy Loading"),),
      body: LazyLoadScrollView(
        isLoading: isLoading,
        onEndOfPage: ()=>_loadMore(),
        child: ListView.builder(
          itemCount: currentLength,
          //data.length,
            itemBuilder: (context,position)
        {
          if(isLoading && position==data.length -1)  //add circle progress to last item
            return Center(child: CircularProgressIndicator(),);
          else
            return
            // Text("{data[position]}${position}");
              DisplayCartItem(data:data[position]);

        }),
      )
    );
  }

  Future _loadMore() async{
    print("CONTROLL ENTER${currentLength}");
    setState(() {
      isLoading=true;
    });

    //Delay
    await Future.delayed(Duration(seconds: 2));
    for(var i=currentLength;i<=currentLength +increment;i++)
      if(i%2==0)
        {
          data.add(new ImageItem("Image $i", "https://firebasestorage.googleapis.com/v0/b/fooditem-487a7.appspot.com/o/images%2F143f3a0b-e73b-4201-9274-891bf862409a?alt=media&token=3d877e54-6fd7-41ac-bf3a-11f1d72204dc"));
        }
    else
      {
        data.add(new ImageItem("Image $i", "https://firebasestorage.googleapis.com/v0/b/fooditem-487a7.appspot.com/o/images%2Ffee894fa-0cf9-4805-a271-3fed25c9635d?alt=media&token=a97ca91f-25aa-497a-aed1-4b90310c6337"));
      }
    setState(() {
      currentLength=currentLength +2 ;
      isLoading=false;

     // currentLength=data.length;
    });

  }

  // Widget DisplayCartItem(ImageItem data) {
  //   return Card(
  //     margin: const EdgeInsets.all(8.0),
  //     child: Padding(padding: const EdgeInsets.only(top: 20),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children:<Widget> [
  //         Container(
  //           margin: EdgeInsets.only(bottom: 10),
  //           child: Text(data.content,
  //           style: TextStyle(
  //             fontSize: 20.0,
  //             fontWeight: FontWeight.bold,
  //           ),
  //             textAlign: TextAlign.center,
  //           ),
  //         ),
  //         Container(
  //           child: Stack(
  //             children: [
  //               Image.network(data.image_url)
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //     ),
  //   );
  // }
}
class ImageItem{
  final String content;
  final String image_url;

  ImageItem( this.content,  this.image_url);

}

class DisplayCartItem extends StatelessWidget {
  final ImageItem data;
  const DisplayCartItem({Key? key,required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(padding: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(data.content,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: Stack(
                children: [
                  Image.network(data.image_url)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
