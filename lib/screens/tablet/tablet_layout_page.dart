import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_web/constants/colors.dart';
import 'package:portfolio_web/constants/styles.dart';
import 'package:portfolio_web/screens/widgets/about_me_widget.dart';
import 'package:portfolio_web/screens/widgets/custom_drawer.dart';
import 'package:portfolio_web/screens/widgets/download_cv_widget.dart';
import 'package:portfolio_web/screens/widgets/footer_widget.dart';
import 'package:portfolio_web/screens/widgets/header_text_widget.dart';
import 'package:portfolio_web/screens/widgets/project_widget.dart';
import 'package:portfolio_web/screens/widgets/rotating_image_widget.dart';
import 'package:portfolio_web/screens/widgets/social_widget.dart';
import 'package:portfolio_web/screens/widgets/tech_stack_widget.dart';

class TabletLayout extends StatefulWidget {
  const TabletLayout({super.key});

  @override
  State<TabletLayout> createState() => _TabletLayoutState();
}

class _TabletLayoutState extends State<TabletLayout> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Define appropriate spacing before the footer based on screen width
    double footerSpacing =
        size.width * 0.05; // Responsive SizedBox before FooterWidget

    return Scaffold(
      drawer: const CustomDrawer(),
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
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Builder(
                      builder: (context) {
                        return IconButton(
                          iconSize: 30.0, // Adjust the size of the icon
                          icon: FaIcon(
                            FontAwesomeIcons.bars, // Hamburger menu icon
                            color: Colors.white, // Set icon color
                          ),
                          onPressed: () {
                            // Opens the drawer from the right side
                            Scaffold.of(context).openEndDrawer();
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),

              // Main content
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [RotatingImageContainer()],
                              ),
                            ),
                            SizedBox(
                                height: size.width *
                                    0.09), // Spacing for visual balance
                            Row(
                              children: [
                                HeaderTextWidget(size: size),
                              ],
                            ),
                            SizedBox(height: 20),
                            Social_Tab(size: size),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                        height: size.height * 0.05), // Spacing before About Me
                    AboutMeWidget(size: size),
                    SizedBox(
                        height: size.height * 0.02), // Spacing after About Me
                    TechStackSection(size: size),
                    SizedBox(
                        height: size.height *
                            0.05), // Spacing before Projects Section

                    // Add the ProjectsSection here
                    ProjectsSection(), // This will display the project cards

                    SizedBox(
                        height:
                            footerSpacing), // Responsive spacing before Footer
                    FooterWidget(),
                  ],
                ),
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
          DownloadCVButton(),
          const SizedBox(height: 20),
          const SocialWidget(),
        ],
      ),
    );
  }
}
