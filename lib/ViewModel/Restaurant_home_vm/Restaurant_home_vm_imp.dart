import 'package:foodapp1/ViewModel/Restaurant_home_vm/restaurant_home_vm.dart';
import 'package:foodapp1/firebase/best_deals_referance.dart';
import 'package:foodapp1/firebase/papular_ref.dart';
import 'package:foodapp1/model/papular_item_model.dart';
import 'package:foodapp1/model/restaurant_model.dart';

class RestaurantHomeVmImp implements RestaurantHomeViewModel
{
  @override
  Future<List<PapularItemModel>> DisplayPapularItemModel(String restaurantId) {
    // TODO: implement DisplayPapularItemModel
   return getMostPapularByRestaurantId(restaurantId);
  }

  @override
  Future<List<PapularItemModel>> displayBestDealByRestaurantId(String restaurantId) {
    // TODO: implement displayBestDealByRestaurantId
    return getBestDealByRestaurantId(restaurantId);
  }
}