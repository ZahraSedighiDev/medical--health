import 'package:flutter/material.dart';

class PrimaryButtons extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  final Widget? icon;

  const PrimaryButtons({
    super.key,
    required this.onPressed,
    required this.backgroundColor,
    required this.icon,
    required this.text,
    required this.textColor,
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
          foregroundColor: textColor,
          elevation: 0,
          shape: const StadiumBorder(),
        ),
        // فرزند دکمه باید اینجا قرار بگیرد، نه داخل styleFrom
        child: icon == null
            ? Text(text)
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            icon!,
            const SizedBox(width: 8),
            // مطمئن شوید AppTextStyles یک TextStyle برمی‌گرداند یا متد درستی فراخوانی شده
            Text(text, style: const TextStyle()),
          ],
        ),
      ),
    );
  }
}
