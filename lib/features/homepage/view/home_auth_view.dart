import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_health_title/core/theme/app_colors.dart';
import 'package:get/get.dart';
import 'package:medical_health_title/features/homepage/viewmodel/homepage_viewmodel.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => HomepageState();
}

class HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final medicalHealth = Get.find<HomepageViewmodel>();
    double width =MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body:  ,
    );
  }
}
