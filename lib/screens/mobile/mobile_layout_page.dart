import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_web/constants/colors.dart';
import 'package:portfolio_web/constants/styles.dart';
import 'package:portfolio_web/screens/widgets/download_cv_widget.dart';
import 'package:portfolio_web/screens/widgets/header_text_widget.dart';
import 'package:portfolio_web/screens/widgets/myservice_widgets.dart';
import 'package:portfolio_web/screens/widgets/rotating_image_widget.dart';
import 'package:portfolio_web/screens/widgets/social_widget.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:portfolio_web/screens/widgets/custom_drawer.dart'; // Import the custom drawer

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
      // Use the custom drawer created above
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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Icon(
                      Icons.adb, // Placeholder logo
                      color: Colors.white,
                      size: 40,
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
              Container(
                child: Column(
                  children: [
                    // Rotating image
                    Container(
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [RotatingImageContainer()],
                      ),
                    ),
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
                            Row(
                              children: [
                                HeaderTextWidget(
                                  size: size,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Social_Tab(size: size)
                          ],
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: size.width * 0.09,
                    // ),
                    // "My Quality Services" section
                    // Container(
                    //   padding:
                    //       EdgeInsets.symmetric(vertical: size.width * 0.05),
                    //   color: AppColors.ebony,
                    //   child: Column(
                    //     children: [
                    //       GradientText(
                    //         "My Quality Services",
                    //         colors: [
                    //           AppColors.studio,
                    //           AppColors.paleSlate,
                    //         ],
                    //         style: TextStyle(
                    //             fontSize: size.width *
                    //                 0.05, // Adjust font size for mobile
                    //             fontFamily: 'Poppins',
                    //             fontWeight: FontWeight.bold),
                    //       ),
                    //       SizedBox(
                    //         height: size.height * 0.02,
                    //       ),
                    //       Text(
                    //         'We put your ideas and thus your wishes in the form of a unique web project that inspires you and your customers.',
                    //         style: TextStyle(
                    //             fontSize: size.width *
                    //                 0.022, // Adjust font size for mobile
                    //             fontFamily: 'Poppins',
                    //             fontWeight: FontWeight.w400,
                    //             color: Colors.white),
                    //         textAlign: TextAlign.center,
                    //       ),
                    //       SizedBox(
                    //         height: size.height * 0.05,
                    //       ),
                    //       MyServicesWidget(size: size),
                    //     ],
                    //   ),
                    // )
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
