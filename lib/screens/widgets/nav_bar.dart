import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_web/constants/colors.dart';

class NavBar extends StatelessWidget {
  final Size size;

  const NavBar({required this.size});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Logo Section
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Icon(Icons.adb,
              color: Colors.white, size: 40), // Placeholder for your logo
        ),

        // Nav Links
        Row(
          children: [
            NavBarItem(text: "Home", onTap: () {}),
            NavBarItem(text: "About us", onTap: () {}),
            NavBarItem(text: "Projects", onTap: () {}),
            NavBarItem(text: "Certifications", onTap: () {}),
            NavBarItem(text: "Achievements", onTap: () {}),
          ],
        ),

        // WhatsApp Button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.studio,
                  AppColors.paleSlate,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
              child: Row(
                children: [
                  Icon(FontAwesomeIcons.whatsapp,
                      color: Colors.black, size: 20),
                  SizedBox(width: 5),
                  Text(
                    'Whatsapp',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NavBarItem extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const NavBarItem({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Poppins',
            //   fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
