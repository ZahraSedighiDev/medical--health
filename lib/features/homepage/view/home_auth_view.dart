import 'package:flutter/material.dart';
import 'package:medical_health_title/core/theme/app_colors.dart';
import 'package:get/get.dart';
import 'package:medical_health_title/core/utils/onboarding_gradient_background.dart';
import 'package:medical_health_title/core/widgets/primary_buttons.dart';
import 'package:medical_health_title/features/fourthpage/fourthpage_view/fourthpage_view.dart';
import 'package:medical_health_title/features/homepage/viewmodel/homepage_viewmodel.dart';
import 'package:medical_health_title/features/secondpage/secondpage_view/secondpage_view.dart';
import 'package:medical_health_title/features/secondpage/secondpage_view/see_all_doctors_page.dart';
import 'package:medical_health_title/features/thirdpage/thirdpage_view/thirdpage_view.dart';
import '../../../core/theme/app_icons.dart';
import '../../../core/theme/app_textstyles.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => HomepageState();
}
class HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final medicalHealth = Get.find<HomepageViewmodel>();
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child:  Obx( (){
          switch(medicalHealth.pageIndex.value){
            case 0 :
              return const FirstPage();
            case 1 :
              return const SecondpageView();
            case 2 :
              return const ThirdpageView();
            case 3 :
              return const FourthpageView();
            case 4 :
              return const SeeAllDoctorsPage();
            case 5 :
              return const FourthpageView();
            default:
              return const Homepage();

          }
        }),
      ),
    );
  }
}
class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => FirstPageState();
}

class FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    final medicalHealth = Get.find<HomepageViewmodel>();
    final media = MediaQuery.of(context);
    double height = media.size.height;
    return Scaffold(
      body: OnboardingGradientBackground(
        child: SafeArea(
          child: Stack(
            children: [
              Align(
                alignment: Alignment(0, -0.35),
                child:  SizedBox(
                  height: height * 0.8,
                  child: Image.asset(
                    AppIcons.doctor1  ,
                    fit:  BoxFit.contain,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: _BottomCard(onGetStarted: (){
                  medicalHealth.setPage(1);
                }) ,
              ),
            ],
          ),
        ),
      ) ,
    );
  }
}

class _BottomCard extends StatelessWidget {
  final VoidCallback onGetStarted ;
  const _BottomCard({required this.onGetStarted
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(22, 22, 22, 22),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(26),
          topRight: Radius.circular(26),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "More Comfortable Chat\nWith the Doctor" ,
            textAlign: TextAlign.center,
            style: AppTextStyles.title,
          ),
          const SizedBox(height: 10,),
          const Text(
            "Book an appointment with doctor. Chat with\ndoctor via appointment letter and get\nconsultation.",
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyMuted ,
          ),
          const SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _Dot(active: false),
              _Dot(active: true),
              _Dot(active: false),
            ],
          ),
          const SizedBox(height: 16,),
             PrimaryButtons(onPressed: onGetStarted,
              backgroundColor: AppColors.blue2,
              icon: null,
              text: 'Get Started',
              textColor: Colors.white),
          const SizedBox(height: 8,)
        ],
      ),
    );
  }
}
class _Dot extends StatelessWidget {
  final bool active ;
  const _Dot({required this.active
  });

  @override
  Widget build(BuildContext context) {
    return  AnimatedContainer(
      duration: const Duration(microseconds: 250),
      margin:  const EdgeInsets.symmetric(horizontal: 4),
      width: active ? 18 : 8,
      height:  8,
      decoration: BoxDecoration(
        color:  active ? AppColors.blue2 : AppColors.dark ,
        borderRadius:  BorderRadius.circular(20),
      ),


    );
  }
}

