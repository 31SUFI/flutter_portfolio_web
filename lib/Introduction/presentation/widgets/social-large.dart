import 'package:flutter/material.dart';
import 'package:portfolio_web/Introduction/presentation/widgets/download_cv_widget.dart';
import 'package:portfolio_web/Introduction/presentation/widgets/social_widget.dart';

class Social_large extends StatelessWidget {
  const Social_large({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.5,
      child: const Row(
        children: [
          DownloadCVButton(),
          SizedBox(
            width: 20,
          ),
          SocialWidget()
        ],
      ),
    );
  }
}
