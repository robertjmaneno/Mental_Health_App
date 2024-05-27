// lib/models/onboarding_model.dart
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingModel {
  Future<bool> get isFirstLaunch async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isFirstLaunch') ?? true;
  }

  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstLaunch', false);
  }
}
