import 'package:earn_your_time/Utils/AppColors.dart';
import 'package:earn_your_time/Utils/AppShadows.dart';
import 'package:earn_your_time/Utils/FTextStyles.dart';
import 'package:flutter/material.dart';

import 'animation.dart';

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
  final IconData? icon;
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
      padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: height * 0.02),
      margin: EdgeInsets.only(bottom: height * 0.02),
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
  final IconData? titleIcon;
  final bool showLargeIcon;
  final double? maxWidth;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    this.subtitle,
    this.icon,
    this.titleIcon,
    this.showLargeIcon = false,
    this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.14,
      width: MediaQuery.of(context).size.width * 0.5,
      margin: const EdgeInsets.only(right: 18), // spacing between cards
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: AppShadows.cardShadow,
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // auto height
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (showLargeIcon && icon != null) ...[
            Icon(
              icon,
              color: Colors.grey,
              size: 40, // flexible, adjust as needed
            ),
            const SizedBox(height: 8),
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: FTextStyles.labelText,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
              Icon(
                titleIcon,
                color: Colors.green,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  value,
                  style: showLargeIcon
                      ? FTextStyles.headingText
                      : FTextStyles.largeText.copyWith(fontSize: 20),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (!showLargeIcon && icon != null) ...[
                const SizedBox(width: 6),
                Icon(icon, color: Colors.amber, size: 20),
              ],
            ],
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 4),
            FittedBox(
              child: Text(
                subtitle!,
                style: FTextStyles.labelText.copyWith(color: Colors.grey),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
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
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.35,
      ),
      padding: EdgeInsets.symmetric(horizontal: width * 0.015, vertical: height * 0.02),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(8),
        boxShadow: AppShadows.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icon, color: Colors.blue, size: 24),
          SizedBox(height: height * 0.01),
          Text(title, style: FTextStyles.headingText, textAlign: TextAlign.center,),
          SizedBox(height: height * 0.01),
          Text(
            description,
            style: FTextStyles.labelText.copyWith(fontSize: 12),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

class StatisticsCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final String? change;
  final Color? iconColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final TextStyle? valueStyle;
  final TextStyle? labelStyle;
  final TextStyle? changeStyle;
  final double? maxWidth;

  const StatisticsCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
    this.change,
    this.iconColor,
    this.backgroundColor,
    this.borderColor,
    this.valueStyle,
    this.labelStyle,
    this.changeStyle,
    this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? MediaQuery.of(context).size.width * 0.35,
      ),
      margin: const EdgeInsets.only(right: 8), // right margin between cards
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor ?? Colors.grey.shade300),
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // important: height auto-adjusts
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(icon, color: iconColor ?? Colors.blue, size: 24),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  value,
                  style: valueStyle ??
                      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Flexible(
            child: Text(
              label,
              style: labelStyle ??
                  const TextStyle(fontSize: 14, color: Colors.black54),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
          if( change != null) const SizedBox(height: 14),
          Flexible(
            child: Text(
              change ?? '',
              style: changeStyle ??
                  TextStyle(
                    fontSize: 13,
                    color: change != null && change!.contains('↑') ? Colors.green : Colors.red,
                  ),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class DistributionTile extends StatelessWidget {
  final String label;
  final int percentage;
  final bool showTasks;
  final Color? barColor;
  final Gradient? barGradient;
  final Color? backgroundColor;
  final TextStyle? labelStyle;
  final TextStyle? percentageStyle;

  const DistributionTile({
    super.key,
    required this.label,
    required this.percentage,
    this.showTasks = false,
    this.barColor,
    this.barGradient,
    this.backgroundColor,
    this.labelStyle,
    this.percentageStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2575FC).withOpacity(0.12),
            blurRadius: 15,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Label
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: labelStyle ??
                  const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF424242),
                  ),
            ),
          ),

          const SizedBox(width: 12),

          // Animated Gradient Bar
          Expanded(
            flex: 5,
            child: AnimatedGradientBar(
              value: percentage.toDouble(),
              isHorizontal: true,
              barGradient: barGradient,
              barColor: barColor,
              backgroundColor: backgroundColor,
              height: 12,
              showTasks: showTasks,
            ),
          ),

          const SizedBox(width: 12),

          // Percentage Text
          SizedBox(
            width: 90,
            child: Text(
              showTasks ? '$percentage% • ${percentage ~/ 10} tasks' : '$percentage%',
              textAlign: TextAlign.end,
              style: percentageStyle ??
                  const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF616161),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class TileCard extends StatefulWidget {
  final String title;
  final String? description;
  final IconData? leadingIcon;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? iconSize;
  final String? query; // search query for highlighting

  const TileCard({
    super.key,
    required this.title,
    this.description,
    this.leadingIcon,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.borderColor,
    this.iconSize,
    this.query,
  });

  @override
  State<TileCard> createState() => _TileCardState();
}

class _TileCardState extends State<TileCard> {
  bool isExpanded = false;

  // Helper to highlight matched text
  RichText highlightText(String text, String? query, TextStyle style) {
    if (query == null || query.isEmpty) return RichText(text: TextSpan(text: text, style: style));

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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ?? const EdgeInsets.symmetric(vertical: 4),
      padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: widget.borderColor ?? AppColors.borderColor),
        color: widget.backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: AppShadows.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: widget.description != null
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  children: [
                    if (widget.leadingIcon != null) ...[
                      Icon(widget.leadingIcon, color: Colors.blue, size: widget.iconSize ?? 20),
                      const SizedBox(width: 8),
                    ],
                    Flexible(
                      child: highlightText(widget.title, widget.query, FTextStyles.labelTextDark),
                    ),
                  ],
                ),
              ),
              if (widget.description != null) ...[
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: Colors.grey,
                  ),
                ),
              ],
            ],
          ),

          if (widget.description != null && isExpanded) ...[
            const SizedBox(height: 16),
            highlightText(
              widget.description!,
              widget.query,
              FTextStyles.labelTextDark.copyWith(color: Colors.grey.shade700, fontSize: 14),
            ),
          ],
        ],
      ),
    );
  }
}

/// Reusable Notification Card
class NotificationCard extends StatelessWidget {
  final String title;
  final String description;
  final String time;
  final String? query;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const NotificationCard({
    super.key,
    required this.title,
    required this.description,
    required this.time,
    this.query,
    this.padding,
    this.margin,
  });

  RichText highlightText(String text, String? query, TextStyle style) {
    if (query == null || query.isEmpty) return RichText(text: TextSpan(text: text, style: style));

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
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(vertical: 4),
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: AppShadows.cardShadow,
      ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center, // icon stays centered
          children: [
            Icon(Icons.notifications, color: Colors.blue, size: 45),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  highlightText(title, query, FTextStyles.labelTextDark),
                  const SizedBox(height: 6),
                  highlightText(
                    description,
                    query,
                    FTextStyles.labelText.copyWith(color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // Time aligned to bottom of the row
            Container(
              height: 60, // set height same as the row/notification card
              alignment: Alignment.bottomRight,
              child: Text(
                time,
                style: FTextStyles.labelTextTimeStamp,
              ),
            ),
          ],
        )
    );
  }
}
