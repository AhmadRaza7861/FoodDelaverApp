import 'package:foodapp1/ViewModel/main_vm/main_view_model.dart';
import 'package:foodapp1/firebase/get_reataurant_list.dart';
import 'package:foodapp1/model/restaurant_model.dart';

class MainViewModelImp implements MainViewModel
{
  @override
  Future<List<RestaurantModel>> DisplayRestaurantList() {
   return getRestaurantList();
  }

}