import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0), // Space from the top
        child: ListView(
          padding: EdgeInsets.zero, // To avoid additional padding at the top
          children: [
            _buildLogo(),
            _buildDrawerItem(
              context,
              icon: Icons.home,
              title: 'Home',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(), // Separating line
            _buildDrawerItem(
              context,
              icon: Icons.diamond,
              title: 'Products',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(), // Separating line
            _buildDrawerItem(
              context,
              icon: Icons.people,
              title: 'Customers',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(), // Separating line
            _buildDrawerItem(
              context,
              icon: Icons.store,
              title: 'Shop',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(), // Separating line
            _buildDrawerItem(
              context,
              icon: Icons.pie_chart,
              title: 'Income',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(), // Separating line
            _buildDrawerItem(
              context,
              icon: Icons.bike_scooter,
              title: 'Promote',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(16.0), // Padding around the logo
          child: Image.asset(
            'assets/images/google.jpeg', // Replace with your logo asset path
            height: 100, // Set height of the logo
          ),
        ),
      ],
    );
  }

  Widget _buildDrawerItem(BuildContext context,
      {required String title, IconData? icon, required VoidCallback onTap}) {
    return ListTile(
      leading: icon != null ? Icon(icon, color: Colors.black) : null,
      title: Text(title, style: const TextStyle(color: Colors.black)),
      onTap: onTap,
    );
  }
}
