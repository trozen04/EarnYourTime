import 'package:earn_your_time/Utils/AppColors.dart';
import 'package:earn_your_time/Utils/AppShadows.dart';
import 'package:earn_your_time/Utils/FTextStyles.dart';
import 'package:earn_your_time/Widgets/CustomAppBar.dart';
import 'package:earn_your_time/Widgets/CustomWidgets.dart';
import 'package:flutter/material.dart';

class SupportFAQScreen extends StatefulWidget {
  const SupportFAQScreen({super.key});

  @override
  State<SupportFAQScreen> createState() => _SupportFAQScreenState();
}

class _SupportFAQScreenState extends State<SupportFAQScreen> {
  final TextEditingController _searchController = TextEditingController();

  // List of FAQs
  final List<Map<String, String>> _faqList = [
    {
      'title': 'How does the reward system work?',
      'description': 'You earn rewards based on completing tasks, staying productive, and reaching your daily goals. Points can be redeemed for various perks.'
    },
    {
      'title': 'Can I customize my productivity goals?',
      'description': 'Yes! You can set daily, weekly, or monthly productivity targets and adjust them anytime in the settings.'
    },
    {
      'title': 'How do I sync my mobile device?',
      'description': 'Install the companion app on your mobile device and sign in with the same account. Syncing happens automatically in real-time.'
    },
    {
      'title': 'What happens to unused phone time?',
      'description': 'Unused phone time is carried over to the next day up to a limit, so you won’t lose your earned productive time.'
    },
  ];

  // Filtered list based on search
  List<Map<String, String>> _filteredFaq = [];

  @override
  void initState() {
    super.initState();
    _filteredFaq = List.from(_faqList);
    _searchController.addListener(_filterFaq);
  }

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
        style: style.copyWith(backgroundColor: Colors.yellow),
      ));
      start = index + query.length;
    }

    return RichText(
      text: TextSpan(children: spans),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }


  void _filterFaq() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredFaq = _faqList.where((faq) {
        final title = faq['title']!.toLowerCase();
        final description = faq['description']!.toLowerCase();
        return title.contains(query) || description.contains(query);
      }).toList();
    });
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
                controller: _searchController,
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
              Text('Frequently Asked Questions', style: FTextStyles.headingText),
              SizedBox(height: height * 0.01),
              ..._filteredFaq.map((faq) => TileCard(
                title: faq['title']!,
                description: faq['description'],
                leadingIcon: Icons.help_outline,
                query: _searchController.text, // pass search query for highlighting
                margin: EdgeInsets.symmetric(vertical: height * 0.005),
                padding: EdgeInsets.symmetric(horizontal: width * 0.035, vertical: height * 0.015),
              )),

              SizedBox(height: height * 0.03),

              // Contact Support Section
              Text('Contact Support', style: FTextStyles.headingText),
              SizedBox(height: height * 0.01),
              TileCard(
                title: 'Start LIVE Chat',
                leadingIcon: Icons.chat_bubble_outline,
                margin: EdgeInsets.symmetric(vertical: height * 0.005),
                padding: EdgeInsets.symmetric(horizontal: width * 0.035, vertical: height * 0.015),
              ),
              TileCard(
                title: 'Send Email',
                leadingIcon: Icons.email_outlined,
                margin: EdgeInsets.symmetric(vertical: height * 0.005),
                padding: EdgeInsets.symmetric(horizontal: width * 0.035, vertical: height * 0.015),
              ),
              TileCard(
                title: 'Schedule Call',
                leadingIcon: Icons.phone_outlined,
                margin: EdgeInsets.symmetric(vertical: height * 0.005),
                padding: EdgeInsets.symmetric(horizontal: width * 0.035, vertical: height * 0.015),
              ),

              SizedBox(height: height * 0.03),

              // Help Resources Section
              Text('Help Resources', style: FTextStyles.headingText),
              SizedBox(height: height * 0.01),
              TileCard(
                title: 'User Guide',
                leadingIcon: Icons.book_outlined,
                margin: EdgeInsets.symmetric(vertical: height * 0.005),
                padding: EdgeInsets.symmetric(horizontal: width * 0.035, vertical: height * 0.015),
              ),
              TileCard(
                title: 'Video Tutorials',
                leadingIcon: Icons.video_library_outlined,
                margin: EdgeInsets.symmetric(vertical: height * 0.005),
                padding: EdgeInsets.symmetric(horizontal: width * 0.035, vertical: height * 0.015),
              ),
              TileCard(
                title: 'Documentation',
                leadingIcon: Icons.description_outlined,
                margin: EdgeInsets.symmetric(vertical: height * 0.005),
                padding: EdgeInsets.symmetric(horizontal: width * 0.035, vertical: height * 0.015),
              ),
              TileCard(
                title: 'Community Forum',
                leadingIcon: Icons.forum_outlined,
                margin: EdgeInsets.symmetric(vertical: height * 0.005),
                padding: EdgeInsets.symmetric(horizontal: width * 0.035, vertical: height * 0.015),
              ),
              SizedBox(height: height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
