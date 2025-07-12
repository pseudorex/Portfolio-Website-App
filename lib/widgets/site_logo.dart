import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';

class SiteLogo extends StatefulWidget {
  const SiteLogo({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  State<SiteLogo> createState() => _SiteLogoState();
}

class _SiteLogoState extends State<SiteLogo> {
  bool _isNameHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isNameHovered = true),
        onExit: (_) => setState(() => _isNameHovered = false),
        child: SizedBox(
          width: 150,
          child: _isNameHovered
              ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "A",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.yellowSecondary,
                  decoration: TextDecoration.underline,
                ),
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'smit Gupta',
                    textStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.yellowSecondary,
                      decoration: TextDecoration.underline,
                    ),
                    speed: Duration(milliseconds: 100),
                  ),
                ],
                totalRepeatCount: 1,
                pause: Duration.zero,
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),
            ],
          )
              : const Text(
            "AG",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.yellowSecondary,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }
}
