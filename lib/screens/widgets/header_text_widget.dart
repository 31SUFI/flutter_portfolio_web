import 'package:flutter/material.dart';
import 'package:portfolio_web/constants/colors.dart';
import 'package:portfolio_web/screens/widgets/download_cv_widget.dart';
import 'package:portfolio_web/screens/widgets/social_widget.dart';
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
            size: 26,
            fw: FontWeight.bold,
            alignment: TextAlign.center,
          ),
          if (isMobile || isTablet)
            SizedBox(height: isMobile ? 10 : 10), // Space for mobile and tablet
          GradientTextWidget(
            size: size,
            alignment: TextAlign.center,
            text1: "Mobile App Developer +",
            text2: "Web Developer",
          ),
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

class GradientTextWidget extends StatelessWidget {
  final TextAlign? alignment;
  final String? text1;
  final String? text2;
  final Color? color1;
  final Color? color2;
  final double? fsize;
  final FontWeight? fw;
  const GradientTextWidget(
      {super.key,
      required this.size,
      this.alignment,
      this.fw,
      this.color1,
      this.text1,
      this.text2,
      this.color2,
      this.fsize});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GradientText(
      textAlign: size.width < 600 && alignment != null ? alignment : null,
      "${text1}\n${text2 ?? ""}",
      colors: [
        AppColors.studio,
        AppColors.paleSlate,
      ],
      style: TextStyle(
        fontSize: size.width * 0.040,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
      ),
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
    return Container(
      width: size.width * 0.5,
      child: Row(
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
