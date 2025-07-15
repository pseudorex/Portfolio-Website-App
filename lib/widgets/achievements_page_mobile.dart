import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constants/colors.dart';
import '../utils/achievements_utils.dart'; // Ensure this file defines `achievements`

class AchievementsPageMobile extends StatefulWidget {
  const AchievementsPageMobile({super.key});

  @override
  State<AchievementsPageMobile> createState() => _AchievementsPageMobileState();
}

class _AchievementsPageMobileState extends State<AchievementsPageMobile> {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  Timer? _autoSlideTimer;

  @override
  void initState() {
    super.initState();

    _autoSlideTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_pageController.hasClients) {
        int nextPage = currentIndex + 1;
        if (nextPage >= achievements.length) {
          nextPage = 0;
        }
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _autoSlideTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColor.bgLight1,
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
      child: Column(
        children: [
          Text(
            "My Achievements",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whiteSecondary,
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 450,
            child: PageView.builder(
              controller: _pageController,
              itemCount: achievements.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                final item = achievements[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: CustomColor.bgLight1,
                      border: Border.all(
                        color: CustomColor.whiteSecondary,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            item['image']!,
                            height: 300,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) => Container(
                              height: 300,
                              color: CustomColor.yellowSecondary,
                              alignment: Alignment.center,
                              child: Text(
                                "Image Not Found",
                                style: TextStyle(
                                  color: CustomColor.whitePrimary,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          item['description']!, // FIXED typo: was 'desciption'
                          style: TextStyle(
                            color: CustomColor.whitePrimary,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          SmoothPageIndicator(
            controller: _pageController,
            count: achievements.length,
            effect: WormEffect(
              dotHeight: 10,
              dotWidth: 10,
              activeDotColor: CustomColor.whitePrimary,
              dotColor: CustomColor.whiteSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
