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
<<<<<<< HEAD
  // Warm Ivory & Golden Color Palette matching screenshot
  static const Color _bgCreamTop = Color(0xFFFBF4E2);
  static const Color _bgCreamMiddle = Color(0xFFF9EED4);
  static const Color _bgCreamBottom = Color(0xFFF5E3BD);

  static const Color _goldText = Color(0xFF8C5814);
  static const Color _goldBadgeBorder = Color(0xFFF0CB80);
  static const Color _goldBadgeBg = Color(0xFFFFF9EC);

  static const Color _emeraldGreen = Color(0xFF00A86B);
  static const Color _emeraldBg = Color(0xFFE8F8F2);

=======
  static const Color _brandBurgundy = Color(0xFF941235);
  static const Color _darkBurgundy = Color(0xFF6B0623);
  static const Color _goldPrimary = Color(0xFFFFD438);
  static const Color _emeraldGreen = Color(0xFF007554);
>>>>>>> c46467f7fa99b010fcd2783f93f04e8c194b88c7
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
<<<<<<< HEAD
      duration: const Duration(milliseconds: 1000),
=======
      duration: const Duration(milliseconds: 1200),
>>>>>>> c46467f7fa99b010fcd2783f93f04e8c194b88c7
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
<<<<<<< HEAD
                      '🌸 Share Your Blessed Experience',
=======
                      '🌸 Share Your Halal Story',
>>>>>>> c46467f7fa99b010fcd2783f93f04e8c194b88c7
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
<<<<<<< HEAD
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
=======
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
>>>>>>> c46467f7fa99b010fcd2783f93f04e8c194b88c7
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
<<<<<<< HEAD
                          backgroundColor: const Color(0xFFE8A825),
=======
                          backgroundColor: _brandBurgundy,
>>>>>>> c46467f7fa99b010fcd2783f93f04e8c194b88c7
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
<<<<<<< HEAD
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
=======
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
>>>>>>> c46467f7fa99b010fcd2783f93f04e8c194b88c7
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 21,
                                fontFamily: 'serif',
<<<<<<< HEAD
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
=======
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
>>>>>>> c46467f7fa99b010fcd2783f93f04e8c194b88c7
                                height: 1.4,
                              ),
                            ),

<<<<<<< HEAD
                            const SizedBox(height: 20),

                            // 3. Digital Nikah Record Card (White with gold border)
                            _buildDigitalNikahRecordCard(),

                            const SizedBox(height: 14),

                            // 4. "Next on Your Blessed Journey" Expandable / Nav row
                            _buildNextOnJourneyButton(),

                            const SizedBox(height: 20),
=======
                            const SizedBox(height: 24),

                            // Digital Nikah Souvenir Card
                            _buildNikahCertificateCard(),

                            const SizedBox(height: 20),

                            // Next Milestone Action Hub
                            _buildNextStepsCard(),

                            const SizedBox(height: 24),
>>>>>>> c46467f7fa99b010fcd2783f93f04e8c194b88c7
                          ],
                        ),
                      ),
                    ),
                  ),
<<<<<<< HEAD

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
=======
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
>>>>>>> c46467f7fa99b010fcd2783f93f04e8c194b88c7
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
<<<<<<< HEAD
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
=======
              ],
>>>>>>> c46467f7fa99b010fcd2783f93f04e8c194b88c7
            ),
          ),
        ],
      ),
    );
  }

<<<<<<< HEAD
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
=======
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
>>>>>>> c46467f7fa99b010fcd2783f93f04e8c194b88c7
          ),
        ],
      ),
      child: Column(
        children: [
<<<<<<< HEAD
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
=======
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
>>>>>>> c46467f7fa99b010fcd2783f93f04e8c194b88c7
          Text(
            'You & ${widget.partnerName}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
<<<<<<< HEAD
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
=======
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
>>>>>>> c46467f7fa99b010fcd2783f93f04e8c194b88c7
                  child: Text(
                    'Profiles automatically hidden from search to preserve marital privacy.',
                    style: TextStyle(
                      fontSize: 11,
<<<<<<< HEAD
                      color: Color(0xFF2C6B54),
                      fontWeight: FontWeight.w600,
                      height: 1.3,
=======
                      color: _emeraldGreen,
                      fontWeight: FontWeight.w600,
>>>>>>> c46467f7fa99b010fcd2783f93f04e8c194b88c7
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

<<<<<<< HEAD
  Widget _buildPillarTile({
    required IconData icon,
    required String title,
    required String status,
  }) {
=======
  Widget _buildPillarItem(IconData icon, String title, String subtitle) {
>>>>>>> c46467f7fa99b010fcd2783f93f04e8c194b88c7
    return Expanded(
      child: Row(
        children: [
          Container(
<<<<<<< HEAD
            width: 38,
            height: 38,
            decoration: const BoxDecoration(
              color: Color(0xFFE8F8F2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: _emeraldGreen, size: 18),
          ),
          const SizedBox(width: 10),
=======
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: _emeraldGreen.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: _emeraldGreen, size: 16),
          ),
          const SizedBox(width: 8),
>>>>>>> c46467f7fa99b010fcd2783f93f04e8c194b88c7
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
<<<<<<< HEAD
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
=======
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
>>>>>>> c46467f7fa99b010fcd2783f93f04e8c194b88c7
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

<<<<<<< HEAD
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
=======
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
>>>>>>> c46467f7fa99b010fcd2783f93f04e8c194b88c7
        ],
      ),
    );
  }
<<<<<<< HEAD
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
=======

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
>>>>>>> c46467f7fa99b010fcd2783f93f04e8c194b88c7
    }
  }

  @override
<<<<<<< HEAD
  bool shouldRepaint(covariant _WarmSparklePainter oldDelegate) => true;
=======
  bool shouldRepaint(covariant _ConfettiAndStarsPainter oldDelegate) => true;
>>>>>>> c46467f7fa99b010fcd2783f93f04e8c194b88c7
}
