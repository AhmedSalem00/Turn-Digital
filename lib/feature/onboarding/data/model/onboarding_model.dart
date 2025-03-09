class Onboarding {
  final String image;
  final String title;
  final String subtitle;

  Onboarding({required this.image, required this.title, required this.subtitle});
}

class OnboardingService {
  static final OnboardingService instance = OnboardingService._privateConstructor();

  OnboardingService._privateConstructor();

  List<Onboarding> getOnboardingModels() {
    return [
      Onboarding(
        image: 'assets/images/onboarding_one.png', // Replace with your assets
        title: "Explore Upcoming and Nearby Events",
        subtitle: "In publishing and graphic design, Lorem is a placeholder text commonly",
      ),
      Onboarding(
        image: 'assets/images/onboarding_two.png', // Replace with your assets
        title: "Web Have Modern Events Calendar Feature",
        subtitle: "Sed ut perspiciatis unde omnis iste natus voluptatem laudantium sit",
      ),
      Onboarding(
        image: 'assets/images/onboarding_one.png', // Replace with your assets
        title: "To Look Up More Events or Activities Nearby By Map",
        subtitle: "Sit voluptatem accusantium doloremque laudantium perspiciatis unde omn",
      ),
    ];
  }
}
