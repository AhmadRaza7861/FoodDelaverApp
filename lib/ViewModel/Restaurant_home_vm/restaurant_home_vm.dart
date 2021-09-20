import 'package:foodapp1/ViewModel/main_vm/main_view_model.dart';
import 'package:foodapp1/model/papular_item_model.dart';

abstract class RestaurantHomeViewModel
{
  Future<List<PapularItemModel>>DisplayPapularItemModel(String restaurantId);
  Future<List<PapularItemModel>>displayBestDealByRestaurantId(String restaurantId);
}