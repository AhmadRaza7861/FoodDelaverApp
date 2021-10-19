
import 'package:foodapp1/model/category_model.dart';

abstract class CategoryViewModel {
  Future<List<CategoryModel>> displayCategoryByRestaurantId(
      String restaurantID);
}