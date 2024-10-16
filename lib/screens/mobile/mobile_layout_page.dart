import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:portfolio_web/constants/styles.dart';
import 'package:portfolio_web/screens/widgets/about_me_widget.dart';
import 'package:portfolio_web/screens/widgets/download_cv_widget.dart';
import 'package:portfolio_web/screens/widgets/header_text_widget.dart';
import 'package:portfolio_web/screens/widgets/project_widget.dart';
import 'package:portfolio_web/screens/widgets/rotating_image_widget.dart';
import 'package:portfolio_web/screens/widgets/social_widget.dart';
import 'package:portfolio_web/screens/widgets/custom_drawer.dart';
import 'package:portfolio_web/screens/widgets/tech_stack_widget.dart';
// Import ProjectsSection

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const CustomDrawer(), // Custom drawer

      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: Styles.gradientDecoration,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Row for Logo on the left and Menu button on the right
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left-aligned logo
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 100,
                      width: 100,
                    ),
                  ),
                  // Right-aligned menu button (drawer icon)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Builder(
                      builder: (context) {
                        return IconButton(
                          iconSize: 30.0, // Adjust the size of the icon
                          icon: const FaIcon(
                            FontAwesomeIcons.bars, // Hamburger menu icon
                            color: Colors.white, // Set icon color
                          ),
                          onPressed: () {
                            // Opens the drawer from the left side
                            Scaffold.of(context).openDrawer();
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),

              // Main content
              Column(
                children: [
                  // Rotating image
                  const RotatingImageContainer(),

                  SizedBox(
                    height: size.width * 0.09,
                  ),

                  // Header text and social tab
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          HeaderTextWidget(size: size),
                          const SizedBox(height: 20),
                          Social_Tab(size: size)
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: size.width * 0.09),

                  // About me section
                  AboutMeWidget(size: size),

                  SizedBox(height: size.width * 0.02),

                  // Tech stack section
                  TechStackSection(size: size),

                  SizedBox(height: size.width * 0.05),

                  // Projects Section
                  ProjectsSection(), // Add the ProjectsSection widget here
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Social_Tab extends StatelessWidget {
  const Social_Tab({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Add your widgets for social media here
          DownloadCVButton(),
          const SizedBox(
            height: 20,
          ),
          const SocialWidget(),
        ],
      ),
    );
  }
}
