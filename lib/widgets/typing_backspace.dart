import 'dart:async';
import 'package:flutter/material.dart';

class TypingBackspacingText extends StatefulWidget {
  final List<String> textList;
  final TextStyle textStyle;
  final Duration typingSpeed;
  final Duration backspacingSpeed;
  final Duration pauseDuration;

  const TypingBackspacingText({
    super.key,
    required this.textList,
    required this.textStyle,
    this.typingSpeed = const Duration(milliseconds: 100),
    this.backspacingSpeed = const Duration(milliseconds: 50),
    this.pauseDuration = const Duration(seconds: 1),
  });

  @override
  _TypingBackspacingTextState createState() => _TypingBackspacingTextState();
}

class _TypingBackspacingTextState extends State<TypingBackspacingText> {
  late String _displayedText;
  int _currentTextIndex = 0;
  int _currentCharIndex = 0;
  bool _isTyping = true;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _displayedText = '';
    _startTyping();
  }

  void _startTyping() {
    _timer = Timer.periodic(widget.typingSpeed, (timer) {
      if (_currentCharIndex < widget.textList[_currentTextIndex].length) {
        setState(() {
          _displayedText += widget.textList[_currentTextIndex][_currentCharIndex];
          _currentCharIndex++;
        });
      } else {
        _pauseThenStartBackspacing();
        timer.cancel();
      }
    });
  }

  void _pauseThenStartBackspacing() {
    Future.delayed(widget.pauseDuration, () {
      _isTyping = false;
      _startBackspacing();
    });
  }

  void _startBackspacing() {
    _timer = Timer.periodic(widget.backspacingSpeed, (timer) {
      if (_displayedText.isNotEmpty) {
        setState(() {
          _displayedText = _displayedText.substring(0, _displayedText.length - 1);
        });
      } else {
        timer.cancel();
        _moveToNextText();
      }
    });
  }

  void _moveToNextText() {
    _currentTextIndex = (_currentTextIndex + 1) % widget.textList.length;
    _currentCharIndex = 0;
    _isTyping = true;
    _startTyping();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _displayedText,
      style: widget.textStyle,
    );
  }
}
