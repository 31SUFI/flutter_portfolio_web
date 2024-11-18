import 'package:flutter/material.dart';
import 'package:portfolio_web/screens/largescreen/desktop_layout_page.dart';
import 'package:portfolio_web/screens/mobile/mobile_layout_page.dart';
import 'package:portfolio_web/screens/tablet/tablet_layout_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 950) {
        return const DesktopLayout();
      } else if (constraints.maxWidth >= 600 && constraints.maxWidth < 1024) {
        return const TabletLayout();
      } else {
        return const MobileLayout();
      }
    });
  }
}
