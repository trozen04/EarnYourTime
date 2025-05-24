import 'package:earn_your_time/Utils/AppColors.dart';
import 'package:earn_your_time/Utils/AppShadows.dart';
import 'package:earn_your_time/Utils/FTextStyles.dart';
import 'package:flutter/material.dart';

import 'package:earn_your_time/Utils/AppColors.dart';
import 'package:earn_your_time/Utils/FTextStyles.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const CustomListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.borderColor,
            width: 1.0,
          ),
        ),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.grey),
        title: Text(
          title,
          style: FTextStyles.labelTextDark,
        ),
        onTap: onTap,
      ),
    );
  }
}

class ActivityTile extends StatelessWidget {
  final IconData icon;
  final String activity;
  final String time;
  final String timestamp;
  final double width;
  final double height;

  const ActivityTile({
    super.key,
    required this.icon,
    required this.activity,
    required this.time,
    required this.timestamp,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.01, vertical: height * 0.06),
      margin: EdgeInsets.only(bottom: height * 0.07),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: const Offset(0, 1),
            blurRadius: 2,
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.blue, size: 24),
              SizedBox(width: width * 0.03),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(activity, style: FTextStyles.labelTextDark),
                  SizedBox(height: height * 0.005),
                  Text(time, style: FTextStyles.labelText),
                ],
              ),
            ],
          ),
          Text(timestamp, style: FTextStyles.labelTextTimeStamp),
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String? subtitle;
  final IconData? icon;
  final double width;
  final double height;
  final bool showLargeIcon;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    this.subtitle,
    this.icon,
    required this.width,
    required this.height,
    this.showLargeIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: AppShadows.cardShadow,
        border: Border.all(color: AppColors.borderColor)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (showLargeIcon && icon != null) ...[
            Icon(
              icon,
              color: Colors.grey,
              size: height * 0.4,
            ),
            SizedBox(height: height * 0.05),
          ],
          Text(
            title,
            style: FTextStyles.labelText,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          SizedBox(height: height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: showLargeIcon
                    ? FTextStyles.headingText
                    : FTextStyles.largeText.copyWith(fontSize: 20),
              ),
              if (!showLargeIcon && icon != null) ...[
                SizedBox(width: width * 0.02),
                Icon(icon, color: Colors.amber, size: 20),
              ],
            ],
          ),
          if (subtitle != null) ...[
            SizedBox(height: height * 0.01),
            Text(
              subtitle!,
              style: FTextStyles.labelText.copyWith(color: Colors.grey),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ],
        ],
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final double width;
  final double height;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(8),
        boxShadow: AppShadows.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icon, color: Colors.blue, size: 24),
          SizedBox(height: height * 0.01),
          Text(title, style: FTextStyles.headingText),
          SizedBox(height: height * 0.01),
          Text(
            description,
            style: FTextStyles.labelText.copyWith(fontSize: 12),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}