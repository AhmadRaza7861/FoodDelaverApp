import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:foodapp1/const/const.dart';
import 'package:foodapp1/model/papular_item_model.dart';

Future<List<PapularItemModel>>getBestDealByRestaurantId(String restaurant_id) async
{
  List<PapularItemModel> lst=new List<PapularItemModel>.empty(growable: true);
  DataSnapshot source=await FirebaseDatabase.instance.reference().child(RESTAURANT_REF).child(restaurant_id)
  .child(BESTDEALS_REF).once();
  Map<dynamic,dynamic> values=source.value;
  PapularItemModel ? papulatItemModel;
  values.forEach((key, value) {
    papulatItemModel=PapularItemModel.fromJsom(jsonDecode(jsonEncode(value)));
    lst.add(papulatItemModel!);
  });
  return lst;


}