import 'package:flutter/material.dart';
import 'package:healthyapp/screens/home_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var pages = [
    PageViewModel(
      title: "Title of the first page",
      body:
          "Here you  can write the description of the page, to explain something...",
      image: Center(
        child: Image.asset(
          "assets/onboarding1.png",
          height: 279.0,
        ),
      ),
      decoration: const PageDecoration(
        pageColor: Color(0xFF192A56),
        bodyTextStyle: TextStyle(color: Colors.white, fontSize: 16),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
      ),
    ),
    PageViewModel(
      title: "Title of the second page",
      body:
          "Here you  can write the description of the page, to explain something...",
      image: Center(
        child: Image.asset(
          "assets/onboarding2.png",
          height: 279.0,
        ),
      ),
      decoration: const PageDecoration(
        pageColor: Color(0xFF192A56),
        bodyTextStyle: TextStyle(color: Colors.white, fontSize: 16),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
      ),
    ),
    PageViewModel(
      title: "Title of the third page",
      body:
          "Here you  can write the description of the page, to explain something...",
      image: Center(
        child: Image.asset(
          "assets/onboarding3.png",
          height: 279.0,
        ),
      ),
      decoration: const PageDecoration(
        pageColor: Color(0xFF192A56),
        bodyTextStyle: TextStyle(color: Colors.white, fontSize: 16),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: const Color(0xFF192A56),
        pages: pages,
        onDone: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: ((context) => const HomeScreen()),
            ),
          );
        },
        onSkip: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: ((context) => const HomeScreen()),
            ),
          );
        },
        showSkipButton: true,
        skip: const Icon(
          Icons.skip_previous,
          color: Colors.white,
        ),
        next: const Icon(
          Icons.skip_next,
          color: Colors.white,
        ),
        done: const Text(
          "Done",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: Colors.green,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
      ),
    );
  }
}
