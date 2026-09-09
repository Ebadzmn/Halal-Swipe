import 'dart:math' as math;
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
      iconWidget: const _AnimatedCompatibilityIllustration(),
      title: 'Smart Compatibility\nMatching',
      description:
          'We calculate real compatibility across Deen,\nFamily, Lifestyle, and more. Only show you\npeople who genuinely match what you need\nin a spouse.',
      bgStartColor: const Color(0xFFC0185D),
      bgEndColor: const Color(0xFF6B0632),
      buttonTextColor: const Color(0xFFB51755),
    ),

    // 2nd Screen: Privacy First. Always.
    OnboardingModel(
      iconWidget: const _AnimatedPrivacyIllustration(),
      title: 'Privacy First.\nAlways.',
      description:
          'Noor Shield adds screenshot protection\nacross supported areas. Your extra photos\nstay blurred until you choose to unlock a\nmatch.',
      bgStartColor: const Color(0xFF9E2C52),
      bgEndColor: const Color(0xFF801E3E),
      buttonTextColor: const Color(0xFF9E2C52),
    ),

    // 3rd Screen: Meet Azura Your Marriage Guide
    OnboardingModel(
      iconWidget: const _AnimatedAzuraIllustration(),
      title: 'Meet Azura\nYour Marriage Guide',
      description:
          'Azura uses AI to provide match-aware\nmarriage guidance. She helps you ask the\nright questions. You make the decision.',
      bgStartColor: const Color(0xFF1E1A34),
      bgEndColor: const Color(0xFF120E22),
      buttonTextColor: const Color(0xFFD84A79),
    ),

    // 4th Screen: First Month Completely FREE
    OnboardingModel(
      iconWidget: const _AnimatedCelebrationIllustration(),
      title: 'First Month\nCompletely FREE',
      description:
          'No credit card. No commitment. No risk. 30\ndays of access — join Muslims worldwide\nfinding real halal connections.',
      bgStartColor: const Color(0xFF007554),
      bgEndColor: const Color(0xFF004D36),
      buttonTextColor: const Color(0xFF007554),
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
        child: Stack(
          children: [
            // Subtle dotted pattern overlay for premium look
            Positioned.fill(
              child: CustomPaint(
                painter: _DotPatternPainter(),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  // Top Bar with Skip button
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 20.0, left: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: _onSkipPressed,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 7),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.18),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white.withValues(alpha: 0.25),
                                width: 1,
                              ),
                            ),
                            child: const Text(
                              'Skip',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
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
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Spacer(flex: 1),

                              // Large Visual / Illustration Area
                              item.iconWidget,

                              const SizedBox(height: 24),

                              // Title
                              Text(
                                item.title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                  height: 1.22,
                                  letterSpacing: -0.5,
                                ),
                              ),

                              const SizedBox(height: 16),

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

                              const Spacer(flex: 2),
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
                        width: _currentPage == index ? 26 : 8,
                        height: 7,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? Colors.white
                              : Colors.white.withValues(alpha: 0.35),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Bottom Button (Next or Get Started — It's Free 🌙)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: _onNextPressed,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: currentItem.buttonTextColor,
                          elevation: 6,
                          shape: const StadiumBorder(),
                          shadowColor: Colors.black.withValues(alpha: 0.3),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              isLastPage ? "Get Started — It's Free 🌙" : 'Next',
                              style: TextStyle(
                                fontSize: 16.5,
                                fontWeight: FontWeight.w800,
                                color: currentItem.buttonTextColor,
                              ),
                            ),
                            if (!isLastPage) ...[
                              const SizedBox(width: 8),
                              Icon(
                                Icons.arrow_forward_rounded,
                                size: 19,
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
          ],
        ),
      ),
    );
  }
}

// -------------------------------------------------------------
// Screen 1: Smart Compatibility Illustration
// -------------------------------------------------------------
class _AnimatedCompatibilityIllustration extends StatefulWidget {
  const _AnimatedCompatibilityIllustration();

  @override
  State<_AnimatedCompatibilityIllustration> createState() =>
      _AnimatedCompatibilityIllustrationState();
}

