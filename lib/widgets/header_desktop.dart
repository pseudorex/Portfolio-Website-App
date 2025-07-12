import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/styles/style.dart';
import 'package:my_portfolio/widgets/site_logo.dart';

import '../constants/colors.dart';
import '../constants/nav_items.dart';

class HeaderDesktop extends StatefulWidget {
  const HeaderDesktop({super.key});

  @override
  State<HeaderDesktop> createState() => _HeaderDesktopState();
}

class _HeaderDesktopState extends State<HeaderDesktop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: HeaderMap,
      child: Row(
        children: [
          // Name hover effect
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SiteLogo(onTap: () {}),
          ),
          const Spacer(),
          // Navigation buttons with custom tooltips
          for (int i = 0; i < navTitles.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Tooltip(
                message: navTitles[i],
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                margin: EdgeInsets.only(top: 8),
                preferBelow: false,
                // Show above the icon
                waitDuration: Duration(milliseconds: 300),
                showDuration: Duration(seconds: 3),
                child: IconButton(
                  onPressed: () {
                    // Add your navigation logic here
                    print('Navigating to ${navTitles[i]}');
                  },
                  icon: Icon(
                    navIcons[i],
                    color: CustomColor.whitePrimary,
                    size: 24,
                  ),
                  tooltip: '',
                  // Disable default tooltip
                  splashRadius: 20,
                  hoverColor: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
