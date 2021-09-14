import 'package:foodapp1/model/restaurant_model.dart';
import 'package:get/get.dart';

class MainStateController extends GetxController {
  var SelectedRestaurant = RestaurantModel(
      address: "address",
      imageUrl: "imageUrl",
      name: "name",
      paymentUrl: "paymentUrl",
      phone: "phone").obs;
}
