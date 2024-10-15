import 'package:flutter/material.dart';

class TechStackSection extends StatelessWidget {
  final Size size;

  TechStackSection({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600;

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.02),

              // RichText for heading
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
                'During my internship at Invision Custom Solutions, I developed a mobile app '
                'using Flutter, focusing on high-quality and scalable solutions. I worked closely '
                'with a cross-functional team to add new features, ensuring smooth functionality and '
                'integration across the app. This hands-on experience sharpened my skills in mobile '
                'development and team collaboration.',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontStyle: FontStyle.italic,
                  fontSize: isMobile ? 14 : 18,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 32),

              // Tech Stack Images with dynamic columns for responsiveness
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = isMobile ? 3 : 6;

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
                          techStacks[index]['image'] as String,
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

  // Tech stack data with image paths
  final List<Map<String, dynamic>> techStacks = [
    {'image': 'assets/images/dart.png', 'label': 'Dart'},
    {'image': 'assets/images/flutter3d.jpg.', 'label': 'Flutter'},
    {'image': 'assets/images/firebase.png', 'label': 'Firebase'},
    {'image': 'assets/images/git.png', 'label': 'Git'},
    {'image': 'assets/images/android_studio.png', 'label': 'Android Studio'},
    {'image': 'assets/images/bloc2.png', 'label': 'Bloc'},
  ];

  // Helper widget to create each icon with a label, adjusted for mobile
  Widget _buildTechStackIcon(String imagePath, String label, bool isMobile) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[800],
          radius: isMobile ? 28 : 36, // Adjust radius based on screen size
          child: ClipOval(
            // Clip image to make sure it stays inside the circular shape
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover, // Ensure the image fills the avatar
              width: isMobile
                  ? 56
                  : 72, // Adjusted width and height based on screen size
              height: isMobile ? 56 : 72,
            ),
          ),
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
