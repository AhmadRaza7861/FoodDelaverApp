import 'package:flutter/material.dart';
import 'package:foodapp1/model/restaurant_model.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurantNameAndAddress extends StatelessWidget {
  const RestaurantNameAndAddress({
    Key? key,
    required this.lst,required this.index
  }) : super(key: key);

  final List<RestaurantModel> lst;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(8),
        width: double.infinity,
        child: Column(
          children: [
            Text("${lst[index].name}",
              style: GoogleFonts.jetBrainsMono(
                fontWeight: FontWeight.w900,
              ),
            ),
            Text("${lst[index].address}",
              style: GoogleFonts.jetBrainsMono(
                  fontWeight: FontWeight.w900,
                  fontSize: 12
              ),
            )

          ],
        ),
      ),
    );
  }
}