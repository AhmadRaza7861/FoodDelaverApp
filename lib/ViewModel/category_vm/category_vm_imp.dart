import 'package:foodapp1/ViewModel/category_vm/category_vm.dart';
import 'package:foodapp1/firebase/category_referance.dart';
import 'package:foodapp1/model/category_model.dart';

class CategoryViewModelImp implements CategoryViewModel
{
  @override
  Future<List<CategoryModel>> displayCategoryByRestaurantId(String restaurantID) {
    // TODO: implement displayCategoryByRestaurantId
    return getCategoryByRestaurantId(restaurantID);
  }

}