import 'package:flutter/material.dart';
import 'package:medical_health_title/core/theme/app_textstyles.dart';

class PrimaryButtons extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final Widget? icon;

  const PrimaryButtons({
    super.key,
    required this.onPressed,
    required this.backgroundColor,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          elevation: 0,
          shape: const StadiumBorder(),
        ),
        child: icon == null
            ? Text(text)
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            icon!,
            const SizedBox(width: 8),
            Text(text, style: AppTextStyles.button),
          ],
        ),
      ),
    );
  }
}
