import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AnimatedGradientBar extends StatefulWidget {
  final double value; // 0-100 for horizontal, actual Y for vertical
  final bool isHorizontal;
  final Gradient? barGradient;
  final Color? barColor;
  final Color? backgroundColor;
  final String? label;
  final bool showTasks;
  final double height;
  final double width;

  const AnimatedGradientBar({
    super.key,
    required this.value,
    this.isHorizontal = true,
    this.barGradient,
    this.barColor,
    this.backgroundColor,
    this.label,
    this.showTasks = false,
    this.height = 12,
    this.width = 200,
  });

  @override
  State<AnimatedGradientBar> createState() => _AnimatedGradientBarState();
}

class _AnimatedGradientBarState extends State<AnimatedGradientBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isHorizontal) {
      // Horizontal style like DistributionTile
      return AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final factor = (_animation.value * widget.value) / 100;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (widget.label != null)
                Text(widget.label!, style: const TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF424242))),
              const SizedBox(width: 12),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      height: widget.height,
                      decoration: BoxDecoration(
                        color: widget.backgroundColor ?? Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(widget.height / 2),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: factor,
                      child: Container(
                        height: widget.height,
                        decoration: BoxDecoration(
                          gradient: widget.barGradient ??
                              const LinearGradient(
                                colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                          color: widget.barGradient == null ? (widget.barColor ?? Colors.blue) : null,
                          borderRadius: BorderRadius.circular(widget.height / 2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              if (widget.showTasks)
                Text('${factor * 100 ~/ 1}% • ${(factor * 100 ~/ 10)} tasks',
                    style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF616161))),
              if (!widget.showTasks)
                Text('${factor * 100 ~/ 1}%', style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF616161))),
            ],
          );
        },
      );
    } else {
      // Vertical style for BarChart
      return LayoutBuilder(
        builder: (context, constraints) {
          final maxHeight = constraints.maxHeight;
          return AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              final barHeight = maxHeight * (_animation.value * widget.value / widget.value); // normalized
              return Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: widget.width,
                  height: barHeight,
                  decoration: BoxDecoration(
                    gradient: widget.barGradient ??
                        const LinearGradient(
                          colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                    color: widget.barGradient == null ? (widget.barColor ?? Colors.blue) : null,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              );
            },
          );
        },
      );
    }

  }
}