class _AnimatedCompatibilityIllustrationState
    extends State<_AnimatedCompatibilityIllustration>
    with TickerProviderStateMixin {
  late final AnimationController _rotationController;
  late final AnimationController _pulseController;
  late final AnimationController _floatController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 14),
    )..repeat();

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    )..repeat(reverse: true);

    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2800),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _pulseController.dispose();
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 320,
      child: AnimatedBuilder(
        animation: Listenable.merge([
          _rotationController,
          _pulseController,
          _floatController,
        ]),
        builder: (context, child) {
          final pulseVal = _pulseController.value;
          final floatVal = _floatController.value;
          final rotVal = _rotationController.value * 2 * math.pi;

          return Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              // Outer radar concentric rings
              CustomPaint(
                size: const Size(310, 310),
                painter: _RadarCirclesPainter(pulseVal: pulseVal),
              ),

              // Rotating Glowing Arc Orbit
              Transform.rotate(
                angle: rotVal,
                child: CustomPaint(
                  size: const Size(270, 270),
                  painter: _GlowingOrbitArcPainter(
                    startColor: const Color(0xFFFFB300),
                    endColor: const Color(0xFFFFE082),
                  ),
                ),
              ),

              // Center Circle with Glow
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const RadialGradient(
                    colors: [
                      Color(0xFF530F2A),
                      Color(0xFF38081C),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFFF9E00).withValues(alpha: 0.18 + 0.12 * pulseVal),
                      blurRadius: 36,
                      spreadRadius: 8,
                    ),
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.4),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Center(
                  // Inner 8-pointed golden star / rosette badge
                  child: Transform.scale(
                    scale: 1.0 + (pulseVal * 0.05),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFFFD438),
                            Color(0xFFFFA500),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFFFB800),
                            blurRadius: 16,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomPaint(
                            size: const Size(56, 56),
                            painter: _RosetteStarPainter(color: const Color(0xFFFFCA28)),
                          ),
                          const Icon(
                            Icons.favorite_rounded,
                            size: 20,
                            color: Color(0xFF5A0D28),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Tag 1: Top-Left "Deen • 98%"
              Positioned(
                top: 28 + (floatVal * 6),
                left: 12,
                child: _buildPillBadge(
                  dotColor: const Color(0xFF00E676),
                  text: 'Deen • 98%',
                ),
              ),

              // Tag 2: Top-Right "✨ Values Match"
              Positioned(
                top: 72 - (floatVal * 5),
                right: 14,
                child: _buildPillBadge(
                  prefixText: '✨ ',
                  text: 'Values Match',
                ),
              ),

              // Tag 3: Bottom-Right "🟡 Lifestyle • 94%"
              Positioned(
                bottom: 34 + (floatVal * 4),
                right: 32,
                child: _buildPillBadge(
                  dotColor: const Color(0xFFFFC107),
                  text: 'Lifestyle • 94%',
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// -------------------------------------------------------------
// Screen 2: Privacy First (Noor Shield & Safe Unlock) Illustration
// -------------------------------------------------------------
class _AnimatedPrivacyIllustration extends StatefulWidget {
  const _AnimatedPrivacyIllustration();

  @override
  State<_AnimatedPrivacyIllustration> createState() =>
      _AnimatedPrivacyIllustrationState();
}

class _AnimatedPrivacyIllustrationState
    extends State<_AnimatedPrivacyIllustration>
    with TickerProviderStateMixin {
  late final AnimationController _rotationController;
  late final AnimationController _pulseController;
  late final AnimationController _floatController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 14),
    )..repeat();

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    )..repeat(reverse: true);

    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2800),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _pulseController.dispose();
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 320,
      child: AnimatedBuilder(
        animation: Listenable.merge([
          _rotationController,
          _pulseController,
          _floatController,
        ]),
        builder: (context, child) {
          final pulseVal = _pulseController.value;
          final floatVal = _floatController.value;
          final rotVal = _rotationController.value * 2 * math.pi;

          return Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              // Outer radar rings
              CustomPaint(
                size: const Size(310, 310),
                painter: _RadarCirclesPainter(pulseVal: pulseVal),
              ),

              // Rotating Glowing Arc Orbit (Cyan/Emerald)
              Transform.rotate(
                angle: rotVal,
                child: CustomPaint(
                  size: const Size(270, 270),
                  painter: _GlowingOrbitArcPainter(
                    startColor: const Color(0xFF00E5FF),
                    endColor: const Color(0xFF84FFFF),
                  ),
                ),
              ),

              // Center Circle with Privacy Lock
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const RadialGradient(
                    colors: [
                      Color(0xFF4A1024),
                      Color(0xFF2C0512),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF00E5FF).withValues(alpha: 0.16 + 0.12 * pulseVal),
                      blurRadius: 36,
                      spreadRadius: 8,
                    ),
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.4),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Center(
                  child: Transform.scale(
                    scale: 1.0 + (pulseVal * 0.05),
                    child: Container(
                      width: 62,
                      height: 62,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF00E5FF),
                            Color(0xFF00B0FF),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF00E5FF),
                            blurRadius: 16,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomPaint(
                            size: const Size(58, 58),
                            painter: _RosetteStarPainter(color: const Color(0xFF80D8FF)),
                          ),
                          const Icon(
                            Icons.lock_rounded,
                            size: 24,
                            color: Color(0xFF0B3040),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Tag 1: Top-Left "🛡️ Noor Shield"
              Positioned(
                top: 28 + (floatVal * 6),
                left: 12,
                child: _buildPillBadge(
                  prefixText: '🛡️ ',
                  text: 'Noor Shield',
                ),
              ),

              // Tag 2: Top-Right "Screenshot Protected"
              Positioned(
                top: 72 - (floatVal * 5),
                right: 14,
                child: _buildPillBadge(
                  dotColor: const Color(0xFF00E5FF),
                  text: 'Anti-Screenshot',
                ),
              ),

              // Tag 3: Bottom-Right "🔒 Photos Blurred"
              Positioned(
                bottom: 34 + (floatVal * 4),
                right: 28,
                child: _buildPillBadge(
                  dotColor: const Color(0xFFFF4081),
                  text: 'Blur Protected',
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// -------------------------------------------------------------
// Screen 3: Meet Azura (AI Marriage Guide) Illustration
// -------------------------------------------------------------
class _AnimatedAzuraIllustration extends StatefulWidget {
  const _AnimatedAzuraIllustration();

  @override
  State<_AnimatedAzuraIllustration> createState() =>
      _AnimatedAzuraIllustrationState();
}

class _AnimatedAzuraIllustrationState
    extends State<_AnimatedAzuraIllustration>
    with TickerProviderStateMixin {
  late final AnimationController _rotationController;
  late final AnimationController _pulseController;
  late final AnimationController _floatController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 14),
    )..repeat();

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    )..repeat(reverse: true);

    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2800),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _pulseController.dispose();
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 320,
      child: AnimatedBuilder(
        animation: Listenable.merge([
          _rotationController,
          _pulseController,
          _floatController,
        ]),
        builder: (context, child) {
          final pulseVal = _pulseController.value;
          final floatVal = _floatController.value;
          final rotVal = _rotationController.value * 2 * math.pi;

          return Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              // Outer radar rings
              CustomPaint(
                size: const Size(310, 310),
                painter: _RadarCirclesPainter(pulseVal: pulseVal),
              ),

              // Rotating Glowing Arc Orbit (Purple / Violet)
              Transform.rotate(
                angle: rotVal,
                child: CustomPaint(
                  size: const Size(270, 270),
                  painter: _GlowingOrbitArcPainter(
                    startColor: const Color(0xFFE040FB),
                    endColor: const Color(0xFFFF80AB),
                  ),
                ),
              ),

              // Center Circle with AI Sparkles / Azura Guide
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const RadialGradient(
                    colors: [
                      Color(0xFF2C1B4D),
                      Color(0xFF140D26),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFE040FB).withValues(alpha: 0.20 + 0.12 * pulseVal),
                      blurRadius: 36,
                      spreadRadius: 8,
                    ),
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.4),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Center(
                  child: Transform.scale(
                    scale: 1.0 + (pulseVal * 0.05),
                    child: Container(
                      width: 62,
                      height: 62,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFE040FB),
                            Color(0xFF7C4DFF),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFE040FB),
                            blurRadius: 16,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomPaint(
                            size: const Size(58, 58),
                            painter: _RosetteStarPainter(color: const Color(0xFFEA80FC)),
                          ),
                          const Icon(
                            Icons.auto_awesome_rounded,
                            size: 24,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Tag 1: Top-Left "🤖 AI Marriage Guide"
              Positioned(
                top: 28 + (floatVal * 6),
                left: 12,
                child: _buildPillBadge(
                  prefixText: '🤖 ',
                  text: 'AI Guide',
                ),
              ),

              // Tag 2: Top-Right "✨ Match-Aware"
              Positioned(
                top: 72 - (floatVal * 5),
                right: 14,
                child: _buildPillBadge(
                  dotColor: const Color(0xFFE040FB),
                  text: 'Match-Aware',
                ),
              ),

              // Tag 3: Bottom-Right "💡 Smart Questions"
              Positioned(
                bottom: 34 + (floatVal * 4),
                right: 28,
                child: _buildPillBadge(
                  dotColor: const Color(0xFF00E676),
                  text: 'Smart Prompts',
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// -------------------------------------------------------------
// Screen 4: 1st Month FREE (Celebration / Halal Match) Illustration
// -------------------------------------------------------------
class _AnimatedCelebrationIllustration extends StatefulWidget {
  const _AnimatedCelebrationIllustration();

  @override
  State<_AnimatedCelebrationIllustration> createState() =>
      _AnimatedCelebrationIllustrationState();
}

class _AnimatedCelebrationIllustrationState
    extends State<_AnimatedCelebrationIllustration>
    with TickerProviderStateMixin {
  late final AnimationController _rotationController;
  late final AnimationController _pulseController;
  late final AnimationController _floatController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 14),
    )..repeat();

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    )..repeat(reverse: true);

    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2800),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _pulseController.dispose();
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 320,
      child: AnimatedBuilder(
        animation: Listenable.merge([
          _rotationController,
          _pulseController,
          _floatController,
        ]),
        builder: (context, child) {
          final pulseVal = _pulseController.value;
          final floatVal = _floatController.value;
          final rotVal = _rotationController.value * 2 * math.pi;

          return Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              // Outer radar rings
              CustomPaint(
                size: const Size(310, 310),
                painter: _RadarCirclesPainter(pulseVal: pulseVal),
              ),

              // Rotating Glowing Arc Orbit (Gold / Emerald)
              Transform.rotate(
                angle: rotVal,
                child: CustomPaint(
                  size: const Size(270, 270),
                  painter: _GlowingOrbitArcPainter(
                    startColor: const Color(0xFFFFD54F),
                    endColor: const Color(0xFF69F0AE),
                  ),
                ),
              ),

              // Center Circle with Celebration Crown / Star
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const RadialGradient(
                    colors: [
                      Color(0xFF004D36),
                      Color(0xFF00291D),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF69F0AE).withValues(alpha: 0.18 + 0.12 * pulseVal),
                      blurRadius: 36,
                      spreadRadius: 8,
                    ),
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.4),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Center(
                  child: Transform.scale(
                    scale: 1.0 + (pulseVal * 0.05),
                    child: Container(
                      width: 62,
                      height: 62,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFFFD54F),
                            Color(0xFFFF9800),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFFFD54F),
                            blurRadius: 16,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomPaint(
                            size: const Size(58, 58),
                            painter: _RosetteStarPainter(color: const Color(0xFFFFE082)),
                          ),
                          const Icon(
                            Icons.card_giftcard_rounded,
                            size: 24,
                            color: Color(0xFF004D36),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Tag 1: Top-Left "🎉 30 Days Free"
              Positioned(
                top: 28 + (floatVal * 6),
                left: 12,
                child: _buildPillBadge(
                  prefixText: '🎉 ',
                  text: '30 Days Free',
                ),
              ),

              // Tag 2: Top-Right "💳 No Card Needed"
              Positioned(
                top: 72 - (floatVal * 5),
                right: 14,
                child: _buildPillBadge(
                  dotColor: const Color(0xFF69F0AE),
                  text: 'No Card Risk',
                ),
              ),

              // Tag 3: Bottom-Right "🌙 100% Halal"
              Positioned(
                bottom: 34 + (floatVal * 4),
                right: 28,
                child: _buildPillBadge(
                  prefixText: '🌙 ',
                  text: '100% Halal',
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// -------------------------------------------------------------
// Shared UI Components and Custom Painters
// -------------------------------------------------------------

Widget _buildPillBadge({
  Color? dotColor,
  String? prefixText,
  required String text,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7.5),
    decoration: BoxDecoration(
      color: Colors.white.withValues(alpha: 0.16),
      borderRadius: BorderRadius.circular(24),
      border: Border.all(
        color: Colors.white.withValues(alpha: 0.28),
        width: 1.1,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.15),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (dotColor != null) ...[
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: dotColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: dotColor.withValues(alpha: 0.8),
                  blurRadius: 4,
                ),
              ],
            ),
          ),
          const SizedBox(width: 7),
        ],
        if (prefixText != null) ...[
          Text(
            prefixText,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFFFFD54F),
            ),
          ),
        ],
        Text(
          text,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            letterSpacing: 0.1,
          ),
        ),
      ],
    ),
  );
}

/// Dotted grid background painter
class _DotPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.06)
      ..style = PaintingStyle.fill;

    const spacing = 28.0;
    for (double x = 14; x < size.width; x += spacing) {
      for (double y = 14; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), 1.2, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Concentric Radar Rings Painter
class _RadarCirclesPainter extends CustomPainter {
  final double pulseVal;
  _RadarCirclesPainter({required this.pulseVal});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final ringPaint1 = Paint()
      ..color = Colors.white.withValues(alpha: 0.08 + 0.03 * pulseVal)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final ringPaint2 = Paint()
      ..color = Colors.white.withValues(alpha: 0.12 + 0.04 * pulseVal)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    final ringPaint3 = Paint()
      ..color = Colors.white.withValues(alpha: 0.16 + 0.05 * pulseVal)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4;

    canvas.drawCircle(center, 90, ringPaint1);
    canvas.drawCircle(center, 120, ringPaint2);
    canvas.drawCircle(center, 145, ringPaint3);
  }

  @override
  bool shouldRepaint(covariant _RadarCirclesPainter oldDelegate) =>
      oldDelegate.pulseVal != pulseVal;
}

