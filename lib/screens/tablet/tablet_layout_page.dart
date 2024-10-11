import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_web/constants/colors.dart';
import 'package:portfolio_web/constants/styles.dart';
import 'package:portfolio_web/screens/widgets/about_me_widget.dart';
import 'package:portfolio_web/screens/widgets/download_cv_widget.dart';
import 'package:portfolio_web/screens/widgets/header_text_widget.dart';
import 'package:portfolio_web/screens/widgets/myservice_widgets.dart';
import 'package:portfolio_web/screens/widgets/rotating_image_widget.dart';
import 'package:portfolio_web/screens/widgets/social_widget.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class TabletLayout extends StatefulWidget {
  const TabletLayout({super.key});

  @override
  State<TabletLayout> createState() => _TabletLayoutState();
}

class _TabletLayoutState extends State<TabletLayout> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.ebony,
              ),
              child: Text(
                'Navigation',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About Us'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.work),
              title: Text('Projects'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text('Certifications'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.emoji_events),
              title: Text('Achievements'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: Styles.gradientDecoration,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Align the logo and menu button using a Row
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
                            // Use ScaffoldMessenger to avoid issues with Scaffold context
                            Scaffold.of(context)
                                .openEndDrawer(); // Opens the drawer from the right side
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
                            SizedBox(height: size.width * 0.09),
                            Row(
                              children: [
                                HeaderTextWidget(size: size),
                              ],
                            ),
                            SizedBox(height: 20),
                            Social_Tab(size: size)
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.05),
                    SizedBox(height: size.height * 0.02),
                    AboutMeWidget(size: size),
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
          SizedBox(height: 20),
          SocialWidget(),
        ],
      ),
    );
  }
}
