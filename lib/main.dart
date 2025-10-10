import 'package:earn_your_time/Screens/Notifications/NotificationScreen.dart';
import 'package:earn_your_time/Screens/Statistics/StatisticsScreen.dart';
import 'package:flutter/material.dart';
import 'Screens/CoreScreens/DigitalWellnessScreen.dart';
import 'Screens/Homepage/HomeScreen.dart'; // Assuming this is EarnYourTimeHomeScreen
import 'Screens/Legal/PrivacyPolicyScreen.dart';
import 'Screens/Legal/SupportFAQScreen.dart';
import 'Screens/StaticScreens/settings.dart';
import 'Splash.dart';
import 'Widgets/Navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,
      title: 'Habitrack',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/splash', // Set initial route
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/splash':
            return SlideRightRoute(page: SplashScreen());
          case '/statistics':
            return SlideRightRoute(page: StatisticsScreen());
          case '/home':
            return SlideRightRoute(page: const EarnYourTimeHomeScreen());
          case '/settings':
            return SlideRightRoute(page: const SettingsScreen());
          case '/digital_wellness':
            return SlideRightRoute(page: const DigitalWellnessScreen());
          case '/privacy_policy':
            return SlideRightRoute(page: const PrivacyPolicyScreen());
          case '/support_faq':
            return SlideRightRoute(page: const SupportFAQScreen());
          case '/notification':
            return SlideRightRoute(page: const NotificationScreen());

          default:
            return MaterialPageRoute(
              builder: (context) => const EarnYourTimeHomeScreen(),
            );
        }
      },
    );

  }
}