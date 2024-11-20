import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:portfolio_web/constants/colors.dart';

class RotatingImageContainer extends StatefulWidget {
  const RotatingImageContainer({super.key});

  @override
  State<RotatingImageContainer> createState() => _RotatingImageContainerState();
}

class _RotatingImageContainerState extends State<RotatingImageContainer> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Check if the screen width is less than a certain threshold (e.g., 600px for mobile)
    bool isMobile = size.width < 600;

    // Adjust image size based on whether it's mobile or not
    double imageSize = isMobile ? size.width * 0.4 : size.width * 0.24;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300), // Smooth animation
        transform:
            Matrix4.rotationZ(isHovered ? 0 : math.pi / 36), // Rotation effect
        height: imageSize,
        width: imageSize,
        decoration: BoxDecoration(
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/profile_new.jpg'),
          ),
          border: Border.all(color: AppColors.studio, width: 1.2),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
