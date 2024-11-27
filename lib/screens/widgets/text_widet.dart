import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final TextAlign? alignment;
  final String? text;
  final Color? color;
  final double? size;
  final FontWeight? fw;
  final Size sSize;
  final bool underline; // Parameter to toggle underline
  final bool italic; // Parameter to toggle italic style

  const TextWidget({
    super.key,
    required this.sSize,
    this.size,
    this.text,
    this.color,
    this.fw,
    this.alignment,
    this.underline = false, // Default value for underline is false
    this.italic = false, // Default value for italic is false
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      textAlign: sSize.width < 600 && alignment != null ? alignment : null,
      style: TextStyle(
        fontSize: size ?? sSize.width * 0.040,
        color: color,
        fontWeight: fw,
        fontFamily: 'Poppins',
        fontStyle: italic
            ? FontStyle.italic
            : FontStyle.normal, // Apply italic conditionally
        decoration: underline
            ? TextDecoration.underline
            : TextDecoration.none, // Apply underline conditionally
      ),
    );
  }
}
