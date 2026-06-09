import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class OnboardingGradientBackground extends StatelessWidget {
  final Widget child ;
  const OnboardingGradientBackground({super.key
  ,required this.child
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: const BoxDecoration(
          gradient:  LinearGradient(
            colors: [AppColors.blue1 ,AppColors.blue2],
            begin:  Alignment.topLeft,
            end:  Alignment.bottomRight

          ),
        ),
      child:  Stack(
        children: [
          Positioned.fill(
              child: Opacity(
                opacity: 0.08 ,
                child: CustomPaint(
                  painter: _StripePainter(),
                ),
              ),
          ),
          child,
        ],
      ),
    );
  }
}
class _StripePainter extends CustomPainter {
  @override
  void paint ( Canvas canvas , Size size){
    final paint = Paint()..color = Colors.white ;
    const stripeWidth = 120.0;

    for (double x = -size.height ;
    x < size.width + size.height ;
    x += stripeWidth){
      final path = Path()
          ..moveTo(x, 0)
          ..lineTo(x + stripeWidth * 0.55, 0)
          ..lineTo( x + size.height + stripeWidth, size.height)
          ..lineTo(x +size.height, size.height)
          ..close();
      canvas.drawPath(path, paint);
    }
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false ;
}
