import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../utils/achievements_utils.dart';

class AchievementsPage extends StatefulWidget {
  const AchievementsPage({super.key});

  @override
  State<AchievementsPage> createState() => _AchievementsPageState();
}

class _AchievementsPageState extends State<AchievementsPage> {
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
      padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
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
          SizedBox(height: 30),
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
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: CustomColor.bgLight1,
                      border: Border.all(
                        color: CustomColor.whiteSecondary,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              item['image']!,
                              height: 400,
                              width: 250,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(
                                    height: 400,
                                    width: 250,
                                    color: CustomColor.whiteSecondary,
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'Image not found',
                                      style: TextStyle(
                                        color: CustomColor.whitePrimary,
                                      ),
                                    ),
                                  ),
                            ),
                          ),
                        ),

                        Container(height: 200, width: 1, color: Colors.white30),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            item['description']!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),

                    /*Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(12),
                          child: Image.asset(
                            item['image']!,
                            height: 400,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                                  height: 400,
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
                        SizedBox(height: 16,),
                        Text(
                          item['desciption']!,
                          style: TextStyle(
                            color: CustomColor.whitePrimary,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],

                  ),*/
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),

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
