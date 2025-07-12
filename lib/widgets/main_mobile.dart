import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/main_desktop.dart';
import 'package:my_portfolio/widgets/typing_backspace.dart';

import '../constants/colors.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

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
                  CustomColor.scaffoldBg.withOpacity(0.5),
                  CustomColor.scaffoldBg.withOpacity(0.5),
                ],
              ).createShader(bounds);
            },
            blendMode: BlendMode.srcATop,
            child: Image.asset(
              'assets/images/portfolio_main.png',
              width: screenWidth,
              height: screenSize.height / 2.3,
            ),
          ),
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            // Adjust this value
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              // Restore this for text alignment
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
                        backspacingSpeed: Duration(
                          milliseconds: 50,
                        ),
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
                    onPressed: () {},
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
