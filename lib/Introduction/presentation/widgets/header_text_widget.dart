// lib/Introduction/presentation/widgets/header_text_widget.dart
import 'package:flutter/material.dart';
import 'package:portfolio_web/Introduction/presentation/widgets/TypingTextSwitcher.dart';
import 'package:portfolio_web/screens/widgets/text_widet.dart';

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
          TypingTextSwitcher(
              size: size), // TypingTextSwitcher from the new file
          if (isMobile || isTablet)
            SizedBox(height: isMobile ? 10 : 10), // Space for mobile and tablet
          SizedBox(
            width: size.width *
                (isMobile ? 0.8 : 0.7), // Adjust text width for mobile/tablet
            child: TextWidget(
              italic: true,
              sSize: size,
              alignment: TextAlign.center,
              text:
                  "Can turn innovative ideas into impactful mobile solutions with a blend of code, creativity, and user-focused design.",
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
