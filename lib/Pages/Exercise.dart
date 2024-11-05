import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_app/Pages/ExerciseDetail.dart';
import 'package:gym_app/controller.dart/mainController.dart';

class ExercisesPage extends StatelessWidget {
  final String? pageHeading;

  const ExercisesPage({super.key, this.pageHeading});

  @override
  Widget build(BuildContext context) {
    final MainController mainController = Get.find<MainController>();

    // Set content heading
    mainController.contentHeading.value = pageHeading.toString();
    // Load main content
    mainController.loadMainContent(mainController.contentHeading.value);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 30),
        width: Get.width,
        height: Get.height,
        child: SingleChildScrollView(
          child: Column(
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
                  pageHeading ?? 'Default Heading',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
                titleSpacing: 5,
                leadingWidth: 40,
              ),
              Obx(() {
                // Display CircularProgressIndicator if loading
                if (mainController.loader.value) {
                  return Center(child: CircularProgressIndicator());
                }
                // Return an empty container while loading
                return Container();
              }),
              Obx(() {
                // Display content once loaded
                if (!mainController.loader.value) {
                  return Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: mainController.contentListData.map((content) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(ExerciseDetail(
                            exerciseName: content.name.toString(),
                            imagePath: content.gifUrl.toString(),
                            bodyPart: content.bodyPart.toString(),
                            equipment: content.equipment.toString(),
                            targetMuscle: content.target.toString(),
                            instructions: content.instructions ?? [],
                          ));
                        },
                        child: Card(
                          child: Container(
                            width: 180,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Image.network(
                                      '${content.gifUrl}',
                                      height: 130,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    trimString(content.name ?? ''),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                }
                // Return an empty container if no data
                return Container();
              }),
            ],
          ),
        ),
      ),
    );
  }

  String trimString(String input) {
    List<String> words = input.split(' ');
    return words.length > 7 ? words.take(7).join(' ') + '...' : input;
  }
}
