import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:foodapp1/ViewModel/Restaurant_home_detail_vm/Restaurant_home_detail_vm_imp.dart';
import 'package:foodapp1/ViewModel/Restaurant_home_detail_vm/restaurant_home_detail_vm.dart';
import 'package:foodapp1/model/papular_item_model.dart';
import 'package:foodapp1/state/main_state_controller.dart';
import 'package:foodapp1/widgets/restaurant_home/best_deals_widget.dart';
import 'package:foodapp1/widgets/restaurant_home/most_papular__widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurantHomeDetail extends StatelessWidget {
  final ZoomDrawerController zoomDrawerController;

  RestaurantHomeDetail( this.zoomDrawerController);

  @override
  Widget build(BuildContext context) {
    MainStateController mainStateController = Get.find();
    RestaurantHomeDetailVmImp viewModel=RestaurantHomeDetailVmImp();
    final RestaurantHomeDetailViewModel restaurantHomeViewModel =
        RestaurantHomeDetailVmImp();
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "${mainStateController.SelectedRestaurant.value.name}",
              style: GoogleFonts.jetBrainsMono(
                fontWeight: FontWeight.w900,
                color: Colors.black45,
              ),
            ),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            iconTheme: IconThemeData(color: Colors.black),
            leading:InkWell(child: Icon(Icons.view_headline,),onTap: (){
              zoomDrawerController.toggle!();
            },),
          ),
          body: Container(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: MostPapularWidget(
                      restaurantHomeViewModel: restaurantHomeViewModel,
                      mainStateController: mainStateController),
                ),
                Expanded(
                    flex: 2,
                    child:BestDealsWidget(viewModel: viewModel, mainStateController: mainStateController)
                )
              ],
            ),
          )),
    );
  }
}


