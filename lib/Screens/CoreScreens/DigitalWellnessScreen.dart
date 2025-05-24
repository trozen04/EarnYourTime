import 'package:earn_your_time/Utils/AppColors.dart';
import 'package:earn_your_time/Utils/AppShadows.dart';
import 'package:earn_your_time/Utils/FTextStyles.dart';
import 'package:earn_your_time/Widgets/CustomAppBar.dart';
import 'package:earn_your_time/Widgets/CustomWidgets.dart';
import 'package:flutter/material.dart';

class DigitalWellnessScreen extends StatelessWidget {
  const DigitalWellnessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery
        .of(context)
        .size;
    final double width = screenSize.width;
    final double height = screenSize.height;

    return Scaffold(
      appBar: CustomAppBar(title: 'Digital Wellness'),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.035, vertical: height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Text(
                'Empowering Digital Wellness',
                style: FTextStyles.largeText.copyWith(fontSize: 24),
              ),
              SizedBox(height: height * 0.01),
              Text(
                'EarnYourTime is revolutionizing how we interact with technology, creating a healthier relationship between productivity and digital consumption.',
                style: FTextStyles.labelTextDark.copyWith(fontSize: 14),
              ),
              SizedBox(height: height * 0.03),

              // GitHub Stats Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatCard(
                    context,
                    icon: Icons.star_border,
                    value: '2.4K',
                    label: 'GitHub Stars',
                    width: width * 0.2,
                    height: height * 0.1,
                  ),
                  _buildStatCard(
                    context,
                    icon: Icons.people_outline,
                    value: '32',
                    label: 'Contributors',
                    width: width * 0.2,
                    height: height * 0.1,
                  ),
                  _buildStatCard(
                    context,
                    icon: Icons.fork_right,
                    value: '486',
                    label: 'Forks',
                    width: width * 0.2,
                    height: height * 0.1,
                  ),
                  _buildStatCard(
                    context,
                    icon: Icons.commit,
                    value: '1.8K',
                    label: 'Commits',
                    width: width * 0.2,
                    height: height * 0.1,
                  ),
                ],
              ),
              SizedBox(height: height * 0.03),

              // Buttons Section
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle GitHub link (not implemented for now)
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.05, vertical: height * 0.015),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'View on GitHub',
                      style: FTextStyles.labelText.copyWith(
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(width: width * 0.03),
                  OutlinedButton(
                    onPressed: () {
                      // Handle support project (not implemented for now)
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.black87),
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.05, vertical: height * 0.015),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Support Project',
                      style: FTextStyles.labelText.copyWith(
                          color: Colors.black87),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.03),

              // Built for Everyone Section
              Text(
                'Built for Everyone',
                style: FTextStyles.headingText,
              ),
              SizedBox(height: height * 0.01),
              Text(
                'Our mission is to create a healthy relationship with technology.',
                style: FTextStyles.labelTextDark.copyWith(fontSize: 14),
              ),
              SizedBox(height: height * 0.02),

              // Feature Cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FeatureCard(
                    icon: Icons.code,
                    title: 'Open Source',
                    description: 'Built by the community, for the community. Every line of code is open for review and contribution.',
                    width: width * 0.28,
                    height: height * 0.15,
                  ),
                  FeatureCard(
                    icon: Icons.lock_outline,
                    title: 'Privacy Focused',
                    description: 'Your data stays yours. We believe in transparent and secure handling of user information.',
                    width: width * 0.28,
                    height: height * 0.15,
                  ),
                  FeatureCard(
                    icon: Icons.devices,
                    title: 'Cross Platform',
                    description: 'Seamlessly works across your devices, providing a unified productivity experience.',
                    width: width * 0.28,
                    height: height * 0.15,
                  ),
                ],
              ),
              SizedBox(height: height * 0.03),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(BuildContext context,
      {required IconData icon, required String value, required String label, required double width, required double height}) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(vertical: height * 0.02),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderColor),
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: AppShadows.cardShadow
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.blue, size: 24),
          SizedBox(height: height * 0.01),
          Text(value, style: FTextStyles.headingText),
          Text(label, style: FTextStyles.labelText),
        ],
      ),
    );
  }
}