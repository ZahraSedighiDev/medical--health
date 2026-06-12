import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:medical_health_title/core/theme/app_textstyles.dart';
import 'package:medical_health_title/features/secondpage/secondpage_view/header.dart';
import 'package:medical_health_title/features/secondpage/secondpage_view/see_all_doctors_page.dart';

import '../../../core/theme/app_icons.dart';
import '../../homepage/viewmodel/homepage_viewmodel.dart';
import 'doctors.dart';

class SecondpageView extends StatefulWidget {
  const SecondpageView({super.key});

  @override
  State<SecondpageView> createState() => SecondpageViewState();
}
class SecondpageViewState extends State<SecondpageView> {
  final List<Map<String, dynamic>> myDoctors = [
    {"name": "Dr. Esther", "specialty": "Dentist", "rating": 4.5 , "image" :AppIcons.doctor1},
    {"name": "Dr. Ali", "specialty": "Cardiologist", "rating": 4.8 , "image" : AppIcons.doctor2},
    {"name": "Dr. Sara", "specialty": "Surgeon", "rating": 5, "image" : AppIcons.doctor4},
    {"name": "Dr. James", "specialty": "Medical", "rating": 4.9, "image" : AppIcons.doctor2},
    {"name": "Dr. Mike", "specialty": "dentist", "rating": 4.9 ,"image" : AppIcons.doctor5},
    {"name": "Dr. Aref", "specialty": "Nero Surgeon", "rating": 3.9 ,"image" : AppIcons.doctor3},
    {"name": "Dr. Amy", "specialty": "G.P", "rating": 3, "image" : AppIcons.doctor1},
  ];

  @override
  Widget build(BuildContext context) {
    final medicalHealth = Get.find<HomepageViewmodel>();
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              Header(),
              SizedBox(height: 10,),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child:
                        const Text("Favourite Doctor"),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child:TextButton(
                          onPressed: () {
                            medicalHealth.setPage(4);
                          },
                          child: const Text("See All" , style: TextStyle(fontSize: 15),),
                        )
                        ,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: myDoctors.length,
                      itemBuilder: (context, index){
                        final doctor = myDoctors[index];
                        return DoctorCard(name: doctor["name"],
                            specialty: doctor["specialty"] ,
                            rating: doctor["rating"],
                            imageUrl: doctor["image"]
                        );
                      }
                    ),
                  ),
                ],
              )

            ],
          )),
    );
  }

}