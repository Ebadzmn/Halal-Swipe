import 'package:flutter/material.dart';

class OnboardingModel {
  final Widget iconWidget;
  final String title;
  final String description;
  final Color primaryColor;
  final Color secondaryColor;
  final Color buttonTextColor;

  const OnboardingModel({
    required this.iconWidget,
    required this.title,
    required this.description,
    required this.primaryColor,
    required this.secondaryColor,
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
    // 1st Page: Smart Compatibility Matching (Pink theme)
    OnboardingModel(
      iconWidget: _buildGlowingStarIcon(),
      title: 'Smart Compatibility\nMatching',
      description:
          'We calculate real compatibility across Deen,\nFamily, Lifestyle, and more. Only show you\npeople who genuinely match what you need\nin a spouse.',
      primaryColor: const Color(0xFFCE5279),
      secondaryColor: const Color(0xFFC3466F),
      buttonTextColor: const Color(0xFFCE5279),
    ),

    // 2nd Page: Privacy First (Maroon/Pink theme)
    OnboardingModel(
      iconWidget: _buildGlowingLockIcon(),
      title: 'Privacy First.\nAlways.',
      description:
          'Noor Shield adds screenshot protection\nacross supported areas. Your extra photos\nstay blurred until you choose to unlock a\nmatch.',
      primaryColor: const Color(0xFFB83B64),
      secondaryColor: const Color(0xFFA63056),
      buttonTextColor: const Color(0xFFB83B64),
    ),

    // 3rd Page: Meet Azura Your Marriage Guide (Dark Navy / Midnight theme)
    OnboardingModel(
      iconWidget: _buildSparklesIcon(),
      title: 'Meet Azura\nYour Marriage Guide',
      description:
          'Azura uses AI to provide match-aware\nmarriage guidance. She helps you ask the\nright questions. You make the decision.',
      primaryColor: const Color(0xFF1E1C2B),
      secondaryColor: const Color(0xFF151320),
      buttonTextColor: const Color(0xFFD64D7E),
    ),

    // 4th Page: First Month Completely FREE (Deep Emerald Green theme)
    OnboardingModel(
      iconWidget: _buildPartyPopperIcon(),
      title: 'First Month\nCompletely FREE',
      description:
          'No credit card. No commitment. No risk. 30\ndays of access — join Muslims worldwide\nfinding real halal connections.',
      primaryColor: const Color(0xFF006B4D),
      secondaryColor: const Color(0xFF00563D),
      buttonTextColor: const Color(0xFFD64D7E),
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
        curve: Curves.easeInOut,
      );
    } else {
      // Completed onboarding -> Go to Welcome Auth Screen
      Navigator.pushReplacementNamed(context, '/welcome-auth');
    }
  }

  void _onSkipPressed() {
    Navigator.pushReplacementNamed(context, '/welcome-auth');
  }

  void _onSignInPressed() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  // 1st Screen Icon (Star with Orbit ring)
  static Widget _buildGlowingStarIcon() {
    return Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.18),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Container(
          width: 110,
          height: 110,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.10),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: const Size(80, 80),
                  painter: _OrbitRingPainter(),
                ),
                const Icon(
                  Icons.star_rounded,
                  size: 50,
                  color: Color(0xFFFFD233),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 2nd Screen Icon (Padlock with soft blue shackle & yellow body)
  static Widget _buildGlowingLockIcon() {
    return Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.18),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Container(
          width: 110,
          height: 110,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.10),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SizedBox(
              width: 52,
              height: 64,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    child: Container(
                      width: 32,
                      height: 34,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFF76D1E8),
                          width: 5.5,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: 50,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFC82C),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Color(0xFF4A3E1B),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Container(
                              width: 3.5,
                              height: 8,
                              decoration: BoxDecoration(
                                color: const Color(0xFF4A3E1B),
                                borderRadius: BorderRadius.circular(1),
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

  // 3rd Screen Icon (Azura Glowing Magic Sparkles / 4-point Stars)
  static Widget _buildSparklesIcon() {
    return Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
        color: const Color(0xFF38384D).withValues(alpha: 0.70),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: SizedBox(
          width: 80,
          height: 80,
          child: CustomPaint(
            painter: _FourPointSparklesPainter(),
          ),
        ),
      ),
    );
  }

  // 4th Screen Icon (Party Popper with Confetti)
  static Widget _buildPartyPopperIcon() {
    return Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        shape: BoxShape.circle,
      ),
      child: const Center(
        child: Text(
          '🎉',
          style: TextStyle(fontSize: 58),
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
              currentItem.primaryColor,
              currentItem.secondaryColor,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Top Bar with Skip button
              Padding(
                padding: const EdgeInsets.only(top: 12.0, right: 24.0, left: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (!isLastPage)
                      GestureDetector(
                        onTap: _onSkipPressed,
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white.withValues(alpha: 0.85),
                            letterSpacing: 0.2,
                          ),
                        ),
                      )
                    else
                      GestureDetector(
                        onTap: _onSkipPressed,
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white.withValues(alpha: 0.85),
                            letterSpacing: 0.2,
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

                          // Illustration / Icon
                          item.iconWidget,

                          const SizedBox(height: 48),

                          // Title
                          Text(
                            item.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w800,
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
                              height: 1.45,
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

              // Bottom Button (Next or Get Started - It's Free 🌙)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: _onNextPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: currentItem.buttonTextColor,
                      elevation: 0,
                      shape: const StadiumBorder(),
                      shadowColor: Colors.black.withValues(alpha: 0.1),
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

              // Already have an account? Sign In (on 4th page)
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

// 1st Page Orbit Ring
class _OrbitRingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final rect = Rect.fromCenter(
      center: center,
      width: size.width * 0.88,
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

// 3rd Page Four-Point Sparkles (AI Guidance Stars)
class _FourPointSparklesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFFD233)
      ..style = PaintingStyle.fill;

    _drawSparkle(canvas, Offset(size.width * 0.62, size.height * 0.45), 26, paint);
    _drawSparkle(canvas, Offset(size.width * 0.35, size.height * 0.26), 12, paint);
    _drawSparkle(canvas, Offset(size.width * 0.28, size.height * 0.65), 16, paint);
  }

  void _drawSparkle(Canvas canvas, Offset center, double radius, Paint paint) {
    final path = Path();
    final inset = radius * 0.28;

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
