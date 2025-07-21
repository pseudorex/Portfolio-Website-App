import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/nav_items.dart';
import 'package:my_portfolio/styles/style.dart';
import 'package:my_portfolio/widgets/site_logo.dart';

class HeaderDesktop extends StatefulWidget {
  const HeaderDesktop({super.key, required this.onTapMenuOpt});
  final Function(int) onTapMenuOpt;

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
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SiteLogo(onTap: () => widget.onTapMenuOpt(0)),
          ),
          const Spacer(),
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
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                margin: const EdgeInsets.only(top: 8),
                preferBelow: false,
                waitDuration: const Duration(milliseconds: 300),
                showDuration: const Duration(seconds: 3),
                child: IconButton(
                  onPressed: () => widget.onTapMenuOpt(i),
                  icon: Icon(
                    navIcons[i],
                    color: CustomColor.whitePrimary,
                    size: 24,
                  ),
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
