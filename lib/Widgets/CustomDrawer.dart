import 'package:earn_your_time/Utils/AppColors.dart';
import 'package:earn_your_time/Utils/AppShadows.dart';
import 'package:earn_your_time/Utils/FTextStyles.dart';
import 'package:flutter/material.dart';
import 'CustomWidgets.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsiveness
    final Size screenSize = MediaQuery.of(context).size;
    final double height = screenSize.height;

    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: height * 0.12,
              padding: EdgeInsets.only(bottom: height * 0.02),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.borderColor),
                color: Colors.white,
                boxShadow: AppShadows.drawerHeaderShadow,
              ),
              alignment: Alignment.bottomCenter,
              child: Text(
                'Habitrack',
                style: FTextStyles.appName,
                textAlign: TextAlign.center,
              ),
            ),
            // Menu Items
            CustomListTile(
              icon: Icons.bar_chart,
              title: 'Statistics',
              onTap: () {
                Navigator.pushNamed(context, '/statistics');
              },
            ),
            CustomListTile(
              icon: Icons.settings,
              title: 'Settings',
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
            CustomListTile(
              icon: Icons.health_and_safety,
              title: 'Digital Wellness',
              onTap: () {
                Navigator.pushNamed(context, '/digital_wellness');
              },
            ),
          ],
        ),
      ),
    );
  }
}