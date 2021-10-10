import 'package:flutter/material.dart';
import 'package:foodapp1/Strings/restaurant_home_string.dart';
import 'package:google_fonts/google_fonts.dart';
class CategoriesMenuWidget extends StatelessWidget {
  final String menuName;
  final VoidCallback callback;
  final IconData icon;
  const CategoriesMenuWidget({
    Key? key,
    required this.menuName,
    required this.callback,
    required this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(
              width: 30,
            ),
            Text(
              menuName,
              style: GoogleFonts.jetBrainsMono(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
            )
          ],
        ),
      ),
    );
  }
}