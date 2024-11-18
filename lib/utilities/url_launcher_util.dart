import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class URLLauncher {
  // Static method to launch a URL
  static Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      debugPrint('Could not launch $url');
      throw 'Could not launch $url';
    }
  }
}
