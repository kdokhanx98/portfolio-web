import 'package:flutter/material.dart';

class PortfolioIcon extends StatelessWidget {
  final double size;
  final Color backgroundColor;
  final Color primaryColor;
  final Color secondaryColor;

  const PortfolioIcon({
    super.key,
    this.size = 512,
    this.backgroundColor = const Color(0xFF1E1E1E),
    this.primaryColor = const Color(0xFF64FFDA),
    this.secondaryColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: CustomPaint(
        size: Size(size, size),
        painter: PortfolioIconPainter(
          primaryColor: primaryColor,
          secondaryColor: secondaryColor,
        ),
      ),
    );
  }
}

class PortfolioIconPainter extends CustomPainter {
  final Color primaryColor;
  final Color secondaryColor;

  PortfolioIconPainter({
    required this.primaryColor,
    required this.secondaryColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.4;

    // Draw code bracket
    final bracketPath = Path()
      ..moveTo(center.dx - radius * 0.6, center.dy - radius * 0.6)
      ..lineTo(center.dx - radius * 0.3, center.dy - radius * 0.6)
      ..lineTo(center.dx + radius * 0.3, center.dy)
      ..lineTo(center.dx - radius * 0.3, center.dy + radius * 0.6)
      ..lineTo(center.dx - radius * 0.6, center.dy + radius * 0.6);

    final bracketPaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.05
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(bracketPath, bracketPaint);

    // Draw closing bracket
    final closingBracketPath = Path()
      ..moveTo(center.dx + radius * 0.6, center.dy - radius * 0.6)
      ..lineTo(center.dx + radius * 0.3, center.dy - radius * 0.6)
      ..lineTo(center.dx - radius * 0.3, center.dy)
      ..lineTo(center.dx + radius * 0.3, center.dy + radius * 0.6)
      ..lineTo(center.dx + radius * 0.6, center.dy + radius * 0.6);

    canvas.drawPath(
        closingBracketPath,
        Paint()
          ..color = secondaryColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = size.width * 0.05
          ..strokeCap = StrokeCap.round
          ..strokeJoin = StrokeJoin.round);

    // Draw dot in the center
    canvas.drawCircle(
      center,
      size.width * 0.06,
      Paint()..color = primaryColor,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
