import 'package:dispatcher/core/navigation/route_names.dart';
import 'package:dispatcher/features/onboarding/presentation/ui/components/onboarding_component.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _pageIndex = 0;
  PageController _pageController = PageController(initialPage: 0);
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = <Widget>[
      OnboardingComponent(
        title: 'Pick A Meal',
        subtitle:
            'Discover the best food from over 100+ resturants and fast delivery to your doorstep',
        buttonText: 'Next',
        imageName: 'pick_a_meal.png',
        onTap: () {
          _switchToPage(1);
        },
      ),
      OnboardingComponent(
        title: 'Fast Delivery',
        subtitle:
            'Receive your order in less than an hour or pick a specific delivery time.',
        buttonText: 'Next',
        imageName: 'fast_delivery.png',
        onTap: () {
          _switchToPage(2);
        },
      ),
      OnboardingComponent(
        title: 'Enjoy Your Meal',
        subtitle:
            'Take a meal with hot, tasty, healthy food we made just for you',
        buttonText: 'Get Started',
        imageName: 'enjoy_your_meal.png',
        onTap: () {
          Navigator.of(context).pushReplacementNamed(RouteNames.LOGIN);
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          _pages[_pageIndex],
          Positioned(
            top: screenSize.height / 1.84,
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: screenSize.width / 2.31),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: WormEffect(
                  activeDotColor: Theme.of(context).primaryColor,
                  type: WormType.thin,
                ),
                onDotClicked: _switchToPage,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _switchToPage(int index) {
    setState(() {
      _pageIndex = index;
    });
  }
}
