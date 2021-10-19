import 'package:flutter/material.dart';
import 'package:foodapp1/Strings/restaurant_home_string.dart';
import 'package:foodapp1/ViewModel/category_vm/category_vm_imp.dart';
import 'package:foodapp1/model/category_model.dart';
import 'package:foodapp1/state/main_state_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final  viewModel=CategoryViewModelImp();
  final MainStateController mainStateController=Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoriesText,style: GoogleFonts.jetBrainsMono(color: Colors.black),),
        elevation: 10,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: FutureBuilder(
        future: viewModel.displayCategoryByRestaurantId(mainStateController.SelectedRestaurant.value.restaurant_id),
        builder: (context,snapshot)
        {
          if(snapshot.connectionState==ConnectionState.waiting)
            {
              return Center(child: CircularProgressIndicator(),);
            }
          else
            {
              var lst=snapshot.data as List<CategoryModel>;
              return Text("${lst.length}");
            }
        },

        ),
    );
  }
}
