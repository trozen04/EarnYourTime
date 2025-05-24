import 'dart:async';
import 'package:earn_your_time/Screens/Homepage/HomeScreen.dart';
import 'package:earn_your_time/Utils/FTextStyles.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize Animation
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Animation duration
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward(); // Start animation

    // Navigate after 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => EarnYourTimeHomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose animation controller
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Text(
            'EarnYourTime', // Large text with fade-in effect
            style: FTextStyles.largeText,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
