import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 20), // مدیریت Padding برای Status Bar
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: const Column(
        children: [
          HeaderProfile(),
          SizedBox(height: 20),
          SearchDoctorField(),
        ],
      ),
    );
  }
}


class SearchDoctorField extends StatelessWidget {
  const SearchDoctorField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search Doctor...',
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.2), // برای هماهنگی با تم آبی
        prefixIcon: const Icon(Icons.search, color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(
            AppIcons.doctor2,
          ),
        ),
        SizedBox(width: 22,),
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello Zahra , Welcome"),
                Text("Zahra Sedighi"),
              ],
            ),
        ),
        Icon(AppIcons.notification),
      ],
    );
  }
}

