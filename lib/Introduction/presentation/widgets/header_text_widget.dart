import 'package:flutter/material.dart';
import 'dart:async';
import 'package:portfolio_web/constants/colors.dart';
import 'package:portfolio_web/Introduction/presentation/widgets/download_cv_widget.dart';
import 'package:portfolio_web/Introduction/presentation/widgets/social_widget.dart';
import 'package:portfolio_web/screens/widgets/text_widet.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HeaderTextWidget extends StatelessWidget {
  final Size size;
  const HeaderTextWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    bool isMobile = size.width < 600;
    bool isTablet = size.width >= 600 && size.width < 1024;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: size.width * 0.07,
      ),
      child: Column(
        crossAxisAlignment: isMobile || isTablet
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextWidget(
            sSize: size,
            text: "I'm Muhammad Sufiyan,",
            color: Colors.white,
            size: 25,
            fw: FontWeight.bold,
            alignment: TextAlign.center,
          ),
          if (isMobile || isTablet)
            SizedBox(height: isMobile ? 10 : 10), // Space for mobile and tablet
          TypingTextSwitcher(size: size), // Typing effect widget
          if (isMobile || isTablet)
            SizedBox(height: isMobile ? 10 : 10), // Space for mobile and tablet
          SizedBox(
            width: size.width *
                (isMobile ? 0.8 : 0.7), // Adjust text width for mobile/tablet
            child: TextWidget(
              sSize: size,
              alignment: TextAlign.center,
              text:
                  "I break down complex user experience problems to create integrity-focused solutions that connect billions of people",
              size: 16,
              color: Colors.white,
              fw: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

// Typing effect for gradient text
class TypingTextSwitcher extends StatefulWidget {
  final Size size;
  const TypingTextSwitcher({super.key, required this.size});

  @override
  _TypingTextSwitcherState createState() => _TypingTextSwitcherState();
}

class _TypingTextSwitcherState extends State<TypingTextSwitcher> {
  final List<String> professions = [
    'Mobile App Developer',
    'Web Developer',
    'Flutter Enthusiast',
  ];

  int _currentIndex = 0;
  String _currentText = '';
  bool _isTyping = true;
  int _textCharIndex = 0;
  Timer? _typingTimer;

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  void _startTyping() {
    _typingTimer =
        Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
      if (!mounted) {
        return; // Check if the widget is still mounted before calling setState
      }

      setState(() {
        if (_isTyping) {
          if (_textCharIndex < professions[_currentIndex].length) {
            _currentText += professions[_currentIndex][_textCharIndex];
            _textCharIndex++;
          } else {
            _isTyping = false;
            Future.delayed(const Duration(seconds: 1), _startTyping);
            _typingTimer?.cancel();
          }
        } else {
          if (_textCharIndex > 0) {
            _textCharIndex--;
            _currentText = _currentText.substring(0, _textCharIndex);
          } else {
            _isTyping = true;
            _currentIndex = (_currentIndex + 1) % professions.length;
            _typingTimer?.cancel();
            _startTyping();
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _typingTimer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.play_arrow,
          color: Colors.red, // Match the red play button
        ),
        const SizedBox(width: 8), // Space between the icon and text
        GradientText(
          _currentText,
          colors: const [
            AppColors.studio,
            AppColors.paleSlate,
          ],
          style: TextStyle(
            fontSize: widget.size.width * 0.040,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
          textAlign: widget.size.width < 600 ? TextAlign.center : null,
        ),
      ],
    );
  }
}

class Social_large extends StatelessWidget {
  const Social_large({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.5,
      child: const Row(
        children: [
          DownloadCVButton(),
          SizedBox(
            width: 20,
          ),
          SocialWidget()
        ],
      ),
    );
  }
}
