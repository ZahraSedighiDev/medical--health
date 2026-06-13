import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_health_title/core/theme/app_colors.dart';
import 'package:medical_health_title/core/theme/app_textstyles.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medical_health_title/routes/app_pages.dart';

import 'features/homepage/viewmodel/homepage_viewmodel.dart';

void main() {
  Get.put(HomepageViewmodel());
  runApp(const MedicalHealth());
}

class MedicalHealth extends StatelessWidget {
  const MedicalHealth({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner:  false,
      title: 'Medical Health',
      home: const SplashPage(),
      getPages: AppPages.pages,
    );
  }
}



class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => SplashPageState();
}
class SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds:3), () {
      Get.offAllNamed('/auth');
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body:  SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadingAnimationWidget.hexagonDots(color: AppColors.primary, size: 80),
            const SizedBox(height: 5,),
            Text('please wait for connection ' , style:  AppTextStyles.button,)
          ],
        ),
      )
    );
  }
}

