import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/typing_backspace.dart';

import '../constants/colors.dart';

// Add this constant at the top of the file or in a separate constants file
const List<String> ANIMATED_TITLES = [
  'Flutter Developer',
  'Competitive Programmer',
];


class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override

  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: screenSize.height / 1.2,
      constraints: BoxConstraints(minHeight: 350),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 30), // Adjust this value
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start, // Restore this for text alignment
              children: [
                Text(
                  "Hi,\nI'm Asmit Gupta",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
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
                        fontSize: 30,
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(
                      width: 350,
                      child: TypingBackspacingText(
                        textList: ANIMATED_TITLES,
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
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
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                    ),
                    child: Text(
                      "Get in Touch",
                      style: TextStyle(
                        color: CustomColor.whitePrimary,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Transform.translate(
            offset: Offset(0, -30), // Move up by 30 pixels
            child: Image.asset(
              'assets/images/portfolio_main_2.png',
              width: screenWidth / 4,
            ),
          ),


        ],
      ),
    );
  }
}
