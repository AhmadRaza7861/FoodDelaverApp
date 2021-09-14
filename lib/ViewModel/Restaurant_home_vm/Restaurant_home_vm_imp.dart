import 'package:foodapp1/ViewModel/Restaurant_home_vm/restaurant_home_vm.dart';
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
}