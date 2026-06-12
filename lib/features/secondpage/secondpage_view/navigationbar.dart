import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_health_title/core/theme/app_icons.dart';
import '../../../core/theme/app_colors.dart';

class Navigationbar extends StatefulWidget {
  const Navigationbar({super.key});

  @override
  State<Navigationbar> createState() => NavigationbarState();
}
class NavigationbarState extends State<Navigationbar> {
  final NavController controller = Get.put(NavController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height:  70,
      decoration:  BoxDecoration(
        color: AppColors.secondary,
        boxShadow:[ BoxShadow(
          color: Colors.black.withBlue(1),
          blurRadius: 10,
          offset:  const Offset(0, -2)
        )]
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavBarItem(icon: AppIcons.home, index: 0,),
          NavBarItem(icon: Icons.search, index: 1,),
          NavBarItem(icon: AppIcons.settings,index: 2,),
          NavBarItem(icon: AppIcons.person,index: 3,)

        ],
      ),
    );
  }
}

class NavBarItem extends StatefulWidget {
  final IconData icon ;
  final int index ;
  const  NavBarItem({super.key  , required this.index, required this.icon
    , });

  @override
  State<NavBarItem> createState() => NavBarItemState();
}
class NavBarItemState extends State<NavBarItem> {
  bool isHovered = false ;
  @override
  Widget build(BuildContext context) {
    final NavController controller = Get.find();
    return  Obx(  () {
      bool isActive = controller.activeIndex.value == widget.index;
      final color = isHovered || isActive
          ? AppColors.blue2
          : AppColors.textMuted;
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) {
          setState(() {
            isHovered =true ;
          });
        },
        onExit: (_){
          setState(() {
            isHovered = false ;
          });
        },
        child: GestureDetector(
            onTap:() => controller.updateIndex(widget.index),
            child: Icon(
              widget.icon,
              color: color,
              size: 20,
            )
        ),
      );
    });
  }
}

class NavController extends GetxController {
  var activeIndex = 0.obs;


  void updateIndex(int index) {
  activeIndex.value = index;
}
}
