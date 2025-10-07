import 'package:earn_your_time/Utils/AppColors.dart';
import 'package:earn_your_time/Utils/AppShadows.dart';
import 'package:earn_your_time/Utils/FTextStyles.dart';
import 'package:earn_your_time/Widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../Widgets/CustomWidgets.dart';

class StatisticsScreen extends StatelessWidget {
  StatisticsScreen({super.key});

  // Data for the bar chart (Weekly Overview)
  final List<BarChartGroupData> barGroups = [
    BarChartGroupData(x: 0, barRods: [
      BarChartRodData(
        toY: 4,
        color: Colors.blue,
        width: 30,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
      ),
    ]),
    BarChartGroupData(x: 1, barRods: [
      BarChartRodData(
        toY: 6,
        color: Colors.blue,
        width: 30,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
      ),
    ]),
    BarChartGroupData(x: 2, barRods: [
      BarChartRodData(
        toY: 5,
        color: Colors.blue,
        width: 30,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
      ),
    ]),
    BarChartGroupData(x: 3, barRods: [
      BarChartRodData(
        toY: 8,
        color: Colors.blue,
        width: 30,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
      ),
    ]),
    BarChartGroupData(x: 4, barRods: [
      BarChartRodData(
        toY: 5,
        color: Colors.blue,
        width: 30,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
      ),
    ]),
    BarChartGroupData(x: 5, barRods: [
      BarChartRodData(
        toY: 3,
        color: Colors.blue,
        width: 30,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
      ),
    ]),
    BarChartGroupData(x: 6, barRods: [
      BarChartRodData(
        toY: 2,
        color: Colors.blue,
        width: 30,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
      ),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double width = screenSize.width;
    final double height = screenSize.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Statistics'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.035, vertical: height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Stats Section
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    StatisticsCard(
                      icon: Icons.timer,
                      value: '32.5',
                      label: 'Productive Hours',
                      change: '+12% ↑',
                    ),
                    const SizedBox(width: 8),
                    StatisticsCard(
                      icon: Icons.center_focus_strong,
                      value: '85%',
                      label: 'Focus Score',
                      change: '+5% ↑',
                    ),
                    const SizedBox(width: 8),
                    StatisticsCard(
                      icon: Icons.phone_android,
                      value: '8h 15m',
                      label: 'Phone Time Earned',
                      change: '-3% ↓',
                    ),
                    const SizedBox(width: 8),
                    StatisticsCard(
                      icon: Icons.flash_on,
                      value: '12 days',
                      label: 'Productivity Streak',
                      change: '+2 ↑',
                    ),
                  ],
                ),
              ),

              SizedBox(height: height * 0.03),

              // Weekly Overview Section
              Text(
                'Weekly Overview',
                style: FTextStyles.headingText,
              ),
              SizedBox(height: height * 0.01),
              Container(
                height: height * 0.3,
                padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.01),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderColor),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: AppShadows.elevatedShadow,
                ),
                child: BarChart(
                  BarChartData(
                    barGroups: barGroups,
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            return Text(
                              '${value.toInt()}',
                              style: FTextStyles.labelTextDark,
                            );
                          },
                          interval: 2,
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                            return Text(
                              days[value.toInt()],
                              style: FTextStyles.labelText,
                            );
                          },
                        ),
                      ),
                      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    ),
                    borderData: FlBorderData(show: false),
                    barTouchData: BarTouchData(enabled: false),
                    gridData: FlGridData(show: false),
                    maxY: 8,
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),

              // Activity Distribution Section
              Text(
                'Activity Distribution',
                style: FTextStyles.headingText,
              ),
              SizedBox(height: height * 0.01),
              DistributionTile(
                label: 'Development',
                percentage: 45,
              ),
              DistributionTile(
                
                label: 'Research',
                percentage: 30,
                
              ),
              DistributionTile(
                
                label: 'Design',
                percentage: 25,
                
              ),
              SizedBox(height: height * 0.03),

              // Time Allocation Section
              Text(
                'Time Allocation',
                style: FTextStyles.headingText,
              ),
              SizedBox(height: height * 0.01),
              DistributionTile(
                
                label: 'Morning',
                percentage: 85,
                
                showTasks: true,
              ),
              DistributionTile(
                
                label: 'Afternoon',
                percentage: 65,
                
                showTasks: true,
              ),
              DistributionTile(
                label: 'Evening',
                percentage: 45,
                showTasks: true,
              ),
              SizedBox(height: height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}