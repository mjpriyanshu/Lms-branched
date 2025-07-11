import 'package:flutter/material.dart';
import 'dart:math' as math;

class CelestialBackground extends StatefulWidget {
  final Widget child;

  const CelestialBackground({super.key, required this.child});

  @override
  State<CelestialBackground> createState() => _CelestialBackgroundState();
}

class _CelestialBackgroundState extends State<CelestialBackground>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  List<Star> stars = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();

    // Generate random stars
    _generateStars();
  }

  void _generateStars() {
    final random = math.Random();
    stars = List.generate(100, (index) {
      return Star(
        x: random.nextDouble(),
        y: random.nextDouble(),
        size: random.nextDouble() * 2 + 0.5,
        opacity: random.nextDouble() * 0.8 + 0.2,
        twinkleSpeed: random.nextDouble() * 2 + 1,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Celestial background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF0B1426), // Dark blue
                  Color(0xFF1A0E2E), // Deep purple
                  Color(0xFF2D1B3D), // Darker purple
                ],
                stops: [0.0, 0.5, 1.0],
              ),
            ),
          ),

          // Animated stars
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                painter: StarsPainter(stars, _controller.value),
                size: Size.infinite,
              );
            },
          ),

          // Content overlay with slight transparency to see stars
          Container(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.15)),
            child: widget.child,
          ),
        ],
      ),
    );
  }
}

class Star {
  final double x;
  final double y;
  final double size;
  final double opacity;
  final double twinkleSpeed;

  Star({
    required this.x,
    required this.y,
    required this.size,
    required this.opacity,
    required this.twinkleSpeed,
  });
}

class StarsPainter extends CustomPainter {
  final List<Star> stars;
  final double animationValue;

  StarsPainter(this.stars, this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;

    for (final star in stars) {
      // Calculate twinkling effect
      final twinkle =
          (math.sin(animationValue * 2 * math.pi * star.twinkleSpeed) + 1) / 2;
      final currentOpacity = star.opacity * twinkle * 0.8 + 0.2;

      paint.color = Colors.white.withOpacity(currentOpacity);

      final x = star.x * size.width;
      final y = star.y * size.height;

      // Draw star with slight glow effect
      canvas.drawCircle(Offset(x, y), star.size, paint);

      // Add a subtle glow
      if (currentOpacity > 0.6) {
        paint.color = Colors.white.withOpacity(currentOpacity * 0.3);
        canvas.drawCircle(Offset(x, y), star.size * 2, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
