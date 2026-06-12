import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:medical_health_title/core/theme/app_textstyles.dart';
import 'package:medical_health_title/features/secondpage/secondpage_view/header.dart';

import '../../homepage/viewmodel/homepage_viewmodel.dart';
import 'doctors.dart';

class SecondpageView extends StatefulWidget {
  const SecondpageView({super.key});

  @override
  State<SecondpageView> createState() => SecondpageViewState();
}
class SecondpageViewState extends State<SecondpageView> {
  @override
  Widget build(BuildContext context) {
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
                        child: SeeAll(),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 250, // ارتفاع کارت‌ها
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) => DoctorCard(
                        name: "Dr. Esther",
                        specialty: "Dentist",
                        rating: 4.5,
                      ),
                    ),
                  ),
                ],
              )

            ],
          )),
    );
  }

}
class SeeAll extends StatefulWidget {
  const SeeAll({super.key});

  @override
  State<SeeAll> createState() => SeeAllState();
}
class SeeAllState extends State<SeeAll> {
  @override
  Widget build(BuildContext context) {
    final medicalHealth = Get.find<HomepageViewmodel>();
    return GestureDetector(
      onTap:(){
        setState(() {
          medicalHealth.setPage(4);
        });
      },
      child:
      Text("See All" , style: AppTextStyles.title,),
    );
  }
}
