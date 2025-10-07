import 'package:earn_your_time/Utils/AppColors.dart';
import 'package:earn_your_time/Utils/AppShadows.dart';
import 'package:earn_your_time/Utils/FTextStyles.dart';
import 'package:earn_your_time/Widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';

import '../../Widgets/CustomWidgets.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final TextEditingController _searchController = TextEditingController();

  // Sample notifications
  final List<Map<String, String>> _notifications = [
    {
      'title': 'Reward Earned!',
      'description': 'You have earned 50 points for completing today’s tasks.',
      'time': '2h ago',
    },
    {
      'title': 'New Feature Update',
      'description': 'We added a new productivity dashboard to track your goals.',
      'time': '1d ago',
    },
    {
      'title': 'Reminder',
      'description': 'Don’t forget to check your weekly progress report.',
      'time': '3d ago',
    },
    {
      'title': 'Tip of the Day',
      'description': 'Use the Pomodoro technique to maximize focus.',
      'time': '5d ago',
    },
  ];

  List<Map<String, String>> _filteredNotifications = [];

  @override
  void initState() {
    super.initState();
    _filteredNotifications = List.from(_notifications);
    _searchController.addListener(_filterNotifications);
  }

  void _filterNotifications() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredNotifications = _notifications.where((notification) {
        final title = notification['title']!.toLowerCase();
        final description = notification['description']!.toLowerCase();
        return title.contains(query) || description.contains(query);
      }).toList();
    });
  }

  // Highlight matching text
  RichText highlightText(String text, String query, TextStyle style) {
    if (query.isEmpty) return RichText(text: TextSpan(text: text, style: style));

    final lowerText = text.toLowerCase();
    final lowerQuery = query.toLowerCase();
    List<TextSpan> spans = [];
    int start = 0;

    while (true) {
      final index = lowerText.indexOf(lowerQuery, start);
      if (index < 0) {
        spans.add(TextSpan(text: text.substring(start), style: style));
        break;
      }
      if (index > start) {
        spans.add(TextSpan(text: text.substring(start, index), style: style));
      }
      spans.add(TextSpan(
        text: text.substring(index, index + query.length),
        style: style.copyWith(backgroundColor: Colors.yellow.shade200),
      ));
      start = index + query.length;
    }

    return RichText(
      text: TextSpan(children: spans),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double width = screenSize.width;
    final double height = screenSize.height;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Notifications'),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.035, vertical: height * 0.02),
        child: Column(
          children: [
            // Search Bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search notifications...',
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
            SizedBox(height: height * 0.02),

            // Notification List
            Expanded(
              child: _filteredNotifications.isEmpty
                  ? Center(
                child: Text('No notifications found.', style: FTextStyles.labelText),
              )
                  : ListView.builder(
                itemCount: _filteredNotifications.length,
                itemBuilder: (context, index) {
                  final notification = _filteredNotifications[index];
                  return NotificationCard(
                    title: notification['title']!,
                    description: notification['description']!,
                    time: notification['time']!,
                    query: _searchController.text,
                    margin: EdgeInsets.symmetric(vertical: height * 0.005),
                    padding: EdgeInsets.symmetric(horizontal: width * 0.035, vertical: height * 0.015),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


