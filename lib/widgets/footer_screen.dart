import 'package:flutter/material.dart';

import '../constants/colors.dart';

class FooterScreen extends StatelessWidget {
  const FooterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      color: CustomColor.bgLight2,
      width: double.infinity,
      alignment: Alignment.center,
      child: const Text(
        "Made by Asmit Gupta using Flutter",
        style: TextStyle(
          color: Colors.white70,
          fontSize: 14,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
