import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:foodapp1/Strings/restaurant_home_string.dart';
import 'package:foodapp1/ViewModel/menu_vm/menu_viewmodel_imp.dart';
import 'package:foodapp1/const/const.dart';
import 'package:foodapp1/widgets/Manu/category_menu_widget.dart';
import 'package:foodapp1/widgets/Manu/home_menu_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuScreen extends StatelessWidget {
  final ZoomDrawerController zoomDrawerController;
  final viewModel=MenuViewModelImp();

  MenuScreen({required this.zoomDrawerController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(COLOR_MENU_BG),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                DrawerHeader(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 40),
                          child: CircleAvatar(
                              maxRadius: 40,
                              backgroundColor: Color(COLOR_ICON_DRAWER),
                              child: Icon(
                                Icons.restaurant,
                                color: Colors.white,
                                size: 40,
                              )),
                        )
                      ],
                    ))
              ],
            ),
            Divider(
              thickness: 1,
            ),
           HomeMenuWidget(zoomDrawerController: zoomDrawerController),
            Divider(
              thickness: 1,
            ),
           CategoriesMenuWidget(icon: Icons.list,menuName: categoriesText,callback: viewModel.NavigateCategories,),
          ],
        ),
      ),
    );
  }
}



