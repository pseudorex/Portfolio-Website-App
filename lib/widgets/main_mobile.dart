import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/typing_backspace.dart';

import '../constants/colors.dart';
import 'main_desktop.dart';

class MainMobile extends StatelessWidget {
  final VoidCallback onGetInTouchTap;

  const MainMobile({
    super.key,
    required this.onGetInTouchTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return Container(
      height: 700,
      constraints: BoxConstraints(minHeight: 560),
      child: Column(
        children: [
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(
                colors: [
                  CustomColor.scaffoldBg.withOpacity(0.2),
                  CustomColor.scaffoldBg.withOpacity(0.2),
                ],
              ).createShader(bounds);
            },
            blendMode: BlendMode.srcATop,
            child: Image.asset(
              'assets/images/portfolio_main_2.png',
              width: screenWidth,
              height: screenSize.height / 2.3,
            ),
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi,\nI'm Asmit Gupta",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: CustomColor.whitePrimary,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.left,
                ),
                Row(
                  children: [
                    Text(
                      "A ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: TypingBackspacingText(
                        textList: ANIMATED_TITLES,
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white,
                          height: 1.5,
                        ),
                        typingSpeed: Duration(milliseconds: 100),
                        backspacingSpeed: Duration(milliseconds: 50),
                        pauseDuration: Duration(seconds: 1),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                SizedBox(
                  width: 270,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: onGetInTouchTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                    ),
                    child: Text(
                      "Get in Touch",
                      style: TextStyle(
                        color: CustomColor.whitePrimary,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
