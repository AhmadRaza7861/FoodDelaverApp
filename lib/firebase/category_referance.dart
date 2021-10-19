import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:foodapp1/const/const.dart';
import 'package:foodapp1/model/category_model.dart';

Future<List<CategoryModel>> getCategoryByRestaurantId(String restaurantId)async
{
  print("Controll Enter  ${restaurantId}");
  List<CategoryModel> list= List<CategoryModel>.empty(growable: true);
  var source=await FirebaseDatabase.instance.reference().child(RESTAURANT_REF).child(restaurantId)
.child(CATEGORY_REF).once();
  Map<dynamic,dynamic> values=source.value;

  values.forEach((key, value) {
    print("Controll Enter Soyrce ${value}");
    list.add(CategoryModel.formJson(jsonDecode(jsonEncode(value))));
  });
  print("LIST LENGTH ${list.length}");
  return list;
}