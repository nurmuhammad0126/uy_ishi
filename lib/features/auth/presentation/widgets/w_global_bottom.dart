import 'package:flutter/material.dart';

class GlobalButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final double width;
  final double height;
  final Color textColor;
  final double borderRadius;
  final double fontSize;
  final IconData? icon;

  const GlobalButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.width,
    required this.height,
    this.textColor = Colors.white,
    this.borderRadius = 12.0,
    this.fontSize = 16.0,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child:
            icon == null
                ? Text(
                  text,
                  style: TextStyle(fontSize: fontSize, color: textColor),
                )
                : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, color: Colors.blue),
                    const SizedBox(width: 8),
                    Text(
                      text,
                      style: TextStyle(fontSize: fontSize, color: textColor),
                    ),
                  ],
                ),
      ),
    );
  }
}