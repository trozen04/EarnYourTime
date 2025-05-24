import 'package:earn_your_time/Utils/AppColors.dart';
import 'package:earn_your_time/Utils/AppShadows.dart';
import 'package:earn_your_time/Utils/FTextStyles.dart';
import 'package:earn_your_time/Widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';

class SupportFAQScreen extends StatelessWidget {
  const SupportFAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double width = screenSize.width;
    final double height = screenSize.height;

    return Scaffold(
      appBar: CustomAppBar(title: 'Support & FAQ'),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.035, vertical: height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search for help...',
                  hintStyle: FTextStyles.labelText.copyWith(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(vertical: height * 0.015),
                ),
              ),
              SizedBox(height: height * 0.03),

              // FAQ Section
              Text(
                'Frequently Asked Questions',
                style: FTextStyles.headingText,
              ),
              SizedBox(height: height * 0.01),
              _buildFAQTile(
                context,
                question: 'How does the reward system work?',
                width: width,
                height: height,
              ),
              _buildFAQTile(
                context,
                question: 'Can I customize my productivity goals?',
                width: width,
                height: height,
              ),
              _buildFAQTile(
                context,
                question: 'How do I sync my mobile device?',
                width: width,
                height: height,
              ),
              _buildFAQTile(
                context,
                question: 'What happens to unused phone time?',
                width: width,
                height: height,
              ),
              SizedBox(height: height * 0.03),

              // Contact Support Section
              Text(
                'Contact Support',
                style: FTextStyles.headingText,
              ),
              SizedBox(height: height * 0.01),
              _buildContactOption(
                context,
                icon: Icons.chat_bubble_outline,
                title: 'Start LIVE Chat',
                width: width,
                height: height,
              ),
              _buildContactOption(
                context,
                icon: Icons.email_outlined,
                title: 'Send Email',
                width: width,
                height: height,
              ),
              _buildContactOption(
                context,
                icon: Icons.phone_outlined,
                title: 'Schedule Call',
                width: width,
                height: height,
              ),
              SizedBox(height: height * 0.03),

              // Help Resources Section
              Text(
                'Help Resources',
                style: FTextStyles.headingText,
              ),
              SizedBox(height: height * 0.01),
              _buildResourceTile(
                context,
                icon: Icons.book_outlined,
                title: 'User Guide',
                width: width,
                height: height,
              ),
              _buildResourceTile(
                context,
                icon: Icons.video_library_outlined,
                title: 'Video Tutorials',
                width: width,
                height: height,
              ),
              _buildResourceTile(
                context,
                icon: Icons.description_outlined,
                title: 'Documentation',
                width: width,
                height: height,
              ),
              _buildResourceTile(
                context,
                icon: Icons.forum_outlined,
                title: 'Community Forum',
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

  Widget _buildFAQTile(BuildContext context,
      {required String question, required double width, required double height}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: height * 0.005),
      padding: EdgeInsets.symmetric(horizontal: width * 0.035, vertical: height * 0.015),
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
              const Icon(Icons.help_outline, color: Colors.blue, size: 20),
              SizedBox(width: width * 0.02),
              Text(question, style: FTextStyles.labelTextDark),
            ],
          ),
          const Icon(Icons.expand_more, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildContactOption(BuildContext context,
      {required IconData icon, required String title, required double width, required double height}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: height * 0.005),
      padding: EdgeInsets.symmetric(horizontal: width * 0.035, vertical: height * 0.015),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: AppShadows.cardShadow,
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 20),
          SizedBox(width: width * 0.02),
          Text(title, style: FTextStyles.labelTextDark),
        ],
      ),
    );
  }

  Widget _buildResourceTile(BuildContext context,
      {required IconData icon, required String title, required double width, required double height}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: height * 0.005),
      padding: EdgeInsets.symmetric(horizontal: width * 0.035, vertical: height * 0.015),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: AppShadows.cardShadow,
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 20),
          SizedBox(width: width * 0.02),
          Text(title, style: FTextStyles.labelTextDark),
        ],
      ),
    );
  }
}