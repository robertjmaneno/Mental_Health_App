class OnBoarding {
  final String title;
  final String image;

  OnBoarding({
    required this.title,
    required this.image,
  });
}

List<OnBoarding> onboardingContents = [
  OnBoarding(
    title: 'Welcome to\n Mental Health',
    image: 'assets/images/logo.jpg',
  ),
  OnBoarding(
    title: 'Create new habits easily',
    image: 'assets/images/logo.jpg',
  ),
  OnBoarding(
    title: 'Keep track of your progress',
    image: 'assets/images/logo.jpg',
  ),
  OnBoarding(
    title: 'Join a supportive community',
    image: 'assets/images/logo.jpg',
  ),
];
