import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AchievementsCarousel extends StatefulWidget {
  const AchievementsCarousel({super.key});

  @override
  State<AchievementsCarousel> createState() => _AchievementsCarouselState();
}

class _AchievementsCarouselState extends State<AchievementsCarousel> {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  Timer? _autoSlideTimer;

  final List<Map<String, String>> achievements = [
    {
      'image': 'assets/images/maza.JPG',
      'description': 'Selected among top 10 innovators at XYZ Hackathon 2024.',
    },
    {
      'image': 'assets/images/project1.jpg',
      'description': 'Winner of Coding Marathon at ABC Institute.',
    },
    {
      'image': 'assets/images/project1.jpg',
      'description':
          'Speaker at FlutterCon India 2025 on Mobile App Development.',
    },
  ];

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
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      color: Colors.black87,
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Column(
        children: [
          const Text(
            'My Achievements',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 30),

          /// SLIDER
          SizedBox(
            height: isMobile ? 350 : 270,
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
                      color: Colors.black.withOpacity(0.2),
                      border: Border.all(color: Colors.white, width: 1.5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: isMobile
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  item['image']!,
                                  height: 180,
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(
                                        height: 180,
                                        color: Colors.grey[800],
                                        alignment: Alignment.center,
                                        child: const Text(
                                          'Image not found',
                                          style: TextStyle(
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                item['description']!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              /// Left Image
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    item['image']!,
                                    height: 250,
                                    width: 150,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Container(
                                              height: 250,
                                              width: 150,
                                              color: Colors.grey[800],
                                              alignment: Alignment.center,
                                              child: const Text(
                                                'Image not found',
                                                style: TextStyle(
                                                  color: Colors.white70,
                                                ),
                                              ),
                                            ),
                                  ),
                                ),
                              ),

                              /// Vertical Line Separator
                              Container(
                                height: 200,
                                width: 1,
                                color: Colors.white30,
                              ),

                              /// Right Text
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
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          /// DOT INDICATOR
          SmoothPageIndicator(
            controller: _pageController,
            count: achievements.length,
            effect: const WormEffect(
              dotHeight: 10,
              dotWidth: 10,
              activeDotColor: Colors.white,
              dotColor: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
