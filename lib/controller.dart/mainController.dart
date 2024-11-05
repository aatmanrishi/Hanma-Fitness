import 'dart:convert';
import 'package:get/get.dart';
import 'package:gym_app/controller.dart/Model/contentModel.dart';
import 'package:gym_app/controller.dart/initialControllers.dart/TypesController.dart';
import 'package:gym_app/controller.dart/initialControllers.dart/bodyPartsConroller.dart';
import 'package:gym_app/controller.dart/initialControllers.dart/targetList.controller.dart';
import 'package:http/http.dart' as http;

class MainController extends GetxController {
  RxBool loader = false.obs;
  RxList<dynamic> bodyParts = <dynamic>[].obs; // Specify type if known
  RxList<dynamic> targetMuscles = <dynamic>[].obs; // Specify type if known
  RxList<dynamic> equipments = <dynamic>[].obs; // Specify type if known
  RxList<dynamic> allBodyParts = <dynamic>[].obs; // Specify type if known
  RxList<dynamic> searchListData = <dynamic>[].obs; // Specify type if known

  // Updated contentListData to be a list of ContentModel
  RxList<ContentModel> contentListData = <ContentModel>[].obs;

  RxString contentHeading = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    await loadInitialData();
  }

  Future<void> loadInitialData() async {
    loader.value = true; // Set loader to true while fetching data
    try {
      bodyParts.value = await fetchBodyPartList();
      targetMuscles.value = await fetchTargetList();
      equipments.value = await fetchEquipmentList();

      if (bodyParts.isNotEmpty &&
          targetMuscles.isNotEmpty &&
          equipments.isNotEmpty) {
        searchListData.addAll(bodyParts);
        searchListData.addAll(targetMuscles);
        searchListData.addAll(equipments);
        allBodyParts.addAll(bodyParts);
        allBodyParts.addAll(targetMuscles);
        print(allBodyParts);
      }
    } catch (e) {
      print('Error loading data: $e'); // Handle errors as necessary
    } finally {
      loader.value = false; // Set loader to false after data fetch
    }
  }

  Future<void> loadMainContent(String contentHeading) async {
    loader.value = true;
    List<ContentModel> contentList = [];
    contentListData.clear();
    try {
      String url;

      if (bodyParts.contains(contentHeading)) {
        url =
            'https://exercisedb.p.rapidapi.com/exercises/bodyPart/$contentHeading?limit=10&offset=0';
      } else if (targetMuscles.contains(contentHeading)) {
        url =
            'https://exercisedb.p.rapidapi.com/exercises/target/$contentHeading?limit=10&offset=0';
      } else {
        url =
            'https://exercisedb.p.rapidapi.com/exercises/equipment/$contentHeading?limit=10&offset=0';
      }

      final response = await http.get(Uri.parse(url), headers: {
        'x-rapidapi-host': 'exercisedb.p.rapidapi.com',
        'x-rapidapi-key':
            'f592e2f097msh4d63e33559c0b83p163512jsncaf7d36f5840', // Original API key
        'Content-Type': 'application/json'
      });

      if (response.statusCode == 200) {
        List<dynamic> decodedData = jsonDecode(response.body);
        contentList =
            decodedData.map((item) => ContentModel.fromJson(item)).toList();

        contentListData.addAll(contentList);
        print(contentList); // Example action: print the content list
      } else {
        print('Error fetching data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
      loader.value = false;
    } finally {
      loader.value = false;
    }
  }
}
