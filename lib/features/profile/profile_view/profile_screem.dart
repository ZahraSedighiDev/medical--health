import 'package:flutter/material.dart';
import 'package:medical_health_title/features/secondpage/secondpage_view/navigationbar.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';

class ProfileScreem extends StatelessWidget {
  const ProfileScreem({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF4E5AF2);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FE),
      appBar: AppBar(
        title: const Text(
          "My Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit_outlined, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            /// Profile image
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(AppIcons.profile),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: AppColors.surface,
                      child: const Icon(
                        Icons.camera_alt,
                        size: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "Zahra Sedighi",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 4),

            const Text(
              "Zahrasedighi@gmail.com",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 30),

            /// Stats row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatCard(
                    "Weight",
                    "70kg",
                    Icons.monitor_weight_outlined,
                    Colors.orange,
                  ),
                  _buildStatCard("Height", "170cm", Icons.height, Colors.blue),
                  _buildStatCard(
                    "Blood",
                    "A+",
                    Icons.bloodtype_outlined,
                    Colors.red,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            _buildMenuItem(
              Icons.description_outlined,
              "Medical Records",
              () {},
            ),
            _buildMenuItem(
              Icons.calendar_today_outlined,
              "My Appointments",
              () {},
            ),
            _buildMenuItem(
              Icons.account_balance_wallet_outlined,
              "Payments",
              () {},
            ),
            _buildMenuItem(
              Icons.notifications_none_outlined,
              "Notifications",
              () {},
            ),
            _buildMenuItem(Icons.security_outlined, "Security", () {}),

            const SizedBox(height: 20),

            ListTile(
              onTap: () {},
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                "Log out",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: const Navigationbar(),
    );
  }

  Widget _buildStatCard(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: color),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFF0F2FF),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: const Color(0xFF4E5AF2), size: 22),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),
      ),
    );
  }
}
