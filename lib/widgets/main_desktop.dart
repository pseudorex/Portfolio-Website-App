import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/widgets/typing_backspace.dart';

const List<String> ANIMATED_TITLES = [
  'Flutter Developer',
  'Competitive Programmer',
];

class MainDesktop extends StatelessWidget {
  final VoidCallback onGetInTouchTap;

  const MainDesktop({super.key, required this.onGetInTouchTap});

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
            padding: const EdgeInsets.only(right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    onPressed: onGetInTouchTap,
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
            offset: Offset(0, -30),
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
