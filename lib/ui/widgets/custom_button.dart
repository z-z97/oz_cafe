import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final IconData? icon;
  final String? assetIconPath;
  final bool centerText;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    this.icon,
    this.assetIconPath,
    this.centerText = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget? leading;
    if (icon != null) {
      leading = Icon(icon, color: textColor, size: 20);
    } else if (assetIconPath != null) {
      leading = Image.asset(assetIconPath!, height: 20, width: 20);
    }

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: centerText
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            if (leading != null) ...[
              leading,
              const SizedBox(width: 12),
            ],
            Center(
              child: Text(
                text,
                style: TextStyle(
                   
                  color: textColor,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
