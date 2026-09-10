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
  // Warm Ivory & Golden Color Palette matching screenshot
  static const Color _bgCreamTop = Color(0xFFFBF4E2);
  static const Color _bgCreamMiddle = Color(0xFFF9EED4);
  static const Color _bgCreamBottom = Color(0xFFF5E3BD);

  static const Color _goldText = Color(0xFF8C5814);
  static const Color _goldBadgeBorder = Color(0xFFF0CB80);
  static const Color _goldBadgeBg = Color(0xFFFFF9EC);

  static const Color _emeraldGreen = Color(0xFF00A86B);
  static const Color _emeraldBg = Color(0xFFE8F8F2);

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
      duration: const Duration(milliseconds: 1000),
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
                      '🌸 Share Your Blessed Experience',
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
                        fillColor: const Color(0xFFFCF9F2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Color(0xFFF0D59A)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Color(0xFFF0D59A)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Color(0xFFB8781B), width: 1.5),
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
                          backgroundColor: const Color(0xFFE8A825),
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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              _bgCreamTop,
              _bgCreamMiddle,
              _bgCreamBottom,
            ],
          ),
        ),
        child: Stack(
          children: [
            // Soft Golden Stars/Sparkles Particle Overlay
            Positioned.fill(
              child: AnimatedBuilder(
                animation: _sparkleController,
                builder: (context, child) {
                  return CustomPaint(
                    painter: _WarmSparklePainter(
                      progress: _sparkleController.value,
                    ),
                  );
                },
              ),
            ),

            SafeArea(
              child: Column(
                children: [
                  // Top Custom Header Bar with (X) and OFFICIAL NIKAH UNION Badge
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Left Close Button
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withValues(alpha: 0.85),
                              border: Border.all(color: const Color(0xFFEADBBE)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.04),
                                  blurRadius: 6,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.close_rounded, color: Color(0xFF5A4A32), size: 20),
                              padding: EdgeInsets.zero,
                              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                                context,
                                AppRoutes.home,
                                (route) => false,
                              ),
                            ),
                          ),
                        ),

                        // Center Top Pill Badge: ★ OFFICIAL NIKAH UNION
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF9EE),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: const Color(0xFFF1D495), width: 1.2),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFFC08A28).withValues(alpha: 0.12),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.star_rounded, color: Color(0xFFC4881C), size: 15),
                              SizedBox(width: 6),
                              Text(
                                'OFFICIAL NIKAH UNION',
                                style: TextStyle(
                                  color: Color(0xFF7D4E12),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 0.6,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Main Scrollable Body
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 6.0),
                      child: FadeTransition(
                        opacity: CurvedAnimation(
                          parent: _cardEntranceController,
                          curve: const Interval(0.0, 0.7, curve: Curves.easeOut),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 4),

                            // 1. Top Avatar Halo / Golden Rings Illustration
                            _buildTopAvatarHalo(),

                            const SizedBox(height: 18),

                            // 2. Arabic Sunnah Dua (Exact Calligraphy typography & gold color)
                            const Text(
                              'بَارَكَ اللَّهُ لَكُمَا وَبَارَكَ عَلَيْكُمَا وَجَمَعَ بَيْنَكُمَا فِي\nخَيْرٍ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 21,
                                fontFamily: 'serif',
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF7A4E13),
                                height: 1.55,
                                letterSpacing: 0.6,
                              ),
                            ),
                            const SizedBox(height: 8),

                            // Translation in italics
                            Text(
                              '"May Allah bless you both, shower His blessings upon\nyou, and unite you in goodness."',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                                color: const Color(0xFF5E4522).withValues(alpha: 0.9),
                                height: 1.4,
                              ),
                            ),

                            const SizedBox(height: 20),

                            // 3. Digital Nikah Record Card (White with gold border)
                            _buildDigitalNikahRecordCard(),

                            const SizedBox(height: 14),

                            // 4. "Next on Your Blessed Journey" Expandable / Nav row
                            _buildNextOnJourneyButton(),

                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Bottom Golden Pill Button + Sublink
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 6, 18, 14),
                    child: Column(
                      children: [
                        // Large Shiny Golden "Share Blessed Experience" Button
                        Container(
                          width: double.infinity,
                          height: 52,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xFFF8C94A),
                                Color(0xFFE49F18),
                                Color(0xFFD68B0A),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFFB8781B).withValues(alpha: 0.35),
                                blurRadius: 14,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () => _showShareSuccessSheet(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.favorite_rounded, color: Color(0xFF381F02), size: 17),
                                const SizedBox(width: 8),
                                Text(
                                  _isSuccessStorySubmitted
                                      ? '✓ Story Shared with Ummah'
                                      : 'Share Blessed Experience',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xFF2C1802),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        // "Go to Married Couple Hub →" Text link
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(
                            context,
                            AppRoutes.marriedCoupleHub,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(
                              'Go to Married Couple Hub →',
                              style: TextStyle(
                                color: Color(0xFF855318),
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                              ),
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
      ),
    );
  }

  // ===========================================================================
  // 1. TOP AVATAR HALO WITH STAR BADGE
  // ===========================================================================
  Widget _buildTopAvatarHalo() {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          // Outer Soft Golden Ring
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: const Color(0xFFECCB88).withValues(alpha: 0.8),
                width: 2.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFECCB88).withValues(alpha: 0.25),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              // Inner Subtle Gold Ring
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFF3DDAB),
                    width: 1.5,
                  ),
                ),
                child: Center(
                  // Center Couple Visual (Deep Teal Circular Pods)
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Groom Avatar
                      Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFF034A3F),
                          border: Border.all(color: const Color(0xFFF9DC96), width: 2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.15),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text('👨🏻', style: TextStyle(fontSize: 26)),
                        ),
                      ),
                      // Bride Avatar
                      Transform.translate(
                        offset: const Offset(-8, 0),
                        child: Container(
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFF034A3F),
                            border: Border.all(color: const Color(0xFFF9DC96), width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.15),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text('🧕🏼', style: TextStyle(fontSize: 26)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Little Star Medallion on Top Ring
          Positioned(
            top: -10,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFFFF9EC),
                border: Border.all(color: const Color(0xFFE2B768), width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: const Center(
                child: Icon(Icons.star_outline_rounded, size: 14, color: Color(0xFFB57C20)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ===========================================================================
  // 2. DIGITAL NIKAH RECORD CARD
  // ===========================================================================
  Widget _buildDigitalNikahRecordCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: const Color(0xFFF5DC9C), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFB8852B).withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header: ✦ DIGITAL NIKAH RECORD ✦
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('✦', style: TextStyle(color: Color(0xFFD49B28), fontSize: 10)),
              SizedBox(width: 6),
              Text(
                'DIGITAL NIKAH RECORD',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.2,
                  color: Color(0xFF8C5C1B),
                ),
              ),
              SizedBox(width: 6),
              Text('✦', style: TextStyle(color: Color(0xFFD49B28), fontSize: 10)),
            ],
          ),
          const SizedBox(height: 10),

          // Couple Title
          Text(
            'You & ${widget.partnerName}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: Color(0xFF1E2838),
            ),
          ),
          const SizedBox(height: 6),

          // Date Capsule Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF9EC),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFF7E2B5)),
            ),
            child: Text(
              widget.weddingDate,
              style: const TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.w700,
                color: Color(0xFF8A5A18),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // 2x2 Grid of Verified Pillars
          Row(
            children: [
              _buildPillarTile(
                icon: Icons.verified_user_outlined,
                title: 'Wali Consent',
                status: 'Fulfilled ✓',
              ),
              const SizedBox(width: 10),
              _buildPillarTile(
                icon: Icons.monetization_on_outlined,
                title: 'Mahr Agreed',
                status: 'Documented ✓',
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              _buildPillarTile(
                icon: Icons.groups_rounded,
                title: 'Two Witnesses',
                status: 'Confirmed ✓',
              ),
              const SizedBox(width: 10),
              _buildPillarTile(
                icon: Icons.description_outlined,
                title: 'Contract Terms',
                status: 'Completed ✓',
              ),
            ],
          ),

          const SizedBox(height: 18),

          // Green Privacy Box at Bottom of Record Card
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFF1FAF6),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0xFFC7EBDD)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Color(0xFFD6F3E6),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.lock_rounded, color: Color(0xFF00875A), size: 14),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    'Profiles automatically hidden from search to preserve marital privacy.',
                    style: TextStyle(
                      fontSize: 11,
                      color: Color(0xFF2C6B54),
                      fontWeight: FontWeight.w600,
                      height: 1.3,
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

  Widget _buildPillarTile({
    required IconData icon,
    required String title,
    required String status,
  }) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: const BoxDecoration(
              color: Color(0xFFE8F8F2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: _emeraldGreen, size: 18),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF263238),
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  status,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF00875A),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ===========================================================================
  // 3. NEXT ON YOUR BLESSED JOURNEY ROW
  // ===========================================================================
  Widget _buildNextOnJourneyButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF7E5BD), width: 1.3),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFB8852B).withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: const [
          Icon(Icons.auto_awesome_rounded, color: Color(0xFFE4A228), size: 18),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'Next on Your Blessed Journey',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w800,
                color: Color(0xFF333D4B),
              ),
            ),
          ),
          Icon(Icons.arrow_forward_ios_rounded, color: Color(0xFF9E7A3E), size: 13),
        ],
      ),
    );
  }
}

// ===========================================================================
// BACKGROUND SPARKLES PAINTER
// ===========================================================================
class _WarmSparklePainter extends CustomPainter {
  final double progress;

  _WarmSparklePainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final goldDotPaint = Paint()
      ..color = const Color(0xFFDCA948).withValues(alpha: 0.55)
      ..style = PaintingStyle.fill;

    final random = math.Random(108);

    for (int i = 0; i < 18; i++) {
      final x = (random.nextDouble() * size.width);
      final yOffset = (progress * size.height + random.nextDouble() * size.height) % size.height;
      final radius = (i % 4 == 0) ? 2.5 : 1.5;

      canvas.drawCircle(Offset(x, yOffset), radius, goldDotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _WarmSparklePainter oldDelegate) => true;
}
