import 'package:flutter/material.dart';

class TechStackSection extends StatelessWidget {
  final Size size;

  TechStackSection({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600; // Define mobile size

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.02),

              // RichText for heading with dynamic font size
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'I have attained ',
                  style: TextStyle(
                    fontSize: isMobile ? 18 : 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: 'Expertise',
                      style: TextStyle(
                        fontSize: isMobile ? 18 : 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        foreground: Paint()
                          ..strokeWidth = 1.5
                          ..color = Colors.purpleAccent,
                      ),
                    ),
                    const TextSpan(text: ' in an array of cutting-edge '),
                    TextSpan(
                      text: 'tech stacks',
                      style: TextStyle(
                        fontSize: isMobile ? 18 : 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        foreground: Paint()
                          ..strokeWidth = 1.5
                          ..color = Colors.purpleAccent,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Subheading
              Text(
                "Empowering me to craft seamless and innovative solutions.",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: isMobile ? 16 : 20,
                  color: Colors.purpleAccent,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 32),

              // Description
              Text(
                "I have served as the Founder of growmonks, overseeing the entire project lifecycle "
                "from ideation to successful client project delivery. As a Flutter Engineer at "
                "Tickertape (10M+), I gained invaluable experience and deepened my understanding "
                "of mobile development concepts.",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontStyle: FontStyle.italic,
                  fontSize: isMobile ? 14 : 18,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 32),

              // Tech Stack Icons with dynamic columns for responsiveness
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = isMobile
                      ? 3
                      : 6; // 3 columns on mobile, 6 on larger screens

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1, // Make each cell square
                      ),
                      itemCount: techStacks.length,
                      itemBuilder: (context, index) {
                        return _buildTechStackIcon(
                          techStacks[index]['icon'] as IconData,
                          techStacks[index]['label'] as String,
                          isMobile,
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Tech stack data
  final List<Map<String, dynamic>> techStacks = [
    {'icon': Icons.flutter_dash, 'label': 'Flutter'},
    {'icon': Icons.storage, 'label': 'Firebase'},
    {'icon': Icons.code, 'label': 'NodeJS'},
    {'icon': Icons.functions_sharp, 'label': 'Docker'},
    {'icon': Icons.language, 'label': 'Typescript'},
    {'icon': Icons.cloud, 'label': 'AWS'},
  ];

  // Helper widget to create each icon with a label, adjusted for mobile
  Widget _buildTechStackIcon(IconData icon, String label, bool isMobile) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[800],
          radius: isMobile ? 28 : 36, // Adjust radius based on screen size
          child: Icon(icon, color: Colors.white, size: isMobile ? 30 : 40),
        ),
        const SizedBox(height: 8),
        FittedBox(
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: isMobile ? 12 : 14,
            ),
          ),
        ),
      ],
    );
  }
}
