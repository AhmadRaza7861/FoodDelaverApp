import 'package:firebase_database/firebase_database.dart';
import 'package:foodapp1/const/const.dart';
import 'package:foodapp1/model/category_model.dart';

Future<List<CategoryModel>> getCategoryByRestaurantId(String restaurantId)async
{
  List<CategoryModel> list= List<CategoryModel>.empty(growable: true);
  var source=await FirebaseDatabase.instance.reference().child(RESTAURANT_REF).child(restaurantId)
.child(CATEGORY_REF).once();
  Map<String,dynamic> values=source.value;
  values.forEach((key, value) {
    list.add(CategoryModel.formJson(values));
  });
  return list;
}