/// Glowing orbit arc
class _GlowingOrbitArcPainter extends CustomPainter {
  final Color startColor;
  final Color endColor;

  _GlowingOrbitArcPainter({
    required this.startColor,
    required this.endColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final rect = Rect.fromCircle(center: center, radius: 106);

    final arcPaint = Paint()
      ..shader = SweepGradient(
        colors: [
          Colors.transparent,
          startColor.withValues(alpha: 0.0),
          startColor,
          endColor,
        ],
        stops: const [0.0, 0.4, 0.85, 1.0],
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round;

    // Draw main glowing arc
    canvas.drawArc(rect, 0.4, 3.8, false, arcPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Rosette / 8-pointed scalloped star badge
class _RosetteStarPainter extends CustomPainter {
  final Color color;
  _RosetteStarPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    const numPoints = 8;
    const outerRadius = 26.0;
    const innerRadius = 20.0;

    final path = Path();
    for (int i = 0; i < numPoints * 2; i++) {
      final isOuter = i.isEven;
      final radius = isOuter ? outerRadius : innerRadius;
      final angle = (i * math.pi / numPoints) - (math.pi / 2);
      final actualX = center.dx + radius * math.cos(angle);
      final actualY = center.dy + radius * math.sin(angle);
      if (i == 0) {
        path.moveTo(actualX, actualY);
      } else {
        path.lineTo(actualX, actualY);
      }
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
