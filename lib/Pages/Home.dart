import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_app/Pages/UI%20COMPONENTS/BodyParts.dart';

import 'UI COMPONENTS/CustomSearchBar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: Get.width,
          height: Get.height,
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/background_Images/yujiro.jpeg'))),
                  height: 400,
                  child: Stack(
                    children: [
                      // Positioned(
                      //     // left: 5,
                      //     bottom: 11,
                      //     child: Image.asset(
                      //       height: 280,
                      //       'assets/background_Images/yujiro.png',
                      //       fit: BoxFit.contain,
                      //     )),
                      Positioned(
                          left: 5,
                          bottom: 11,
                          child: Image.asset(
                            height: 280,
                            'assets/background_Images/baki.png',
                            fit: BoxFit.contain,
                          )),
                      Positioned(
                          right: 5,
                          bottom: 11,
                          child: Image.asset(
                            'assets/background_Images/jack.webp',
                            height: 280,
                          )),
                      Positioned(
                          bottom: 10,
                          child: Container(
                            width: Get.width * 0.95,
                            child: CustomSearchBar(),
                          )),
                      Container(
                          padding: EdgeInsets.all(20),
                          width: Get.width,
                          child: Row(
                            children: [
                              Text(
                                'HANMMA',
                                style: TextStyle(
                                  color: Colors.orange[900],
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Exo 2',
                                ),
                              ),
                              Spacer(),
                              Text(
                                'FITNESS ',
                                style: TextStyle(
                                  color: Colors.orange[900],
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Exo 2',
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Container(
                    padding: EdgeInsets.only(left: 7),
                    margin: EdgeInsets.only(bottom: 10, top: 10),
                    width: Get.width,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'BODY PARTS',
                            style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 3,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'EQUIPMENTS',
                            style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 3,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          )
                        ])),
                BodyParts(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
