import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:medical_health_title/core/theme/app_icons.dart';
import 'package:medical_health_title/core/theme/app_textstyles.dart';
import '../../../core/theme/app_colors.dart';
import '../../homepage/viewmodel/homepage_viewmodel.dart';

class Videocall extends StatefulWidget {
  const Videocall({super.key});

  @override
  State<Videocall> createState() => VideocallState();
}
class VideocallState extends State<Videocall> {
  @override
  Widget build(BuildContext context) {
    final medicalHealth = Get.find<HomepageViewmodel>();
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image:AssetImage(AppIcons.doctor1),
              fit: BoxFit.cover,
            )
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 15, sigmaY: 15
            ),
            child: Container(
              color: Colors.black.withValues(alpha: 0.3), 
            ),
          ),
        ),
        SafeArea(
            child: Column(
              children: [
                SizedBox(height: 40,),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: EdgeInsets.only(right: 20),
                    padding: EdgeInsets.symmetric(horizontal: 12 , vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.circle , color: Colors.red , size: 10,),
                        SizedBox(width: 8,),
                        Text("19 : 00 Minutes" , style: TextStyle(color: Colors.white
                        , fontSize: 12),)
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        shape: BoxShape.circle,
                      ),
                      child:  CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(AppIcons.doctor1),
                      ),
                    ),
                    SizedBox(height: 16,),
                    Text("Dr.M Khoshbakht" ,
                    style: AppTextStyles.title,),
                    SizedBox(height: 8,),
                    Text("Audio Recording is active " ,style: AppTextStyles.button,)
                  ],
                ),
                Spacer(),
                Padding(padding: EdgeInsets.only(bottom: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCallOption(AppIcons.volumeUp, Colors.white24),
                    GestureDetector(
                      onTap: (){
                        medicalHealth.setPage(1);
                      },
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle ,
                          boxShadow: [BoxShadow(color: Colors.redAccent ,
                          blurRadius: 15
                          )]
                        ),
                        child: Icon(Icons.call_end , color: Colors.white24, size: 35,),
                      ),
                    ),
                    _buildCallOption(AppIcons.mic, Colors.white24)

                  ],
                ),
                )
              ],
            ),
        
        )
      ],
    );
  }
  Widget _buildCallOption(IconData icon , Color color){
    return Container(
      padding: EdgeInsets.all(15),
      decoration:  BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Icon(icon , color: Colors.white, size: 28,),
    );
  }
}
