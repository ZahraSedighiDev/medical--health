import 'package:flutter/material.dart';
import 'package:medical_health_title/core/theme/app_icons.dart';
import '../../../core/theme/app_colors.dart';

class Navigationbar extends StatefulWidget {
  const Navigationbar({super.key});

  @override
  State<Navigationbar> createState() => NavigationbarState();
}
class NavigationbarState extends State<Navigationbar> {
  int selectedIndex =0 ;
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
          NavBarItem(icon: AppIcons.home, onTap: (){

          }),
          NavBarItem(icon: Icons.search, onTap: (){

          }),
          NavBarItem(icon: AppIcons.settings, onTap: (){

          }),
          NavBarItem(icon: AppIcons.person, onTap: (){

          })

        ],
      ),
    );
  }
}

class NavBarItem extends StatefulWidget {
  final IconData icon ;
  final VoidCallback onTap;
  const NavBarItem({super.key  , required this.icon , required this.onTap});

  @override
  State<NavBarItem> createState() => NavBarItemState();
}
class NavBarItemState extends State<NavBarItem> {
  bool isHovered = false ;
  @override
  Widget build(BuildContext context) {
    final color = isHovered ? AppColors.blue2 : AppColors.textMuted;
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
        onTap: widget.onTap,
        child: Icon(
          widget.icon,
          color: color,
          size: 20,
        )
      ),
    );
  }
}

