import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_web/constants/colors.dart';
import 'package:portfolio_web/utilities/url_launcher_util.dart';

class SocialWidget extends StatelessWidget {
  const SocialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildSocialIcon(
          url: 'https://www.linkedin.com/in/muhammad-sufiyan-3179aa199/',
          icon: FontAwesomeIcons.linkedinIn,
        ),
        const SizedBox(width: 10),
        _buildSocialIcon(
          url: 'https://www.instagram.com/_just.sufi/',
          icon: FontAwesomeIcons.instagram,
        ),
        const SizedBox(width: 10),
        _buildSocialIcon(
          url: 'https://www.facebook.com/mohammadsufiyan.irshad/',
          icon: FontAwesomeIcons.facebook,
        ),
        const SizedBox(width: 10),
        _buildSocialIcon(
          url: 'https://github.com/31SUFI',
          icon: FontAwesomeIcons.github,
        ),
      ],
    );
  }

  Widget _buildSocialIcon({required String url, required IconData icon}) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.studio.withOpacity(0.5)),
      ),
      child: Center(
        child: IconButton(
          hoverColor: AppColors.paleSlate,
          onPressed: () => URLLauncher.launchURL(url), // Use the utility method
          icon: FaIcon(
            icon,
            color: AppColors.studio,
            size: 15,
          ),
        ),
      ),
    );
  }
}
