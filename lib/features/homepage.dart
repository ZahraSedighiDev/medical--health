import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_health_title/core/theme/app_colors.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => HomepageState();
}

class HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    double width =MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Container(
      width: width,
      height: height,
      color: AppColors.neutral,
    );
  }
}
