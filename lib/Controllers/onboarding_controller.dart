// lib/controllers/onboarding_controller.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Views/home_page.dart';
import '../models/onboarding_model.dart';


class OnboardingController {
  final OnboardingModel _model = OnboardingModel();

  Future<void> handleOnboardingComplete(BuildContext context) async {
    await _model.completeOnboarding();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  Future<bool> get isFirstLaunch async => await _model.isFirstLaunch;
}
