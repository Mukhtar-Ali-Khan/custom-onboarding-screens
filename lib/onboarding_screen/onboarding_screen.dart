import 'package:custom_onboarding_screens/Login_screen.dart';
import 'package:custom_onboarding_screens/models/landig_page_model.dart';
import 'package:custom_onboarding_screens/onboarding_screen/widgets/onBoardin_screen_button.dart';
import 'package:custom_onboarding_screens/resources/app%20assets/app_assets.dart';
import 'package:custom_onboarding_screens/resources/app_texts.dart';
import 'package:custom_onboarding_screens/widgets/landingPage_dots.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int initialPage = 0;
  final PageController pageController = PageController(initialPage: 0);

  List<LandingPageModel> pages = [
    LandingPageModel(
        title: 'Cloud Storage',
        body: AppText.landingPageBody,
        asset: AppAssets.page2),
    LandingPageModel(
        title: 'Sharing Cloud',
        body: AppText.landingPageBody,
        asset: AppAssets.page1),
    LandingPageModel(
        title: 'Cloud Computing',
        body: AppText.landingPageBody,
        asset: AppAssets.page3),
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff191970),
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: pages.length,
            onPageChanged: (index) {
              setState(() {
                initialPage = index;
              });
            },
            itemBuilder: (context, index) {
              var page = pages[index];
              return Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20).copyWith(
                      top: 50,
                    ),
                    child: Lottie.asset(
                      page.asset,
                      height: 250,
                      width: size.width - 60,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20).copyWith(
                      top: 20,
                    ),
                    child: Text(
                      page.title.toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30).copyWith(
                      top: 12,
                    ),
                    child: Text(
                      page.body,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.white,
                          height: 1.7),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              );
            },
          ),

          /// Landing page dots,
          Positioned(
            bottom: size.height * 0.28,
            child: SizedBox(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < pages.length; i++)
                    if (i == initialPage)
                      const LandingPageDots(isActive: true)
                    else
                      const LandingPageDots()
                ],
              ),
            ),
          ),

          /// Landing Buttons
          Positioned(
            bottom: 40,
            child: SizedBox(
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  OnBoardingScreenButton(
                    buttonName: 'Get Started',
                    color: Colors.orange,
                    onTap: () {
                      if (initialPage == 0) {
                        pageController.animateToPage(1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      }
                      if (initialPage == 1) {
                        pageController.animateToPage(2,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      }
                      if (initialPage == 2) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  OnBoardingScreenButton(
                    buttonName: 'Login',
                    enableBorder: true,
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
