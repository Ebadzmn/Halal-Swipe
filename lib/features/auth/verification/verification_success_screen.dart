import 'package:flutter/material.dart';
import 'package:halal_swipe/routes/app_routes.dart';

class VerificationSuccessScreen extends StatelessWidget {
  const VerificationSuccessScreen({super.key});

  static const Color _primaryPink = Color(0xFFD64D7B);
  static const Color _buttonPink = Color(0xFFD44F7A);
  static const Color _emeraldGreen = Color(0xFF007554);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textGrey = Color(0xFF5A606E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 20.0),
          child: Column(
            children: [
              const Spacer(flex: 2),

              // 3D Emerald & Gold Success Shield Badge
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFE8F9F3),
                  boxShadow: [
                    BoxShadow(
                      color: _emeraldGreen.withValues(alpha: 0.18),
                      blurRadius: 28,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Center(
                  child: Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF009668),
                          Color(0xFF006B4D),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: _emeraldGreen.withValues(alpha: 0.35),
                          blurRadius: 18,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.check_rounded,
                        size: 56,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Title: "You're Verified"
              const Text(
                "You're Verified!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: _textDark,
                  letterSpacing: -0.5,
                ),
              ),

              const SizedBox(height: 10),

              // Verification Badge Pill
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F9F3),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFFA8E6CF),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.verified_rounded,
                      size: 16,
                      color: _emeraldGreen,
                    ),
                    SizedBox(width: 6),
                    Text(
                      'ID & Biometrics Confirmed',
                      style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w700,
                        color: _emeraldGreen,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Short explanation
              Container(
                constraints: const BoxConstraints(maxWidth: 320),
                child: const Text(
                  'Your identity has been authenticated. Your profile now carries the prestigious Verified Badge, giving members 100% confidence in your intentions.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.5,
                    color: _textGrey,
                    height: 1.5,
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // Verified Benefits List
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFDFBFC),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: const Color(0xFFF3E2EA), width: 1.2),
                ),
                child: Column(
                  children: [
                    _buildBenefitRow(
                      icon: Icons.shield_rounded,
                      text: 'Higher profile visibility & match rate',
                    ),
                    const Divider(height: 20, color: Color(0xFFF3E2EA)),
                    _buildBenefitRow(
                      icon: Icons.visibility_rounded,
                      text: 'Full control over photo blurring & unlocks',
                    ),
                    const Divider(height: 20, color: Color(0xFFF3E2EA)),
                    _buildBenefitRow(
                      icon: Icons.favorite_rounded,
                      text: 'Direct access to serious Muslim matches',
                    ),
                  ],
                ),
              ),

              const Spacer(flex: 3),

              // Continue Button
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.setupProfile);
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
                        'Continue to Setup Profile',
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

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildBenefitRow({
    required IconData icon,
    required String text,
  }) {
    return Row(
      children: [
        Icon(icon, color: _primaryPink, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2D3142),
            ),
          ),
        ),
      ],
    );
  }
}
