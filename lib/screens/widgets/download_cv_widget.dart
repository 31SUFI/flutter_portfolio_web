import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_web/constants/colors.dart';
import 'package:portfolio_web/utilities/url_launcher_util.dart'; // Import the utility

class DownloadCVButton extends StatefulWidget {
  const DownloadCVButton({super.key});

  // URL of your CV on Google Drive
  final String cvUrl =
      'https://drive.google.com/your_cv_link_here'; // Replace with your CV link

  @override
  _DownloadCVButtonState createState() => _DownloadCVButtonState();
}

class _DownloadCVButtonState extends State<DownloadCVButton> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) {
          setState(() => _isPressed = false);
          URLLauncher.launchURL(widget.cvUrl); // Use the utility method
        },
        onTapCancel: () => setState(() => _isPressed = false),
        child: Container(
          height: 50,
          width: 250,
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.ebony : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.paleSlate),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Download CV",
                style: TextStyle(
                  color: AppColors.paleSlate,
                  fontWeight: _isPressed ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              const SizedBox.square(dimension: 12),
              const FaIcon(
                FontAwesomeIcons.download,
                color: AppColors.paleSlate,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
