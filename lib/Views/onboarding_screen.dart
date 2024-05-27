import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../controllers/onboarding_controller.dart';
import 'onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  final OnboardingController _controller = OnboardingController();
  int _currentPage = 0;

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _nextPage() {
    if (_currentPage < 3) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _controller.handleOnboardingComplete(context);
    }
  }

  void _skipOnboarding() {
    _controller.handleOnboardingComplete(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: const [
              OnboardingPage(
                image: 'assets/images/logo.jpg',
                title: 'Welcome to Mental Health',
                description: 'Welcome to the mental health app!',
              ),
              OnboardingPage(
                image: 'assets/images/logo.jpg',
                title: 'Track Your Progress',
                description: 'Keep track of your mental health progress.',
              ),
              OnboardingPage(
                image: 'assets/images/logo.jpg',
                title: 'Stay Motivated',
                description:
                    'Stay motivated and achieve your mental health goals.',
              ),
              OnboardingPage(
                image: 'assets/images/logo.jpg',
                title: 'Stay Connected',
                description:
                    'Stay connected with others and support each other.',
              ),
            ],
          ),
          Positioned(
            bottom: 30,
            left: 16,
            right: 16,
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 4,
                  effect: WormEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: _skipOnboarding,
                      child: const Text('Skip'),
                    ),
                    ElevatedButton(
                      onPressed: _nextPage,
                      child: Text(_currentPage == 3 ? 'Get Started' : 'Next'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
