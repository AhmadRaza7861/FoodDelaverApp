import 'package:foodapp1/ViewModel/menu_vm/menu_viewmodel.dart';
import 'package:foodapp1/screens/category.dart';
import 'package:get/get.dart';

class MenuViewModelImp implements MenuviewModel
{
  @override
  void NavigateCategories() {
   Get.to(()=>CategoryScreen());
  }


}