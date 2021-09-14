import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:foodapp1/const/const.dart';
import 'package:foodapp1/model/papular_item_model.dart';

Future<List<PapularItemModel>>getMostPapularByRestaurantId(String restaurantId) async
{
  List<PapularItemModel> lst=new List<PapularItemModel>.empty(growable: true);
  DataSnapshot source=await FirebaseDatabase.instance.reference().child(RESTAURANT_REF)
  .child(restaurantId).child(MOSTPAPULAR_REF).once();
  Map<dynamic,dynamic> values=source.value;
  values.forEach((key, value) {
    lst.add(PapularItemModel.fromJsom(jsonDecode(jsonEncode(value))));
  });
  return lst;
}