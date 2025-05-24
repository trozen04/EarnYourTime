import 'package:earn_your_time/Utils/AppColors.dart';
import 'package:earn_your_time/Utils/AppShadows.dart';
import 'package:earn_your_time/Utils/FTextStyles.dart';
import 'package:earn_your_time/Widgets/CustomDrawer.dart';
import 'package:earn_your_time/Widgets/CustomWidgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EarnYourTimeHomeScreen extends StatefulWidget {
  const EarnYourTimeHomeScreen({super.key});

  @override
  State<EarnYourTimeHomeScreen> createState() => _EarnYourTimeHomeScreenState();
}

class _EarnYourTimeHomeScreenState extends State<EarnYourTimeHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double width = screenSize.width;
    final double height = screenSize.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black87),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'EarnYourTime',
              style: FTextStyles.appName,
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.005, horizontal: width * 0.04),
              decoration: BoxDecoration(
                color: Colors.greenAccent.withOpacity(0.2),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                'Connected',
                style: FTextStyles.connected,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.035, vertical: height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Earned Time Available (Merged with Time Earned Today)
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.035, vertical: height * 0.02),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: AppShadows.elevatedShadow,
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      color: Colors.blue,
                      size: height * 0.08,
                    ),
                    SizedBox(height: height * 0.015),
                    Text(
                      '2h 30m',
                      style: FTextStyles.largeText,
                    ),
                    SizedBox(height: height * 0.01),
                    Text(
                      'Earned Today: 45 minutes',
                      style: FTextStyles.labelText.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.03),

              // Stats Section (Today's Total with Coding Time, Focus Score, Next Lock In)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StatCard(
                    title: "Today's Total",
                    value: '4h 15m',
                    subtitle: 'Coding Time: 3h 25m',
                    width: width * 0.3,
                    height: height * 0.12,
                  ),
                  StatCard(
                    title: 'Focus Score',
                    value: '92%',
                    subtitle: 'Top 5% users',
                    icon: Icons.emoji_events,
                    width: width * 0.3,
                    height: height * 0.12,
                  ),
                  StatCard(
                    title: 'Next Lock in',
                    value: '45m',
                    icon: Icons.lock_open_outlined,
                    width: width * 0.3,
                    height: height * 0.12,
                    showLargeIcon: true,
                  ),
                ],
              ),
              SizedBox(height: height * 0.03),

              // Current Activity Section
              Text(
                'Current Activity',
                style: FTextStyles.headingText,
              ),
              SizedBox(height: height * 0.01),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.035, vertical: height * 0.02),
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
                        const Icon(Icons.code, color: Colors.blue, size: 30),
                        SizedBox(width: width * 0.03),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'VS Code - Project EarnYourTime',
                              style: FTextStyles.labelTextDark,
                            ),
                            Text(
                              'Active for 45 minutes',
                              style: FTextStyles.labelText,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: height * 0.005, horizontal: width * 0.03),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Active',
                        style: FTextStyles.connected,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.03),

              // Recent Activities Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Activities',
                    style: FTextStyles.headingText,
                  ),
                  Text(
                    'View All',
                    style: FTextStyles.labelTextTimeStamp.copyWith(fontSize: 14),
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),
              ActivityTile(
                icon: MdiIcons.microsoftVisualStudioCode,
                activity: 'VS Code',
                time: '2h 15m',
                timestamp: '2:30 PM',
                width: width,
                height: height * 0.07,
              ),
              ActivityTile(
                icon: MdiIcons.palette,
                activity: 'Figma',
                time: '1h 45m',
                timestamp: '11:20 AM',
                width: width,
                height: height * 0.07,
              ),
              ActivityTile(
                icon: Icons.code,
                activity: 'Coding Session',
                time: '1h 20m',
                timestamp: '10:30 AM',
                width: width,
                height: height * 0.07,
              ),
              ActivityTile(
                icon: Icons.description,
                activity: 'Documentation',
                time: '45m',
                timestamp: '9:00 AM',
                width: width,
                height: height * 0.07,
              ),
              ActivityTile(
                icon: MdiIcons.googleChrome,
                activity: 'Chrome',
                time: '45m',
                timestamp: '9:15 AM',
                width: width,
                height: height * 0.07,
              ),
              SizedBox(height: height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
