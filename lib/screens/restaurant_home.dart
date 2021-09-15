import 'package:flutter/material.dart';
import 'package:foodapp1/ViewModel/Restaurant_home_vm/Restaurant_home_vm_imp.dart';
import 'package:foodapp1/ViewModel/Restaurant_home_vm/restaurant_home_vm.dart';
import 'package:foodapp1/state/main_state_controller.dart';
import 'package:foodapp1/widgets/restaurant_home/most_papular__widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurantHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MainStateController mainStateController = Get.find();
    final RestaurantHomeViewModel restaurantHomeViewModel =
        RestaurantHomeVmImp();
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
                    child: Container(
                      decoration: BoxDecoration(color: Colors.amberAccent),
                    ))
              ],
            ),
          )),
    );
  }
}
