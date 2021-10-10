import 'package:flutter/material.dart';
import 'package:foodapp1/Strings/restaurant_home_string.dart';
import 'package:google_fonts/google_fonts.dart';
class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
    );
  }
}
