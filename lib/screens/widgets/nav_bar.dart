import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final Size size;

  const NavBar({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100, // You can adjust this height based on your needs
      padding: const EdgeInsets.symmetric(
          horizontal: 20.0), // Horizontal padding only
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align the logo to the top
        children: [
          // Logo at top left with no extra padding
          Image.asset(
            "assets/images/logo.png",
            height: 100, // Increase the size of the logo here
            width:
                100, // You can increase the size, but without adding top space
            fit: BoxFit
                .contain, // Ensures the image fits within the height and width
          ),

          // Nav Links aligned to the right
          Row(
            children: [
              NavBarItem(text: "Home", onTap: () {}),
              NavBarItem(text: "About us", onTap: () {}),
              NavBarItem(text: "Projects", onTap: () {}),
              NavBarItem(text: "Certifications", onTap: () {}),
              NavBarItem(text: "Achievements", onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const NavBarItem({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
