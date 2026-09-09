import 'dart:async';
import 'package:flutter/material.dart';
import 'package:halal_swipe/features/onboarding/onboarding_screen.dart';
import 'package:halal_swipe/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _progressController;
  late final AnimationController _pulseController;
  late final AnimationController _glowController;

  @override
  void initState() {
    super.initState();

    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3200),
    )..forward();

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);

    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();

    _progressController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const OnboardingScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                final curvedAnimation = CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOutCubicEmphasized,
                );

                return FadeTransition(
                  opacity: CurvedAnimation(
                    parent: animation,
                    curve: const Interval(0.0, 0.7, curve: Curves.easeIn),
                  ),
                  child: ScaleTransition(
                    scale: Tween<double>(begin: 0.92, end: 1.0)
                        .animate(curvedAnimation),
                    child: child,
                  ),
                );
              },
              transitionDuration: const Duration(milliseconds: 750),
            ),
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _progressController.dispose();
    _pulseController.dispose();
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF7EBEB), // Soft warm blush top
              Color(0xFFF6E8EB), // Soft cream rose
              Color(0xFFF3DDE3), // Elegant pale rose bottom
            ],
          ),
        ),
        child: Stack(
          children: [
            // Islamic geometric lattice watermark background
            Positioned.fill(
              child: CustomPaint(
                painter: _IslamicGeometricPatternPainter(),
              ),
            ),

            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Column(
                  children: [
                    const SizedBox(height: 16),

                    // Top Badge: "INTENTIONAL MATRIMONY"
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.06),
                            blurRadius: 14,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.verified,
                            size: 16,
                            color: Color(0xFFB87333),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'INTENTIONAL MATRIMONY',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF6B4A55),
                              letterSpacing: 0.8,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Spacer(flex: 2),

                    // Center Spherical Glow with Circular Logo Card
                    Center(
                      child: Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          // Floating Sparkle 1 (Top-Right)
                          const Positioned(
                            top: -10,
                            right: 18,
                            child: Text(
                              '✨',
                              style: TextStyle(fontSize: 22),
                            ),
                          ),

                          // Floating Sparkle 2 (Bottom-Left)
                          const Positioned(
                            bottom: 12,
                            left: 8,
                            child: Text(
                              '✦',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF8B1E4B),
                              ),
                            ),
                          ),

                          // Outer Circular Ring with Soft Glow
                          AnimatedBuilder(
                            animation: _pulseController,
                            builder: (context, child) {
                              final p = _pulseController.value;
                              return Container(
                                width: 170,
                                height: 170,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFFC03664)
                                          .withValues(alpha: 0.20 + 0.12 * p),
                                      blurRadius: 40 + 15 * p,
                                      spreadRadius: 6 + 4 * p,
                                    ),
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: 0.08),
                                      blurRadius: 20,
                                      offset: const Offset(0, 8),
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.all(7),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: RadialGradient(
                                      center: Alignment(0.0, -0.3),
                                      colors: [
                                        Color(0xFF8A1842),
                                        Color(0xFF520B27),
                                      ],
                                    ),
                                  ),
                                  child: Center(
                                    // Circular badge matching auth welcome screen logo
                                    child: Container(
                                      width: 82,
                                      height: 82,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color(0xFFFFB800)
                                                .withValues(alpha: 0.45),
                                            blurRadius: 20,
                                            spreadRadius: 3,
                                          ),
                                        ],
                                      ),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          // Golden Crescent
                                          Positioned(
                                            left: 14,
                                            child: Icon(
                                              Icons.nightlight_round,
                                              size: 34,
                                              color: const Color(0xFFFFB800),
                                            ),
                                          ),
                                          // Teal Green Heart
                                          Positioned(
                                            right: 14,
                                            child: Icon(
                                              Icons.favorite_rounded,
                                              size: 20,
                                              color: const Color(0xFF00A86B),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),

                    // App Title: "Halal Swipe" with stylized serif/display look
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.5,
                        ),
                        children: [
                          TextSpan(
                            text: 'Halal ',
                            style: TextStyle(
                              color: Color(0xFF241017),
                              fontFamily: 'serif',
                            ),
                          ),
                          TextSpan(
                            text: 'Swipe',
                            style: TextStyle(
                              color: Color(0xFF8B1E4B),
                              fontFamily: 'serif',
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 6),

                    // Tagline: "Where Deen Meets Destiny"
                    const Text(
                      'Where Deen Meets Destiny',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'serif',
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFB87A38),
                        letterSpacing: 0.3,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // "100% Halal • Wali Supported • Nikah Focused" Pill Badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.85),
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        border: Border.all(
                          color: const Color(0xFFEED3DC),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Color(0xFF8B1E4B),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            '100% Halal • Wali Supported • Nikah Focused',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF4A3840),
                              letterSpacing: 0.1,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Quran Ayah Card: "And We created you in pairs."
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 16,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '“And We created you in pairs.”',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13.5,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF4A4E5A),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'SURAH AN–NABA • 78:8',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFF7A6870),
                              letterSpacing: 0.6,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Spacer(flex: 3),

                    // Progress Bar + Ahlan wa Sahlan. + 100%
                    AnimatedBuilder(
                      animation: _progressController,
                      builder: (context, child) {
                        final progress = _progressController.value;
                        final percent = (progress * 100).toInt();

                        return Column(
                          children: [
                            // Glowing Gradient Progress Line
                            ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Container(
                                width: double.infinity,
                                height: 4.5,
                                color: const Color(0xFFE8D0D8),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        progress,
                                    height: 4.5,
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFF8B1E4B),
                                          Color(0xFFD84A79),
                                          Color(0xFFFF9E00),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Ahlan wa Sahlan.',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF7A606A),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '$percent%',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF7A606A),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),

                    const SizedBox(height: 24),

                    // Bismillah Arabic Calligraphy & Subtitle
                    Column(
                      children: [
                        Text(
                          'بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF8B1E4B)
                                .withValues(alpha: 0.65),
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          'GUIDED BY FAITH • BUILT FOR NIKAH',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 9.5,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF8C737E),
                            letterSpacing: 1.1,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Subtle Islamic geometric tile watermark painter
class _IslamicGeometricPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF8B1E4B).withValues(alpha: 0.035)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    const tileSize = 60.0;
    for (double x = 0; x < size.width + tileSize; x += tileSize) {
      for (double y = 0; y < size.height + tileSize; y += tileSize) {
        // Draw decorative diamond/rotated square
        final path = Path()
          ..moveTo(x, y - tileSize / 2)
          ..lineTo(x + tileSize / 2, y)
          ..lineTo(x, y + tileSize / 2)
          ..lineTo(x - tileSize / 2, y)
          ..close();
        canvas.drawPath(path, paint);

        // Draw inner circle
        canvas.drawCircle(Offset(x, y), tileSize / 3.5, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
