
import 'package:foodapp1/model/restaurant_model.dart';

abstract class MainViewModel
{
  Future<List<RestaurantModel>> DisplayRestaurantList();
}