import 'package:flutter/material.dart';
import 'package:portfolio_web/constants/styles.dart';
import 'package:portfolio_web/screens/widgets/about_me_widget.dart';
import 'package:portfolio_web/screens/widgets/header_text_widget.dart';
import 'package:portfolio_web/screens/widgets/nav_bar.dart';
import 'package:portfolio_web/screens/widgets/project_widget.dart';
import 'package:portfolio_web/screens/widgets/rotating_image_widget.dart';
import 'package:portfolio_web/screens/widgets/tech_stack_widget.dart';
import 'package:portfolio_web/screens/widgets/footer_widget.dart'; // Import the FooterWidget

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: Styles.gradientDecoration,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: NavBar(size: size),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: size.height * 0.15),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        HeaderTextWidget(size: size),
                        SizedBox(height: 20),
                        Social_large(size: size),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [RotatingImageContainer()],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.12),
              AboutMeWidget(size: size),
              SizedBox(height: size.height * 0.12),
              TechStackSection(size: size),

              // Projects Section
              SizedBox(height: size.height * 0.12),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: ProjectsSection(),
              ),
              SizedBox(height: size.height * 0.12),

              // Footer Section
              FooterWidget(), // Add the footer at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
