import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './imagesData.dart';

class ExerciseDetail extends StatelessWidget {
  final String exerciseName;
  final String imagePath;
  final String bodyPart;
  final String equipment;
  final String targetMuscle;
  final List<String> instructions;

  const ExerciseDetail({
    super.key,
    required this.exerciseName,
    required this.imagePath,
    required this.bodyPart,
    required this.equipment,
    required this.targetMuscle,
    required this.instructions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 30, left: 10, right: 10),
        // height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppBar(
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_outlined),
                  iconSize: 25,
                ),
              ),
              Text(
                exerciseName.isNotEmpty
                    ? exerciseName.toUpperCase()
                    : 'Exercise Name',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
              Container(
                height: Get.height * 0.5,
                child: Center(
                  child: imagePath.isNotEmpty
                      ? (imagePath.startsWith('assets/')
                          ? Image.asset(imagePath, fit: BoxFit.contain)
                          : Image.network(imagePath, fit: BoxFit.contain))
                      : Icon(Icons
                          .error), // Show an error icon if imagePath is empty
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Wrap(
                // mainAxisAlignment: MainAxisAlignment.center,
                alignment: WrapAlignment.start,

                children: [
                  if (bodyPartsImages.containsKey(bodyPart))
                    Container(
                      width: Get.width * 0.28,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Body Part',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage(bodyPartsImages[bodyPart]!),
                          ),
                          SizedBox(height: 5),
                          Container(
                              width: 120,
                              child: Text(
                                bodyPart.toUpperCase(),
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                              ))
                        ],
                      ),
                    ),
                  SizedBox(width: 12),
                  if (bodyPartsImages.containsKey(targetMuscle))
                    Container(
                      width: Get.width * 0.3,
                      child: Column(
                        children: [
                          Text('Target Muscle',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center),
                          SizedBox(
                            height: 12,
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage(bodyPartsImages[targetMuscle]!),
                          ),
                          SizedBox(height: 12),
                          Container(
                              width: 120,
                              child: Text(targetMuscle.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center))
                        ],
                      ),
                    ),
                  SizedBox(width: 12),
                  if (assistedEquipmentImages.containsKey(equipment))
                    Container(
                      width: Get.width * 0.3,
                      child: Column(
                        children: [
                          Text(
                            'Equipment',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage(assistedEquipmentImages[equipment]!),
                          ),
                          SizedBox(height: 5),
                          Container(
                              width: 120,
                              child: Text(equipment.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center))
                        ],
                      ),
                    )
                ],
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.only(left: 15),
                width: Get.width,
                child: Text(
                  '👨‍🏫Instructions',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 20),
              ...instructions.map((instruction) {
                return Container(
                  padding: EdgeInsets.all(5),
                  width: Get.width * 0.96,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Icon(Icons.arrow_forward_ios, size: 10),
                        ),
                        Expanded(
                          child: Text(
                            // style: TextStyle(/)
                            '$instruction',

                            softWrap: true,
                          ),
                        ),
                      ]),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
