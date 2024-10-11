import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:portfolio_web/constants/colors.dart';

class AboutMeWidget extends StatelessWidget {
  final Size size;

  const AboutMeWidget({super.key, required this.size});

  // Helper function to determine if the device is mobile, tablet, or desktop
  bool isMobile(Size size) => size.width < 600;
  bool isTablet(Size size) => size.width >= 600 && size.width < 1024;

  @override
  Widget build(BuildContext context) {
    // Set font sizes based on screen width
    double titleFontSize = isMobile(size)
        ? size.width * 0.06
        : isTablet(size)
            ? size.width * 0.05
            : size.width * 0.03;
    double subheadingFontSize = isMobile(size)
        ? size.width * 0.045
        : isTablet(size)
            ? size.width * 0.050
            : size.width * 0.015;
    double contentFontSize = isMobile(size)
        ? size.width * 0.04
        : isTablet(size)
            ? size.width * 0.0100
            : size.width * 0.012;

    return Container(
      color: AppColors.ebony,
      padding: EdgeInsets.symmetric(
        vertical: size.height * 0.05,
        horizontal: size.width *
            0.08, // Padding to avoid text being too close to the left
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align content to the left
        children: [
          // About Me title with dynamic font size
          GradientText(
            "About Me",
            colors: [
              AppColors.studio,
              AppColors.paleSlate,
            ],
            style: TextStyle(
                fontSize: titleFontSize, // Adjusted for responsiveness
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height * 0.03), // Spacing after the title

          // Who am I? section with dynamic font size
          Text(
            'Who am I?',
            style: TextStyle(
              fontSize: subheadingFontSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              color: Colors.redAccent,
            ),
          ),
          SizedBox(height: size.height * 0.02),

          // Main introduction text with dynamic font size
          Text(
            "I'm Muhammad Sufiyan, a Flutter developer, Student and technical trainer.",
            style: TextStyle(
              fontSize: contentFontSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: size.height * 0.02),

          // Main body text with dynamic font size and proper padding
          Padding(
            padding: EdgeInsets.only(right: size.width * 0.05),
            child: Text(
              "I'm a Fresh Graduate with Computer Science as Majors from COMSATS University, Islamabad. I have been developing mobile apps for over 2 years now. I have worked in teams for various startups and helped them in launching their prototypes and got valuable learning experience. "
              "Been a former Google Developer Student Clubs (DSC) lead and also CEO/Co-Founder Flutter Islamabad, Pakistan. Currently working as Associate Software Engineer at Sastaticket.pk.",
              style: TextStyle(
                fontSize: contentFontSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
