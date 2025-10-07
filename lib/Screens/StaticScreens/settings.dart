import 'package:earn_your_time/Utils/AppColors.dart';
import 'package:earn_your_time/Utils/AppShadows.dart';
import 'package:earn_your_time/Utils/FTextStyles.dart';
import 'package:earn_your_time/Widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _appName = '';
  String _appVersion = '';

  @override
  void initState() {
    super.initState();
    _fetchAppInfo();
  }

  Future<void> _fetchAppInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _appName = packageInfo.appName;
      _appVersion = packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double width = screenSize.width;
    final double height = screenSize.height;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Settings'),
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
                      Navigator.pushNamed(context, '/notification');
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
                  '$_appName v$_appVersion',
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
        VoidCallback? onTap,
      }) {
    return GestureDetector(
      onTap: onTap,
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
