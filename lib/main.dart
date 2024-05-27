import 'package:flutter/material.dart';
import 'package:flutter_application_1/Views/Auth/login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart'; // Import GetX package
import 'views/onboarding_screen.dart';
import 'controllers/onboarding_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mental Health',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme().apply(
          bodyColor: const Color(0xFF05044A),
          displayColor: const Color(0xFF05044A),
        ),
      ),
      home: FutureBuilder<bool>(
        future: OnboardingController().isFirstLaunch,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return snapshot.data == true
                ? const OnboardingScreen()
                : LoginPage();
          }
        },
      ),
    );
  }
}
