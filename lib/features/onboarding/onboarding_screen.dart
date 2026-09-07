import 'package:flutter/material.dart';

class OnboardingModel {
  final Widget iconWidget;
  final String title;
  final String description;
  final Color bgStartColor;
  final Color bgEndColor;
  final Color buttonTextColor;

  const OnboardingModel({
    required this.iconWidget,
    required this.title,
    required this.description,
    required this.bgStartColor,
    required this.bgEndColor,
    required this.buttonTextColor,
  });
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  late final List<OnboardingModel> _pages = [
    // 1st Screen: Smart Compatibility Matching
    OnboardingModel(
      iconWidget: _buildGlowingStar3D(),
      title: 'Smart Compatibility\nMatching',
      description:
          'We calculate real compatibility across Deen,\nFamily, Lifestyle, and more. Only show you\npeople who genuinely match what you need\nin a spouse.',
      bgStartColor: const Color(0xFFD84A79),
      bgEndColor: const Color(0xFFC03664),
      buttonTextColor: const Color(0xFFD84A79),
    ),

    // 2nd Screen: Privacy First. Always.
    OnboardingModel(
      iconWidget: _buildGlowingLock3D(),
      title: 'Privacy First.\nAlways.',
      description:
          'Noor Shield adds screenshot protection\nacross supported areas. Your extra photos\nstay blurred until you choose to unlock a\nmatch.',
      bgStartColor: const Color(0xFF9E2C52),
      bgEndColor: const Color(0xFF801E3E),
      buttonTextColor: const Color(0xFF9E2C52),
    ),

    // 3rd Screen: Meet Azura Your Marriage Guide
    OnboardingModel(
      iconWidget: _buildGlowingSparkles3D(),
      title: 'Meet Azura\nYour Marriage Guide',
      description:
          'Azura uses AI to provide match-aware\nmarriage guidance. She helps you ask the\nright questions. You make the decision.',
      bgStartColor: const Color(0xFF1E1A34),
      bgEndColor: const Color(0xFF120E22),
      buttonTextColor: const Color(0xFFD84A79),
    ),

    // 4th Screen: First Month Completely FREE
    OnboardingModel(
      iconWidget: _buildPartyPopper3D(),
      title: 'First Month\nCompletely FREE',
      description:
          'No credit card. No commitment. No risk. 30\ndays of access — join Muslims worldwide\nfinding real halal connections.',
      bgStartColor: const Color(0xFF007554),
      bgEndColor: const Color(0xFF004D36),
      buttonTextColor: const Color(0xFFD84A79),
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNextPressed() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
      );
    } else {
      Navigator.pushReplacementNamed(context, '/welcome-auth');
    }
  }

  void _onSkipPressed() {
    Navigator.pushReplacementNamed(context, '/welcome-auth');
  }

  void _onSignInPressed() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  // --- 3D Icon 1: Shooting / Glowing Star ---
  static Widget _buildGlowingStar3D() {
    return Container(
      width: 170,
      height: 170,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withValues(alpha: 0.18),
      ),
      child: Center(
        child: Container(
          width: 130,
          height: 130,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withValues(alpha: 0.12),
          ),
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Golden Orbit Swoosh
                CustomPaint(
                  size: const Size(96, 96),
                  painter: _OrbitRingPainter(),
                ),
                // 3D Golden Star with multiple layers
                const Icon(
                  Icons.star_rounded,
                  size: 64,
                  color: Color(0xFFFFD438),
                  shadows: [
                    Shadow(
                      color: Color(0xFFFF9E00),
                      offset: Offset(0, 4),
                      blurRadius: 12,
                    ),
                  ],
                ),
                // Top Star highlight
                Positioned(
                  top: 40,
                  left: 48,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.8),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- 3D Icon 2: Lock Illustration ---
  static Widget _buildGlowingLock3D() {
    return Container(
      width: 170,
      height: 170,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withValues(alpha: 0.18),
      ),
      child: Center(
        child: Container(
          width: 130,
          height: 130,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withValues(alpha: 0.12),
          ),
          child: Center(
            child: SizedBox(
              width: 62,
              height: 76,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Cyan Shackle Loop
                  Positioned(
                    top: 0,
                    child: Container(
                      width: 38,
                      height: 42,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFF6ED6F0),
                          width: 6.5,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  // Shackle Highlight
                  Positioned(
                    top: 4,
                    left: 14,
                    child: Container(
                      width: 10,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  // Yellow/Gold Padlock Body
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: 58,
                      height: 46,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFFFDF38),
                            Color(0xFFFFB800),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.25),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 9,
                              height: 9,
                              decoration: const BoxDecoration(
                                color: Color(0xFF382A0A),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Container(
                              width: 4,
                              height: 9,
                              decoration: BoxDecoration(
                                color: const Color(0xFF382A0A),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // --- 3D Icon 3: Azura Sparkles ---
  static Widget _buildGlowingSparkles3D() {
    return Container(
      width: 170,
      height: 170,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF38334E).withValues(alpha: 0.75),
      ),
      child: Center(
        child: Container(
          width: 130,
          height: 130,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF4A4466).withValues(alpha: 0.5),
          ),
          child: Center(
            child: SizedBox(
              width: 90,
              height: 90,
              child: CustomPaint(
                painter: _FourPointSparklesPainter(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // --- 3D Icon 4: Celebration Party Popper ---
  static Widget _buildPartyPopper3D() {
    return Container(
      width: 170,
      height: 170,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withValues(alpha: 0.18),
      ),
      child: Center(
        child: Container(
          width: 130,
          height: 130,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withValues(alpha: 0.12),
          ),
          child: Center(
            child: SizedBox(
              width: 80,
              height: 80,
              child: CustomPaint(
                painter: _PartyPopperPainter(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentItem = _pages[_currentPage];
    final isLastPage = _currentPage == _pages.length - 1;

    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              currentItem.bgStartColor,
              currentItem.bgEndColor,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Top Bar with Skip button
              Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 24.0, left: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: _onSkipPressed,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white.withValues(alpha: 0.88),
                            letterSpacing: 0.2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // PageView for content
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: _pages.length,
                  itemBuilder: (context, index) {
                    final item = _pages[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Spacer(flex: 2),

                          // Large 3D Icon
                          item.iconWidget,

                          const SizedBox(height: 48),

                          // Title
                          Text(
                            item.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              height: 1.22,
                              letterSpacing: -0.6,
                            ),
                          ),

                          const SizedBox(height: 18),

                          // Subtitle / Description
                          Text(
                            item.description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.5,
                              fontWeight: FontWeight.w400,
                              color: Colors.white.withValues(alpha: 0.90),
                              height: 1.48,
                              letterSpacing: 0.1,
                            ),
                          ),

                          const Spacer(flex: 3),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // Indicator Dots
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _pages.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentPage == index ? 24 : 7,
                    height: 7,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? Colors.white
                          : Colors.white.withValues(alpha: 0.40),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // Bottom Button (Next or Get Started — It's Free 🌙)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 46.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: _onNextPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: currentItem.buttonTextColor,
                      elevation: 4,
                      shape: const StadiumBorder(),
                      shadowColor: Colors.black.withValues(alpha: 0.2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          isLastPage ? "Get Started — It's Free 🌙" : 'Next',
                          style: TextStyle(
                            fontSize: isLastPage ? 16 : 16.5,
                            fontWeight: FontWeight.w700,
                            color: currentItem.buttonTextColor,
                          ),
                        ),
                        if (!isLastPage) ...[
                          const SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward_rounded,
                            size: 18,
                            color: currentItem.buttonTextColor,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),

              // Sign In Footer on 4th Page
              if (isLastPage) ...[
                const SizedBox(height: 14),
                GestureDetector(
                  onTap: _onSignInPressed,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: TextStyle(
                            fontSize: 13.5,
                            color: Colors.white.withValues(alpha: 0.85),
                          ),
                        ),
                        const Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 13.5,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ] else
                const SizedBox(height: 38),
            ],
          ),
        ),
      ),
    );
  }
}

// 1st Page Orbit Ring Painter
class _OrbitRingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final rect = Rect.fromCenter(
      center: center,
      width: size.width * 0.90,
      height: size.height * 0.52,
    );

    final paint = Paint()
      ..color = const Color(0xFFFFB800)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 9.0
      ..strokeCap = StrokeCap.round;

    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(-0.55);
    canvas.translate(-center.dx, -center.dy);

    canvas.drawArc(
      rect,
      -0.8,
      3.8,
      false,
      paint,
    );

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// 3rd Page Four-Point Sparkles Painter
class _FourPointSparklesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFFD233)
      ..style = PaintingStyle.fill;

    _drawSparkle(canvas, Offset(size.width * 0.62, size.height * 0.44), 28, paint);
    _drawSparkle(canvas, Offset(size.width * 0.35, size.height * 0.25), 13, paint);
    _drawSparkle(canvas, Offset(size.width * 0.27, size.height * 0.65), 17, paint);
  }

  void _drawSparkle(Canvas canvas, Offset center, double radius, Paint paint) {
    final path = Path();
    final inset = radius * 0.26;

    path.moveTo(center.dx, center.dy - radius);
    path.quadraticBezierTo(center.dx, center.dy - inset, center.dx + inset, center.dy);
    path.lineTo(center.dx + radius, center.dy);
    path.quadraticBezierTo(center.dx + inset, center.dy, center.dx, center.dy + inset);
    path.lineTo(center.dx, center.dy + radius);
    path.quadraticBezierTo(center.dx, center.dy + inset, center.dx - inset, center.dy);
    path.lineTo(center.dx - radius, center.dy);
    path.quadraticBezierTo(center.dx - inset, center.dy, center.dx, center.dy - inset);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// 4th Page 3D Party Popper Painter
class _PartyPopperPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final conePaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFFFFD438), Color(0xFFFF9E00)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    // Cone Path
    final conePath = Path()
      ..moveTo(size.width * 0.2, size.height * 0.8)
      ..lineTo(size.width * 0.6, size.height * 0.4)
      ..lineTo(size.width * 0.4, size.height * 0.2)
      ..close();
    canvas.drawPath(conePath, conePaint);

    // Streamers / Confetti
    final redPaint = Paint()
      ..color = const Color(0xFFFF4D6D)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.5
      ..strokeCap = StrokeCap.round;

    final bluePaint = Paint()
      ..color = const Color(0xFF00C0F3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.5
      ..strokeCap = StrokeCap.round;

    final cyanPaint = Paint()
      ..color = const Color(0xFF38E54D)
      ..style = PaintingStyle.fill;

    // Curved streamers
    final streamerPath1 = Path()
      ..moveTo(size.width * 0.5, size.height * 0.3)
      ..quadraticBezierTo(size.width * 0.55, size.height * 0.1, size.width * 0.7, size.height * 0.25)
      ..quadraticBezierTo(size.width * 0.85, size.height * 0.4, size.width * 0.9, size.height * 0.2);
    canvas.drawPath(streamerPath1, redPaint);

    final streamerPath2 = Path()
      ..moveTo(size.width * 0.55, size.height * 0.4)
      ..quadraticBezierTo(size.width * 0.75, size.height * 0.45, size.width * 0.85, size.height * 0.6);
    canvas.drawPath(streamerPath2, bluePaint);

    // Confetti dots / squares
    canvas.drawCircle(Offset(size.width * 0.3, size.height * 0.25), 4, Paint()..color = const Color(0xFF00C0F3));
    canvas.drawCircle(Offset(size.width * 0.75, size.height * 0.15), 4.5, Paint()..color = const Color(0xFFFFD438));
    canvas.drawCircle(Offset(size.width * 0.88, size.height * 0.5), 3.5, Paint()..color = const Color(0xFFFF4D6D));
    canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.7), 4, cyanPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
