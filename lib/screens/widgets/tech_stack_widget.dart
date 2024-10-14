import 'package:flutter/material.dart';
import 'package:portfolio_web/constants/colors.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class TechStackSection extends StatelessWidget {
  final Size size; // Add a parameter for size

  const TechStackSection({super.key, required this.size}); // Constructor

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // For responsiveness: mobile if width < 600, else desktop/tablet
    bool isMobile = screenWidth < 600;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.center, // Center align the column content
        children: [
          SizedBox(height: size.height * 0.02), // Responsive spacing

          // Heading centered with RichText
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'I have attained ', // Normal text
              style: TextStyle(
                fontSize: isMobile ? 18 : 30, // Larger font for desktop
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
              children: [
                TextSpan(
                  text: 'Expertise', // Highlighted and outlined word
                  style: TextStyle(
                    fontSize: isMobile ? 18 : 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    foreground: Paint()
                      ..strokeWidth = 1.5
                      ..color = Colors.purpleAccent, // Outline color
                  ),
                ),
                TextSpan(
                  text: ' in an array of cutting-edge ', // Remaining text
                ),
                TextSpan(
                  text: 'tech stacks', // Highlighted and outlined word
                  style: TextStyle(
                    fontSize: isMobile ? 18 : 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    foreground: Paint()
                      ..strokeWidth = 1.5
                      ..color = Colors.purpleAccent, // Outline color
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 16),

          // Subheading centered
          Text(
            "Empowering me to craft seamless and innovative solutions.",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: isMobile ? 18 : 24,
              color: Colors.purpleAccent,
            ),
            textAlign: TextAlign.center, // Center align the text
          ),

          SizedBox(height: 32),

          // Description centered
          Text(
            "I have served as the Founder of growmonks, overseeing the entire project lifecycle "
            "from ideation to successful client project delivery. As a Flutter Engineer at "
            "Tickertape (10M+), I gained invaluable experience and deepened my understanding "
            "of mobile development concepts.",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontStyle: FontStyle.italic,
              fontSize: isMobile ? 16 : 20,
              color: Colors.white,
            ),
            textAlign: TextAlign.center, // Center align the text
          ),

          SizedBox(height: 32),

          // Tech Stack Icons - use a GridView for responsiveness
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 50.0), // Add padding around the grid
            child: GridView.count(
              shrinkWrap: true,
              physics:
                  NeverScrollableScrollPhysics(), // Prevent scrolling inside GridView
              crossAxisCount: isMobile ? 3 : 6, // 3 for mobile, 6 for desktop
              crossAxisSpacing: 8, // Reduced spacing between columns
              mainAxisSpacing: 8, // Reduced spacing between rows
              children: [
                _buildTechStackIcon(Icons.flutter_dash, "Flutter"),
                _buildTechStackIcon(Icons.storage, "Firebase"),
                _buildTechStackIcon(Icons.code, "NodeJS"),
                _buildTechStackIcon(Icons.functions_sharp, "Docker"),
                _buildTechStackIcon(Icons.language, "Typescript"),
                _buildTechStackIcon(Icons.cloud, "AWS"),
                // Add more icons as needed...
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget to create each icon with a label
  Widget _buildTechStackIcon(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[800],
          radius: 32, // Adjust size for a smaller circle
          child: Icon(icon, color: Colors.white, size: 36),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
