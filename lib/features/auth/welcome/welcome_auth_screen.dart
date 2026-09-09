import 'package:flutter/material.dart';
import 'package:halal_swipe/routes/app_routes.dart';

class WelcomeAuthScreen extends StatefulWidget {
  const WelcomeAuthScreen({super.key});

  @override
  State<WelcomeAuthScreen> createState() => _WelcomeAuthScreenState();
}

class _WelcomeAuthScreenState extends State<WelcomeAuthScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2400),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const bgTopColor = Color(0xFF9E1F4B);
    const bgBottomColor = Color(0xFF630B2E);
    const primaryButtonColor = Color(0xFFB81B55);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              bgTopColor,
              bgBottomColor,
            ],
          ),
        ),
        child: Stack(
          children: [
            // Subtle dot pattern background
            Positioned.fill(
              child: CustomPaint(
                painter: _DotPatternPainter(),
              ),
            ),

            SafeArea(
              bottom: false,
              child: Column(
                children: [
                  // Top Brand Section
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Spacer(flex: 2),

                          // Glowing Logo Card
                          AnimatedBuilder(
                            animation: _pulseController,
                            builder: (context, child) {
                              final p = _pulseController.value;
                              return Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(32),
                                  boxShadow: [
                                    // Golden outer bloom glow
                                    BoxShadow(
                                      color: const Color(0xFFFFB300)
                                          .withValues(alpha: 0.35 + 0.20 * p),
                                      blurRadius: 40 + 15 * p,
                                      spreadRadius: 8 + 4 * p,
                                    ),
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: 0.25),
                                      blurRadius: 20,
                                      offset: const Offset(0, 10),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // Crescent + Heart in center
                                      SizedBox(
                                        width: 52,
                                        height: 50,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            // Golden Crescent
                                            Positioned(
                                              left: 2,
                                              child: Icon(
                                                Icons.nightlight_round,
                                                size: 44,
                                                color: const Color(0xFFFFB800),
                                              ),
                                            ),
                                            // Teal Green Heart
                                            Positioned(
                                              right: 4,
                                              child: Icon(
                                                Icons.favorite_rounded,
                                                size: 26,
                                                color: const Color(0xFF00A86B),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      const Text(
                                        'HalalSwipes',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w900,
                                          color: Color(0xFF8B2B4C),
                                          letterSpacing: 0.2,
                                        ),
                                      ),
                                      const Text(
                                        'MATRIMONY',
                                        style: TextStyle(
                                          fontSize: 5.5,
                                          fontWeight: FontWeight.w800,
                                          color: Color(0xFF8B2B4C),
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),

                          const SizedBox(height: 24),

                          // Brand Name
                          const Text(
                            'HalalSwipes',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              letterSpacing: -0.5,
                            ),
                          ),

                          const SizedBox(height: 6),

                          // Tagline
                          Text(
                            'Halal Love. Real Connections. Worldwide.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.5,
                              fontWeight: FontWeight.w600,
                              color: Colors.white.withValues(alpha: 0.95),
                              letterSpacing: 0.1,
                            ),
                          ),

                          const SizedBox(height: 14),

                          // "• Pure Intentions • Wali Supported" Dark Glass Pill
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 6.5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.25),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white.withValues(alpha: 0.12),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 7,
                                  height: 7,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF00E676),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  'Pure Intentions • Wali Supported',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFFFFD54F)
                                        .withValues(alpha: 0.95),
                                    letterSpacing: 0.2,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const Spacer(flex: 3),
                        ],
                      ),
                    ),
                  ),

                  // Bottom Curved Sheet with Features & Buttons
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(36),
                        topRight: Radius.circular(36),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.20),
                          blurRadius: 30,
                          offset: const Offset(0, -6),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
                    child: SafeArea(
                      top: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // 4 Pillars Grid with Circular Pastel Badges
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildCircleFeatureItem(
                                bgColor: const Color(0xFFFFF9E6),
                                icon: Icons.lock_rounded,
                                iconColor: const Color(0xFFE5A800),
                                label: 'Blurred\nProfiles',
                              ),
                              _buildCircleFeatureItem(
                                bgColor: const Color(0xFFE8F8F2),
                                icon: Icons.verified_rounded,
                                iconColor: const Color(0xFF00B67A),
                                label: 'ID\nVerified',
                              ),
                              _buildCircleFeatureItem(
                                bgColor: const Color(0xFFEBF7FF),
                                icon: Icons.diamond_outlined,
                                iconColor: const Color(0xFF2D9CDB),
                                label: 'Marriage\nFocused',
                              ),
                              _buildCircleFeatureItem(
                                bgColor: const Color(0xFFFFEEF3),
                                icon: Icons.favorite_rounded,
                                iconColor: const Color(0xFFD81B60),
                                label: 'Halal\nCourtship',
                              ),
                            ],
                          ),

                          const SizedBox(height: 18),

                          // Free Trial Banner pill
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 14,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF4F7),
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: const Color(0xFFFFDDE6),
                                width: 1,
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('🎉', style: TextStyle(fontSize: 16)),
                                SizedBox(width: 8),
                                Text(
                                  'First month completely FREE',
                                  style: TextStyle(
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF2C101A),
                                  ),
                                ),
                                Text(
                                  ' — No card needed',
                                  style: TextStyle(
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFFB81B55),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 16),

                          // "Create Free Account" Filled Button
                          SizedBox(
                            width: double.infinity,
                            height: 52,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, AppRoutes.signup);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryButtonColor,
                                foregroundColor: Colors.white,
                                elevation: 3,
                                shadowColor:
                                    primaryButtonColor.withValues(alpha: 0.35),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: const Text(
                                'Create Free Account',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 0.1,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),

                          // "I already have an account" Outlined Button
                          SizedBox(
                            width: double.infinity,
                            height: 52,
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, AppRoutes.login);
                              },
                              style: OutlinedButton.styleFrom(
                                foregroundColor: primaryButtonColor,
                                side: const BorderSide(
                                  color: primaryButtonColor,
                                  width: 1.6,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: const Text(
                                'I already have an account',
                                style: TextStyle(
                                  fontSize: 15.5,
                                  fontWeight: FontWeight.w800,
                                  color: primaryButtonColor,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),

                          // "Instant Demo Login (1-Click)" Soft Button
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  AppRoutes.home,
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                backgroundColor: const Color(0xFFFFF8F6),
                                side: const BorderSide(
                                  color: Color(0xFFFFDCD2),
                                  width: 1.2,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '⚡',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFFFF6D00),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Instant Demo Login (1–Click)',
                                    style: TextStyle(
                                      fontSize: 14.5,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFF381B24),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Terms Footer
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 11.5,
                                color: Color(0xFF7A7D87),
                                height: 1.3,
                              ),
                              children: [
                                const TextSpan(
                                    text: 'By signing up you agree to our '),
                                TextSpan(
                                  text: 'Terms',
                                  style: TextStyle(
                                    color: Colors.grey.shade800,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const TextSpan(text: ' & '),
                                TextSpan(
                                  text: 'Privacy Policy',
                                  style: TextStyle(
                                    color: Colors.grey.shade800,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const TextSpan(text: '. 18+ only.'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildCircleFeatureItem({
    required Color bgColor,
    required IconData icon,
    required Color iconColor,
    required String label,
  }) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: bgColor,
            shape: BoxShape.circle,
            border: Border.all(
              color: iconColor.withValues(alpha: 0.25),
              width: 1,
            ),
          ),
          child: Center(
            child: Icon(
              icon,
              size: 23,
              color: iconColor,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 11,
            height: 1.15,
            fontWeight: FontWeight.w700,
            color: Color(0xFF3A3D48),
          ),
        ),
      ],
    );
  }
}

/// Dotted grid background painter
class _DotPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.05)
      ..style = PaintingStyle.fill;

    const spacing = 26.0;
    for (double x = 13; x < size.width; x += spacing) {
      for (double y = 13; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), 1.1, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
