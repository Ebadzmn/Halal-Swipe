import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:halal_swipe/routes/app_routes.dart';

class NikahCelebrationScreen extends StatefulWidget {
  final String partnerName;
  final String partnerEmoji;
  final String weddingDate;

  const NikahCelebrationScreen({
    super.key,
    this.partnerName = 'Maryam Al-Zahra',
    this.partnerEmoji = '🧕🏼',
    this.weddingDate = 'Shawwal 1447 AH • May 2026',
  });

  @override
  State<NikahCelebrationScreen> createState() => _NikahCelebrationScreenState();
}

class _NikahCelebrationScreenState extends State<NikahCelebrationScreen>
    with TickerProviderStateMixin {
  static const Color _brandBurgundy = Color(0xFF941235);
  static const Color _darkBurgundy = Color(0xFF6B0623);
  static const Color _goldPrimary = Color(0xFFFFD438);
  static const Color _emeraldGreen = Color(0xFF007554);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textGrey = Color(0xFF6B7280);

  late final AnimationController _cardEntranceController;
  late final AnimationController _pulseGlowController;
  late final AnimationController _sparkleController;

  bool _isSuccessStorySubmitted = false;
  final TextEditingController _duaController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _cardEntranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..forward();

    _pulseGlowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    )..repeat(reverse: true);

    _sparkleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    _cardEntranceController.dispose();
    _pulseGlowController.dispose();
    _sparkleController.dispose();
    _duaController.dispose();
    super.dispose();
  }

  void _showShareSuccessSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return Container(
              padding: EdgeInsets.only(
                left: 24,
                right: 24,
                top: 24,
                bottom: MediaQuery.of(context).viewInsets.bottom + 24,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 44,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      '🌸 Share Your Halal Story',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: _textDark,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Inspire thousands of single Muslims striving for a pure, halal marriage.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13, color: _textGrey, height: 1.4),
                    ),
                    const SizedBox(height: 18),
                    TextField(
                      controller: _duaController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: 'Share a word of advice, dua or gratitude...',
                        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13),
                        filled: true,
                        fillColor: const Color(0xFFFBF6F8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Color(0xFFFFD1DC)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Color(0xFFFFD1DC)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: _brandBurgundy, width: 1.5),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(ctx);
                          setState(() {
                            _isSuccessStorySubmitted = true;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('✓ JazakAllah Khair! Your story has been recorded with blessings.'),
                              backgroundColor: _emeraldGreen,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _brandBurgundy,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Submit Blessed Testimonial',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF56071F),
      body: Stack(
        children: [
          // Background Gradient & Islamic Pattern
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(0.0, -0.4),
                  radius: 1.3,
                  colors: [
                    Color(0xFF941235),
                    Color(0xFF6B0623),
                    Color(0xFF3F0213),
                  ],
                ),
              ),
            ),
          ),

          // Animated Islamic Geometric Sparkles
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _sparkleController,
              builder: (context, child) {
                return CustomPaint(
                  painter: _ConfettiAndStarsPainter(
                    progress: _sparkleController.value,
                  ),
                );
              },
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                // Top Custom Header Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close_rounded, color: Colors.white, size: 24),
                        onPressed: () => Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppRoutes.home,
                          (route) => false,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: _goldPrimary.withValues(alpha: 0.18),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: _goldPrimary.withValues(alpha: 0.5)),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.verified_rounded, color: _goldPrimary, size: 14),
                            SizedBox(width: 5),
                            Text(
                              'OFFICIAL NIKAH UNION',
                              style: TextStyle(
                                color: _goldPrimary,
                                fontSize: 10.5,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 0.8,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 48), // Balancing spacer
                    ],
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
                    child: FadeTransition(
                      opacity: CurvedAnimation(
                        parent: _cardEntranceController,
                        curve: const Interval(0.0, 0.7, curve: Curves.easeOut),
                      ),
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, 0.08),
                          end: Offset.zero,
                        ).animate(
                          CurvedAnimation(
                            parent: _cardEntranceController,
                            curve: Curves.easeOutCubic,
                          ),
                        ),
                        child: Column(
                          children: [
                            // Glowing Rings with Couple Avatar Badge
                            _buildCoupleAvatarHeader(),

                            const SizedBox(height: 18),

                            // Main Congratulations & Sunnah Dua
                            const Text(
                              'بَارَكَ اللَّهُ لَكُمَا وَبَارَكَ عَلَيْكُمَا',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24,
                                fontFamily: 'serif',
                                fontWeight: FontWeight.w900,
                                color: _goldPrimary,
                                letterSpacing: 1.2,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'وَجَمَعَ بَيْنَكُمَا فِي خَيْرٍ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 21,
                                fontFamily: 'serif',
                                fontWeight: FontWeight.w900,
                                color: _goldPrimary,
                                letterSpacing: 1.1,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '"May Allah bless you both, shower His blessings upon you, and unite you in goodness."',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                                fontStyle: FontStyle.italic,
                                color: Colors.white.withValues(alpha: 0.9),
                                height: 1.4,
                              ),
                            ),

                            const SizedBox(height: 24),

                            // Digital Nikah Souvenir Card
                            _buildNikahCertificateCard(),

                            const SizedBox(height: 20),

                            // Next Milestone Action Hub
                            _buildNextStepsCard(),

                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // Bottom Fixed Actions
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () => _showShareSuccessSheet(),
                          icon: const Icon(Icons.favorite_rounded, size: 18),
                          label: Text(
                            _isSuccessStorySubmitted
                                ? '✓ Story Shared with Ummah'
                                : 'Share Blessed Experience',
                            style: const TextStyle(
                              fontSize: 14.5,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _goldPrimary,
                            foregroundColor: _brandBurgundy,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            elevation: 8,
                            shadowColor: _goldPrimary.withValues(alpha: 0.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () => Navigator.pushNamed(
                          context,
                          AppRoutes.marriedCoupleHub,
                        ),
                        child: Text(
                          'Go to Married Couple Hub →',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.85),
                            fontWeight: FontWeight.w700,
                            fontSize: 13.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCoupleAvatarHeader() {
    return AnimatedBuilder(
      animation: _pulseGlowController,
      builder: (context, child) {
        final p = _pulseGlowController.value;
        return Container(
          width: 140,
          height: 140,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: _goldPrimary.withValues(alpha: 0.25 + 0.15 * p),
                blurRadius: 35 + 15 * p,
                spreadRadius: 8 + 4 * p,
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Golden Ornament Ring
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: _goldPrimary, width: 2.5),
                ),
              ),
              // Dual Avatar Cluster
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 58,
                    height: 58,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: _goldPrimary, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text('🤵🏻', style: TextStyle(fontSize: 30)),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(-12, 0),
                    child: Container(
                      width: 58,
                      height: 58,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(color: _goldPrimary, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.2),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          widget.partnerEmoji,
                          style: const TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Floating Ring Emoji on top
              Positioned(
                top: 4,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: _brandBurgundy,
                    shape: BoxShape.circle,
                  ),
                  child: const Text('💍', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNikahCertificateCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: _goldPrimary, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 25,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header Badge
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.auto_awesome_rounded, color: _brandBurgundy, size: 16),
              SizedBox(width: 8),
              Text(
                'DIGITAL NIKAH RECORD',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.2,
                  color: _brandBurgundy,
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.auto_awesome_rounded, color: _brandBurgundy, size: 16),
            ],
          ),
          const SizedBox(height: 14),

          // Couple Names
          Text(
            'You & ${widget.partnerName}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: _textDark,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            widget.weddingDate,
            style: const TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w700,
              color: _emeraldGreen,
            ),
          ),

          const SizedBox(height: 16),
          const Divider(height: 1, color: Color(0xFFF3D2DE)),
          const SizedBox(height: 16),

          // 4 Key Verified Pillars Grid
          Row(
            children: [
              _buildPillarItem(Icons.verified_user_rounded, 'Wali Consent', 'Fulfilled ✓'),
              Container(width: 1, height: 36, color: Colors.grey.shade200),
              _buildPillarItem(Icons.handshake_rounded, 'Mahr Agreed', 'Documented ✓'),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildPillarItem(Icons.people_alt_rounded, 'Two Witnesses', 'Confirmed ✓'),
              Container(width: 1, height: 36, color: Colors.grey.shade200),
              _buildPillarItem(Icons.menu_book_rounded, 'Contract Terms', 'Completed ✓'),
            ],
          ),

          const SizedBox(height: 16),
          // Privacy protection note
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF6FCF9),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFA8E6CF)),
            ),
            child: Row(
              children: const [
                Icon(Icons.lock_rounded, color: _emeraldGreen, size: 15),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Profiles automatically hidden from search to preserve marital privacy.',
                    style: TextStyle(
                      fontSize: 11,
                      color: _emeraldGreen,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPillarItem(IconData icon, String title, String subtitle) {
    return Expanded(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: _emeraldGreen.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: _emeraldGreen, size: 16),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: _textDark,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: _emeraldGreen,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNextStepsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text('✨', style: TextStyle(fontSize: 16)),
              SizedBox(width: 8),
              Text(
                'Next on Your Blessed Journey',
                style: TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildJourneyBullet(
            '🤖 Azura Marriage Coach',
            'Get daily Sunnah reminders on maintaining affection, mercy, and mutual respect in marriage.',
          ),
          const SizedBox(height: 8),
          _buildJourneyBullet(
            '🔒 Profile Frozen for Discovery',
            'Your swipe cards have been gracefully retired. You are now in Married Couple Mode.',
          ),
        ],
      ),
    );
  }

  Widget _buildJourneyBullet(String title, String desc) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 3.0),
          child: Icon(Icons.check_circle_rounded, color: _goldPrimary, size: 14),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w800,
                  color: _goldPrimary,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                desc,
                style: TextStyle(
                  fontSize: 11.5,
                  color: Colors.white.withValues(alpha: 0.85),
                  height: 1.35,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ConfettiAndStarsPainter extends CustomPainter {
  final double progress;

  _ConfettiAndStarsPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final goldPaint = Paint()
      ..color = const Color(0xFFFFD438).withValues(alpha: 0.6)
      ..style = PaintingStyle.fill;

    final whitePaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.35)
      ..style = PaintingStyle.fill;

    final random = math.Random(42);

    for (int i = 0; i < 28; i++) {
      final x = (random.nextDouble() * size.width);
      final yOffset = (progress * size.height + random.nextDouble() * size.height) % size.height;
      final radius = (i % 3 == 0) ? 2.5 : 1.5;
      final paint = (i % 2 == 0) ? goldPaint : whitePaint;

      canvas.drawCircle(Offset(x, yOffset), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _ConfettiAndStarsPainter oldDelegate) => true;
}
