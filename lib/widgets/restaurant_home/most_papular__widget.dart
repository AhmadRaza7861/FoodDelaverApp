import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:foodapp1/Strings/restaurant_home_string.dart';
import 'package:foodapp1/ViewModel/Restaurant_home_vm/restaurant_home_vm.dart';
import 'package:foodapp1/model/papular_item_model.dart';
import 'package:foodapp1/state/main_state_controller.dart';
import 'package:foodapp1/widgets/common/common_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class MostPapularWidget extends StatelessWidget {
  const MostPapularWidget({
    Key? key,
    required this.restaurantHomeViewModel,
    required this.mainStateController,
  }) : super(key: key);

  final RestaurantHomeViewModel restaurantHomeViewModel;
  final MainStateController mainStateController;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                   Expanded(child:LiveList(
                     itemCount: data.length,
                     scrollDirection: Axis.horizontal,
                     showItemInterval: Duration(milliseconds: 150),
                     reAnimateOnVisibility: true,
                     showItemDuration: Duration(milliseconds: 350),
                     itemBuilder: AnimationItemBuilder((index)=>
                  Container(

                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(data[index].image),
                          maxRadius: 55,
                          minRadius: 55,
                        ),
                        SizedBox(height: 10,),
                        Text("${data[index].name}",
                        style: GoogleFonts.jetBrainsMono(),
                        )
                      ],
                    ),
                    padding: EdgeInsets.all(8),
                  )
                     ),
                   ))
                  ],
                );
            }
        },
      ),
    );
  }
}