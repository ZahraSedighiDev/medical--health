import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:medical_health_title/core/theme/app_icons.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/primary_buttons.dart';
import '../../homepage/viewmodel/homepage_viewmodel.dart';
import '../../secondpage/secondpage_view/navigationbar.dart';

class ThirdpageView extends StatefulWidget {
  const ThirdpageView({super.key});

  @override
  State<ThirdpageView> createState() => ThirdpageViewState();
}
class ThirdpageViewState extends State<ThirdpageView> {
  @override
  Widget build(BuildContext context) {
    final medicalHealth = Get.find<HomepageViewmodel>();
    final doctorName = "Dr. M Khoshbakht";
    final specialty = "Neurologist | Razavi Hospital";
    final _ = 5;
    final reviews = 332;
    final patients = "120+";
    final yearsExp = "7+";
    final aboutMe = "Dr. Khoshbakht is the top most immunologists specialist in Razavi Hospital in Mashhad.";
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: const Text("My Appointment"
        , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            medicalHealth.setPage(1);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.offAllNamed('/home');
            },
            child: const Text("Home", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body:  SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDoctorHeader(doctorName: doctorName,
                specialty: specialty,
                rating: 4.9,
                reviews: reviews),
            const SizedBox(height: 16),
            _buildStatsSection(
              patients: patients,
              yearsExp: yearsExp,
              rating: 5,
              reviews: reviews,
            ),
            const SizedBox(height: 24),
            _buildAboutMeSection(aboutMe: aboutMe),
            const SizedBox(height: 24),
            _buildJoyWidget(),
            const SizedBox(height: 24),
             _buildgetStartedButton(),

          ],
        ),

      ),
      bottomNavigationBar: Navigationbar(),


    );
  }
  Widget _buildDoctorHeader ({
    required String doctorName,
    required String specialty,
    required double rating ,
    required int reviews ,
}){
    return Container(
      padding: const EdgeInsets.all(20),
      color: AppColors.surface,
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xFF199A8E) ,
              borderRadius: BorderRadius.circular(20),
              image:DecorationImage(image: AssetImage(AppIcons.doctor1)
              , fit: BoxFit.cover,
              ) ,
            ),
          ),
          SizedBox(width: 16,),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(doctorName,
                  style:  TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    specialty,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Color(0xFFFFB800), size: 18),
                      const SizedBox(width: 4),
                      Text(
                        "$rating ",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "($reviews reviews)",
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                    ],
                  )


                ],
              )
          )
        ],
      ),
    );}


  Widget _buildStatsSection({
    required String patients,
    required String yearsExp,
    required double rating,
    required int reviews,
  }){
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStatItem(patients, "Patients"),
            Container(
              width: 1,
              height: 40,
              color: Colors.grey.shade300,
            ),
            _buildStatItem(yearsExp, "Years Exp"),
            Container(
              width: 1,
              height: 40,
              color: Colors.grey.shade300,
            ),
            _buildStatItem(rating.toString(), "Rating"),
            Container(
              width: 1,
              height: 40,
              color: Colors.grey.shade300,
            ),
            _buildStatItem("$reviews+", "Reviews")

          ],
        )


    );
  }

  Widget _buildStatItem(String value , String lable){
    return Column(
      children: [
      Text(
      value,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      ),
        SizedBox(height: 4,),
        Text(
          lable,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade500,
          ),
        ),


      ],
    );
  }

  Widget _buildJoyWidget() {
    final List<String> joyMessages = [
      "Be proud of your self🌸",
      " Today is a good day😊 ",
      " your health is the most important thing in the world✨",
      " you are more powerful than you think💪",
      "Calmness is always with you🌺",
    ];
    final randomIndex = DateTime.now().second % joyMessages.length;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors:  [const Color(0xFF199A8E), const Color(0xFF0D6D63)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF199A8E).withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],

      ),
      child:  Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.emoji_emotions,
              color: Colors.white,
              size: 40,
            ),

          ),
          SizedBox(width: 16,),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "wish the best moments 🌈",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4,),
                  Text(
                    joyMessages[randomIndex],
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              )
          )
        ],
      ),
    );





  }

  Widget _buildgetStartedButton(){
    final medicalHealth = Get.find<HomepageViewmodel>();
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        height: 55,
        child: PrimaryButtons( onPressed: () async {
      Get.snackbar(
      "Start visiting ",
      "Connecting to doctor ...",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF199A8E),
      colorText: Colors.white,
      );

      medicalHealth.setPage(5);
      },
            backgroundColor: AppColors.blue2,
            icon: Icon(AppIcons.call),
            text:" Voice Call (14:30 - 15:00 PM)" ,
            textColor: AppColors.surface),
      ),
    );
  }

  Widget _buildAboutMeSection({required String aboutMe}){
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "About Me",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12,),
          Text(
            aboutMe,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Read More...",
            style: TextStyle(
              color: const Color(0xFF199A8E),
              fontWeight: FontWeight.w500,
            ),
          ),

        ],
      ),
    );
  }
}
