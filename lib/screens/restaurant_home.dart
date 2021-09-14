import 'package:flutter/material.dart';
import 'package:foodapp1/Strings/restaurant_home_string.dart';
import 'package:foodapp1/ViewModel/Restaurant_home_vm/Restaurant_home_vm_imp.dart';
import 'package:foodapp1/ViewModel/Restaurant_home_vm/restaurant_home_vm.dart';
import 'package:foodapp1/model/papular_item_model.dart';
import 'package:foodapp1/state/main_state_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class RestaurantHome extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
   MainStateController mainStateController=Get.find();
   final RestaurantHomeViewModel restaurantHomeViewModel=RestaurantHomeVmImp();
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
title: Text("${mainStateController.SelectedRestaurant.value.name}"),
        ),
        body:Container(
          child:Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  child: FutureBuilder(
                    future: restaurantHomeViewModel.DisplayPapularItemModel(mainStateController.SelectedRestaurant.value.restaurant_id),
                    builder: (context,snapshot)
                    {
                      if(snapshot.connectionState==ConnectionState.waiting)
                        {
                          return Center(child: CircularProgressIndicator(),);
                        }
                      else
                        {
                          var data=snapshot.data as List<PapularItemModel>;

                            return Column(
                              children: [
                                Text("${mostpopularText}",
                                style: GoogleFonts.jetBrainsMono(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 24,
                                  color: Colors.black45
                                ),
                                ),
                                Text("${data.length}")
                              ],
                            );
                        }
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                  child: Container(
                decoration: BoxDecoration(
                  color: Colors.amberAccent
                ),
              ))
            ],
          ) ,
        )
      ),
    );
  }

}