import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_web/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher

class DownloadCVButton extends StatelessWidget {
  const DownloadCVButton({super.key});

  // URL of your CV on Google Drive
  final String cvUrl =
      'https://docs.google.com/document/d/1Jxth5gUbLlkiJ9f0b_Q2gUw7GYNSHYMA2WvSrCJU-bk/edit?usp=drive_link';

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _launchURL(cvUrl), // Call the new method here
      child: Container(
        height: 50,
        width: 250,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.paleSlate),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Download CV",
              style: TextStyle(color: AppColors.paleSlate),
            ),
            const SizedBox.square(
              dimension: 12,
            ),
            FaIcon(
              FontAwesomeIcons.download,
              color: AppColors.paleSlate,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
