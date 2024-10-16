import 'package:flutter/material.dart';
import 'package:portfolio_web/constants/colors.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ProjectsSection extends StatelessWidget {
  final List<ProjectCard> projects = [
    ProjectCard(
      title: 'Project 01',
      description: 'A delightful coffee adventure...',
    ),
    ProjectCard(
      title: 'Project 02',
      description: 'A user-friendly mobile application...',
    ),
    ProjectCard(
      title: 'Project 03',
      description: 'An open-source project for time management...',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleFontSize = size.width < 600 ? 24.0 : 32.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate dynamic horizontal padding based on screen width
        double horizontalPadding = constraints.maxWidth < 600
            ? 16.0 // Mobile
            : constraints.maxWidth < 1100
                ? 48.0 // Tablet
                : 80.0; // Desktop

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.02), // Space above the heading

            // Centered GradientText
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: GradientText(
                  "Projects",
                  colors: [AppColors.studio, AppColors.paleSlate],
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            SizedBox(height: size.height * 0.02), // Space below the heading

            // Conditional grid layout based on screen width
            if (constraints.maxWidth >= 1100)
              // Desktop view: 3 columns
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), // Avoid inner scroll
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                  childAspectRatio: 4 / 3, // Maintain square-ish cards
                ),
                itemCount: projects.length,
                itemBuilder: (context, index) => projects[index],
              )
            else if (constraints.maxWidth >= 700)
              // Tablet view: 2 columns
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), // Avoid inner scroll
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                  childAspectRatio: 4 / 3, // Maintain square-ish cards
                ),
                itemCount: projects.length,
                itemBuilder: (context, index) => projects[index],
              )
            else
              // Mobile view: 1 column but smaller and centered
              Center(
                child: Container(
                  width: constraints.maxWidth *
                      0.8, // Restrict width to 80% of screen
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics:
                        NeverScrollableScrollPhysics(), // Avoid inner scroll
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 16.0,
                      crossAxisSpacing: 16.0,
                      childAspectRatio: 3 / 2, // Adjusted to be less square
                    ),
                    itemCount: projects.length,
                    itemBuilder: (context, index) => projects[index],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;

  const ProjectCard({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.ebony, // Set the inside color to black
        borderRadius: BorderRadius.circular(20), // Rounded corners
        border: Border.all(
          width: 2, // Border thickness
          color: Colors.black, // Border color
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.studio.withOpacity(0.5), // Outer glow shadow color
            spreadRadius: 4, // Spread effect
            blurRadius: 10, // Blur effect to soften the shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            // Center the title
            child: Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            // Ensure description takes available space and is centered
            child: Center(
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center, // Center the text description
              ),
            ),
          ),
          Spacer(), // Pushes the bottom row to the end
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Check on Github",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              Text(
                "Read More >>",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.yellowAccent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
