import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      color:
          Colors.transparent, // You can adjust the background color as needed
      child: Center(
        child: Text(
          'Made with Flutter 💙 by Sufiyan',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white, // Text color, adjust as necessary
            fontSize: size.width > 600
                ? 18
                : 14, // Adjust font size based on screen width
          ),
        ),
      ),
    );
  }
}
