import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_app/Pages/Exercise.dart';
import 'package:gym_app/Pages/TypePage.dart';

class GridItemCard extends StatelessWidget {
  final String imagePath;
  final String label;
  final double? height; // Change to double
  final double? width; // Change to double
  final pagePath;

  const GridItemCard(
      {super.key,
      required this.imagePath,
      required this.label,
      this.height,
      this.width,
      this.pagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (pagePath == 'body parts') {
          Get.to(TypesPage(
            type: 'BODY PARTS',
          ));
        } else if (pagePath == 'types') {
          Get.to(TypesPage(
            type: 'EQUIMENTS',
          ));
        } else {
          Get.to(ExercisesPage(
            pageHeading: label,
          ));
        }
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(5.0),
        width: width ?? 150, // Use null-aware operator for width
        height: height ?? 150, // Use null-aware operator for height
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.contain,
              height: 50, // Adjust height of the image
              width: 50, // Adjust width of the image
            ),
            SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                letterSpacing: 2,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
