import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:foodapp1/ViewModel/Restaurant_home_vm/Restaurant_home_vm_imp.dart';
import 'package:foodapp1/model/papular_item_model.dart';
import 'package:foodapp1/state/main_state_controller.dart';
import 'package:google_fonts/google_fonts.dart';
class BestDealsWidget extends StatelessWidget {
  const BestDealsWidget({
    Key? key,
    required this.viewModel,
    required this.mainStateController,
  }) : super(key: key);

  final RestaurantHomeVmImp viewModel;
  final MainStateController mainStateController;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:viewModel.displayBestDealByRestaurantId(mainStateController.SelectedRestaurant.value.restaurant_id),
      builder: (context,snapshot)
      {
        if(snapshot.connectionState==ConnectionState.waiting)
        {
          return Center(child: CircularProgressIndicator(),);
        }
        else
        {
          var lstBestDeal=snapshot.data as List<PapularItemModel>;
          return CarouselSlider(items:lstBestDeal.map((e) =>Builder(builder: (BuildContext context)
          {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  semanticContainer: true,
                  child:Stack(
                    fit: StackFit.expand,
                    children: [
                      ImageFiltered(imageFilter:ImageFilter.blur(
                          sigmaX: 5,sigmaY: 5
                      ),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: "${e.image}",
                          errorWidget:(context,url,error)=>
                              Center(
                                child: Icon(Icons.image),
                              ),
                          progressIndicatorBuilder: (context,url,downloadProgress)
                          {
                            return Center(child: CircularProgressIndicator(),);
                          },
                        ),
                      ),
                      Center(
                        child: Text("${e.name}",
                          style: GoogleFonts.jetBrainsMono(
                            color: Colors.white,
                            fontSize: 18,
                          ),),
                      )
                    ],
                  )
              ),
            );
          },)).toList() , options:
          CarouselOptions(
              autoPlay: true,
              autoPlayAnimationDuration: Duration(seconds: 3),
              autoPlayCurve:Curves.easeIn,
              height: double.infinity,
          ) );
        }
      },
    );
  }
}