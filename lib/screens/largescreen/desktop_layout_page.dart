import 'package:flutter/material.dart';
import 'package:portfolio_web/Introduction/presentation/widgets/social-large.dart';
import 'package:portfolio_web/constants/styles.dart';
import 'package:portfolio_web/Aboutme/presentation/widgets/about_me_widget.dart';
import 'package:portfolio_web/Introduction/presentation/widgets/header_text_widget.dart';
import 'package:portfolio_web/Projects/presentation/widgets/project_widget.dart';
import 'package:portfolio_web/Introduction/presentation/widgets/rotating_image_widget.dart';
import 'package:portfolio_web/Skills/presentation/widgets/tech_stack_widget.dart';
import 'package:portfolio_web/widgets/footer_widget.dart';

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
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 10),
              //   child: NavBar(size: size),
              // ),
              Container(
                margin: EdgeInsets.symmetric(vertical: size.height * 0.10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        HeaderTextWidget(size: size),
                        const SizedBox(height: 20),
                        Social_large(size: size),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [RotatingImageContainer()],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: size.height * 0.12),
              AboutMeWidget(size: size),
              SizedBox(height: size.height * 0.12),
              TechStackSection(size: size),

              // Projects Section
              SizedBox(height: size.height * 0.12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ProjectsSection(),
              ),
              SizedBox(height: size.height * 0.12),

              // Footer Section
              const FooterWidget(), // Add the footer at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
