import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:foodapp1/screens/menu.dart';
import 'package:foodapp1/screens/restaurant_home_detail.dart';
class RestaurantHome extends StatelessWidget {
  RestaurantHome({Key? key}) : super(key: key);
  final zoomDrawerController=ZoomDrawerController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: ZoomDrawer(
        controller: zoomDrawerController,
        style: DrawerStyle.DefaultStyle,
        menuScreen: MenuScreen(zoomDrawerController: zoomDrawerController),
        mainScreen: RestaurantHomeDetail(zoomDrawerController),
        borderRadius: 24.0,
        showShadow: true,
        angle: -12.0,
        backgroundColor:Colors.grey,
        slideWidth: MediaQuery.of(context).size.width*.65,
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.bounceIn,
      ),
    ));
  }
}
