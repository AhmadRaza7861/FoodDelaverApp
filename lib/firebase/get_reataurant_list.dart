import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:foodapp1/const/const.dart';
import 'package:foodapp1/model/restaurant_model.dart';

Future<List<RestaurantModel>> getRestaurantList() async
{
  List<RestaurantModel> list=new List<RestaurantModel>.empty(growable: true);
  DataSnapshot source=await FirebaseDatabase.instance.reference().child(RESTAURANT_REF).once();
  Map<dynamic,dynamic> values=source.value;
  RestaurantModel ? restaurantModel;
  values.forEach((key, value) {
 restaurantModel =RestaurantModel.fromJson(jsonDecode(jsonEncode(value)));
 restaurantModel!.restaurant_id=key;
    list.add(restaurantModel!);

  });
  return list;
}