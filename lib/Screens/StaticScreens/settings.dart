import 'package:earn_your_time/Utils/AppColors.dart';
import 'package:earn_your_time/Utils/AppShadows.dart';
import 'package:earn_your_time/Utils/FTextStyles.dart';
import 'package:earn_your_time/Widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsiveness
    final Size screenSize = MediaQuery.of(context).size;
    final double width = screenSize.width;
    final double height = screenSize.height;

    return Scaffold(
      appBar: CustomAppBar(title: 'Settings'),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.035, vertical: height * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Settings List
            Expanded(
              child: ListView(
                children: [
                  _buildSettingsTile(
                    context,
                    icon: Icons.notifications_none_outlined,
                    title: 'Notifications',
                    subtitle: 'Manage your alerts',
                    width: width,
                    height: height * 0.1,
                    onTap: () {
                      // Handle navigation or action
                      print("Notifications tapped");
                    },
                  ),
                  _buildSettingsTile(
                    context,
                    icon: Icons.shield_outlined,
                    title: 'Privacy',
                    subtitle: 'Control your data',
                    width: width,
                    height: height * 0.1,
                    onTap: () {
                      Navigator.pushNamed(context, '/privacy_policy');
                    },
                  ),
                  _buildSettingsTile(
                    context,
                    icon: Icons.devices_outlined,
                    title: 'Connected Devices',
                    subtitle: 'Manage your devices',
                    width: width,
                    height: height * 0.1,
                    onTap: () {
                      print("Connected Devices tapped");
                    },
                  ),
                  _buildSettingsTile(
                    context,
                    icon: Icons.help_outline,
                    title: 'Help & Support',
                    subtitle: 'Get assistance',
                    width: width,
                    height: height * 0.1,
                    onTap: () {
                      Navigator.pushNamed(context, '/support_faq');
                    },
                  ),
                ],
              ),

            ),
            // Version Text at the Bottom
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: height * 0.02),
                child: Text(
                  'EarnYourTime v1.0.0',
                  style: TextStyle(
                    fontSize: height * 0.015,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsTile(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String subtitle,
        required double width,
        required double height,
        VoidCallback? onTap, // Added onTap callback
      }) {
    return GestureDetector(
      onTap: onTap, // Handle tap event
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.01, vertical: height * 0.05),
        margin: EdgeInsets.symmetric(vertical: height * 0.05),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderColor),
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
            boxShadow: AppShadows.cardShadow,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.grey, size: 30),
                SizedBox(width: width * 0.04),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(title, style: FTextStyles.labelTextDark),
                    Text(subtitle, style: FTextStyles.labelText),
                  ],
                ),
              ],
            ),
            Icon(Icons.chevron_right, color: Colors.grey, size: 25),
          ],
        ),
      ),
    );
  }

}