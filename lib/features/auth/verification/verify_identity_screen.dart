import 'package:flutter/material.dart';
import 'package:halal_swipe/routes/app_routes.dart';

class VerifyIdentityScreen extends StatelessWidget {
  const VerifyIdentityScreen({super.key});

  static const Color _primaryPink = Color(0xFF941235);
  static const Color _buttonPink = Color(0xFF941235);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textGrey = Color(0xFF5A606E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: _primaryPink, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Identity Verification',
          style: TextStyle(
            color: _textDark,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Top 3D Animated / Glowing Shield Badge
                    Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFFFF0F5),
                        boxShadow: [
                          BoxShadow(
                            color: _primaryPink.withValues(alpha: 0.15),
                            blurRadius: 24,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFFD84A79),
                                Color(0xFFBA335E),
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: _buttonPink.withValues(alpha: 0.35),
                                blurRadius: 16,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.verified_user_rounded,
                              size: 44,
                              color: Color(0xFFFFD438),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Title
                    const Text(
                      'Verify Your Identity',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: _textDark,
                        letterSpacing: -0.4,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Subtitle / Why verification is required
                    const Text(
                      'To maintain a genuine, safe, and blessed halal environment, every member completes a quick 1-minute verification.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: _textGrey,
                        height: 1.45,
                      ),
                    ),

                    const SizedBox(height: 28),

                    // 3 Feature Cards
                    _buildVerificationStepCard(
                      icon: Icons.badge_rounded,
                      iconBg: const Color(0xFFFFF0F5),
                      iconColor: _primaryPink,
                      title: 'Government ID Document',
                      subtitle: 'Passport, National ID, or Driving License verified via Didit.me secure protocol.',
                    ),

                    const SizedBox(height: 14),

                    _buildVerificationStepCard(
                      icon: Icons.face_retouching_natural_rounded,
                      iconBg: const Color(0xFFFFF7ED),
                      iconColor: const Color(0xFFFF9E00),
                      title: 'Quick Liveness Selfie',
                      subtitle: 'A fast 3D facial scan to ensure you match your ID photos and prevent fake profiles.',
                    ),

                    const SizedBox(height: 14),

                    _buildVerificationStepCard(
                      icon: Icons.lock_outline_rounded,
                      iconBg: const Color(0xFFE8F9F3),
                      iconColor: const Color(0xFF007554),
                      title: '256-Bit Encrypted & Private',
                      subtitle: 'Your raw documents are encrypted and never shown to other members or third parties.',
                    ),

                    const SizedBox(height: 20),

                    // Trust Badge Pill
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF9FAFB),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.shield_rounded, size: 16, color: Color(0xFF007554)),
                          SizedBox(width: 6),
                          Text(
                            'Powered by Didit.me Decentralized Identity',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF4B5563),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Start Verification Button
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.verificationProcessing);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _buttonPink,
                    foregroundColor: Colors.white,
                    elevation: 4,
                    shadowColor: _buttonPink.withValues(alpha: 0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Start Verification',
                        style: TextStyle(
                          fontSize: 16.5,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward_rounded, size: 18),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVerificationStepCard({
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFDFBFC),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFF3E2EA), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: _textDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12.5,
                    color: _textGrey,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
