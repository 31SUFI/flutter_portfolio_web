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
        ? size.width * 0.06 // Mobile font size
        : isTablet(size)
            ? size.width * 0.040 // Tablet font size
            : size.width * 0.030; // Desktop font size

    double subheadingFontSize = isMobile(size)
        ? size.width * 0.040 // Mobile font size
        : isTablet(size)
            ? size.width * 0.03 // Tablet font size
            : size.width * 0.02; // Desktop font size

    double contentFontSize = isMobile(size)
        ? size.width * 0.03 // Mobile font size
        : isTablet(size)
            ? size.width * 0.020 // Tablet font size
            : size.width * 0.015; // Desktop font size

    return Container(
      color: AppColors.ebony,
      padding: EdgeInsets.symmetric(
        vertical: size.height * 0.05,
        horizontal: size.width * 0.08,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // About Me title
          GradientText(
            "About Me",
            colors: [AppColors.studio, AppColors.paleSlate],
            style: TextStyle(
                fontSize: titleFontSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height * 0.02),

          // Who am I? section
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

          // Main introduction text
          Text(
            "I'm Muhammad Sufiyan, a Flutter Developer, a Student, and a Technical Trainer.",
            style: TextStyle(
              fontSize: contentFontSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: size.height * 0.02),

          // Main body text
          Padding(
            padding: EdgeInsets.only(right: size.width * 0.05),
            child: Text(
              "I’m a final-year Computer Science student at Dawood University of Engineering and Technology and a national-level certified mobile app developer. I have been learning and working in mobile app development for over 2 years, during which I’ve collaborated with different organizations to help them launch their prototypes and gain practical experience. My passion for technology and education has led me to teach others, sharing my industry knowledge as a technical teacher.\n\n"
              "In addition to my academic pursuits, I have real-world industry experience, having contributed to numerous projects that combine innovative mobile solutions with modern technologies. Currently, I’m focused on advancing my skills in Flutter, AI, and machine learning, always seeking new challenges to further push my capabilities.",
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
