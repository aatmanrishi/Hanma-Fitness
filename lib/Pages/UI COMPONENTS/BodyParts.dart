import 'package:flutter/material.dart';
import 'package:gym_app/Pages/UI%20COMPONENTS/GridItemCard.dart';

class BodyParts extends StatelessWidget {
  const BodyParts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Wrap(
          spacing: 10, // Space between items
          runSpacing: 10, // Space between lines
          alignment: WrapAlignment.center,
          children: [
            GridItemCard(
                imagePath: 'assets/images/animebody.png',
                label: 'BODY',
                pagePath: 'body parts'),
            GridItemCard(
                imagePath: 'assets/images/gym_dumbell.png',
                label: 'ACCESSORIES',
                pagePath: 'types'),
          ],
        ),
      ),
    );
  }
}
