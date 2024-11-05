import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './imagesData.dart';
import 'package:gym_app/Pages/UI COMPONENTS/GridItemCard.dart';
import 'package:gym_app/controller.dart/mainController.dart';

class TypesPage extends StatelessWidget {
  final String type;

  const TypesPage({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final MainController controller = Get.find<MainController>();

    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppBar(
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_outlined),
                  iconSize: 25,
                ),
                title: Text(
                  type,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
                titleSpacing: 5,
                leadingWidth: 40,
              ),
              // Obx for CircularProgressIndicator
              Obx(() {
                return controller.loader.value
                    ? Center(child: CircularProgressIndicator())
                    : SizedBox.shrink(); // Use SizedBox.shrink() when not loading
              }),
              // Obx for the content inside the Wrap widget
              Obx(() {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: type == 'BODY PARTS'
                        ? controller.allBodyParts.map((bodyPart) {
                            final imagePath = bodyPartsImages[bodyPart];
                            return imagePath != null
                                ? GridItemCard(
                                    imagePath: imagePath,
                                    label: bodyPart,
                                  )
                                : SizedBox.shrink(); // Skip item if no image
                          }).toList()
                        : controller.equipments.map((equipment) {
                            final imagePath =
                                assistedEquipmentImages[equipment];
                            return imagePath != null
                                ? GridItemCard(
                                    imagePath: imagePath,
                                    label: equipment,
                                  )
                                : SizedBox.shrink(); // Skip item if no image
                          }).toList(),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
