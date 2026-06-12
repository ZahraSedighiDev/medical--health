import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_health_title/core/theme/app_icons.dart';
import '../../homepage/viewmodel/homepage_viewmodel.dart';
import 'doctor_list_card.dart';

class SeeAllDoctorsPage extends StatelessWidget {
  const SeeAllDoctorsPage({super.key});

  final List<Map<String, dynamic>> myDoctors = const [
    {
      "name": "Dr. Esther",
      "specialty": "Dentist",
      "rating": 4.5,
      "image": AppIcons.doctor1,
      "address": "Tehran, Vanak, Clinic A",
    },
    {
      "name": "Dr. Ali",
      "specialty": "Cardiologist",
      "rating": 4.8,
      "image":AppIcons.doctor2,
      "address": "Tehran, Saadat Abad, Heart Center",
    },
    {
      "name": "Dr. Sara",
      "specialty": "Surgeon",
      "rating": 5.0,
      "image": AppIcons.doctor4,
      "address": "Shiraz, Zand St, Hospital B",
    },
    {
      "name": "Dr. James",
      "specialty": "Medical",
      "rating": 4.9,
      "image": AppIcons.doctor3,
      "address": "Isfahan, Nazhvan Blvd, Medical Center",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final medicalHealth = Get.find<HomepageViewmodel>();
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("All Doctors"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            medicalHealth.setPage(1);

          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.offAllNamed('/home'); // برگرد به Home و کل stack رو پاک کن
            },
            child: const Text(
              "Home",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: myDoctors.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final doctor = myDoctors[index];
          return DoctorListCard(
            name: doctor["name"],
            specialty: doctor["specialty"],
            rating: doctor["rating"],
            imageUrl: doctor["image"],
            address: doctor["address"],
          );
        },
      ),
    );
  }
}
