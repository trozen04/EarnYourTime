import 'package:earn_your_time/Utils/AppColors.dart';
import 'package:earn_your_time/Utils/AppShadows.dart';
import 'package:earn_your_time/Utils/FTextStyles.dart';
import 'package:earn_your_time/Widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double width = screenSize.width;
    final double height = screenSize.height;

    return Scaffold(
      appBar: CustomAppBar(title: 'Privacy Policy'),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.035, vertical: height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Last Updated
              Text(
                'Last updated May 2024',
                style: FTextStyles.labelText.copyWith(color: Colors.grey),
              ),
              SizedBox(height: height * 0.02),

              // Your Privacy Matters Section
              Text(
                'Your Privacy Matters',
                style: FTextStyles.headingText,
              ),
              SizedBox(height: height * 0.01),
              Text(
                'This privacy policy explains how EarnYourTime collects, uses, and protects your personal information. We’re committed to protecting your privacy and ensuring transparency in our data practices.',
                style: FTextStyles.labelTextDark.copyWith(fontSize: 14),
              ),
              SizedBox(height: height * 0.03),

              // Data Collection Section
              _buildSection(
                context,
                title: 'Data Collection',
                content: [
                  'We collect the following types of information:',
                  ' - User statistics and activity patterns',
                  ' - Device information and identifiers',
                  ' - Application preferences and settings',
                  ' - Performance and productivity metrics',
                ],
                width: width,
                height: height,
              ),

              // How We Use Your Data Section
              _buildSection(
                context,
                title: 'How We Use Your Data',
                content: [
                  'We use your data to:',
                  ' - Service improvement: Enhance app experience and functionality',
                  ' - Performance analytics: Track your productivity features',
                  ' - Customization: Personalize your experience',
                ],
                width: width,
                height: height,
              ),

              // Data Protection Section
              _buildSection(
                context,
                title: 'Data Protection',
                content: [
                  'We implement various security measures to protect your personal information:',
                  ' - End-to-end encryption for sensitive data',
                  ' - Regular security audits and updates',
                  ' - Secure data storage and transmission',
                  ' - Access controls and authentication',
                ],
                width: width,
                height: height,
              ),

              // Contact Us Section
              _buildSection(
                context,
                title: 'Contact Us',
                content: [
                  'If you have any questions about our privacy policy or data practices, please contact us:',
                  ' - Email: support@earnyourtime.com',
                  ' - Live Chat: Available in the Support & FAQ section',
                ],
                width: width,
                height: height,
              ),
              SizedBox(height: height * 0.03),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context,
      {required String title, required List<String> content, required double width, required double height}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: FTextStyles.headingText,
        ),
        SizedBox(height: height * 0.01),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: width * 0.035, vertical: height * 0.02),
          decoration: BoxDecoration(
            color: Colors.white,
              border: Border.all(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(8),
            boxShadow: AppShadows.cardShadow
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: content.map((item) => Padding(
              padding: EdgeInsets.only(bottom: height * 0.01),
              child: Text(
                item,
                style: FTextStyles.labelTextDark.copyWith(fontSize: 14),
              ),
            )).toList(),
          ),
        ),
        SizedBox(height: height * 0.03),
      ],
    );
  }
}