import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:medical_health_title/features/secondpage/secondpage_view/doctor_list_card.dart';
import '../../../core/theme/app_icons.dart';
import '../../homepage/viewmodel/homepage_viewmodel.dart';

class TopDoctors extends StatefulWidget {
  const TopDoctors({super.key});

  @override
  State<TopDoctors> createState() => TopdoctorsState();
}
class TopdoctorsState extends State<TopDoctors> {
  @override
  Widget build(BuildContext context) {
    final medicalHealth = Get.find<HomepageViewmodel>();
    return   SizedBox(
      width: double.infinity,
      height: 330,
      child:
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text("Top Doctors" , style: TextStyle(fontSize: 15),),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    medicalHealth.setPage(4);
                  },
                  child: const Text("See All" , style: TextStyle(fontSize: 15),),
                ),
              )
            ],
          ),
          DoctorListCard(name: "Dr James", specialty: "Cardiologist", rating: 4.9
              , imageUrl: AppIcons.doctor1, address: "Malek Abad blv , Haghshenas Ave"),
           SizedBox(height: 10,),
          DoctorListCard(name: "Dr Rosy", specialty: "psychologist", rating: 4.9
              , imageUrl: AppIcons.doctor3, address: "Malek Abad blv , Haghshenas Ave")

        ],
      ),
    );
  }
}
