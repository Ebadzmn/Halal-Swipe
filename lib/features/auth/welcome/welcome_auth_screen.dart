import 'package:flutter/material.dart';
import 'package:halal_swipe/routes/app_routes.dart';

class WelcomeAuthScreen extends StatelessWidget {
  const WelcomeAuthScreen({super.key});

  static const Color _primaryPink = Color(0xFFCE5279);
  static const Color _textDark = Color(0xFF1E2022);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _primaryPink,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Top Section with App Logo & Title
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),

                    // App Logo Box
                    Container(
                      width: 120,
                      height: 120,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.12),
                            blurRadius: 18,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Crescent & Heart emblem
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              // Crescent Moon
                              Icon(
                                Icons.nightlight_round,
                                size: 52,
                                color: const Color(0xFFD4AF37).withValues(alpha: 0.85),
                              ),
                              // Heart
                              const Icon(
                                Icons.favorite_rounded,
                                size: 34,
                                color: Color(0xFF0E6953),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'HalalSwipes',
                            style: TextStyle(
                              fontSize: 10.5,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFFB8860B),
                              letterSpacing: 0.2,
                            ),
                          ),
                          const Text(
                            'MATRIMONY',
                            style: TextStyle(
                              fontSize: 5.5,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF0E6953),
                              letterSpacing: 0.8,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // App Name
                    const Text(
                      'HalalSwipes',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: -0.5,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Tagline
                    Text(
                      'Halal Love. Real Connections. Worldwide.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withValues(alpha: 0.95),
                        letterSpacing: 0.1,
                      ),
                    ),

                    const Spacer(),
                  ],
                ),
              ),
            ),

            // Bottom White Sheet with Features & Buttons
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
              child: SafeArea(
                top: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // 4 Feature Pillars Grid
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildFeatureItem(
                          iconWidget: _buildMiniLock(),
                          label: 'Blurred\nProfiles',
                        ),
                        _buildFeatureItem(
                          iconWidget: _buildGreenCheckbox(),
                          label: 'ID\nVerified',
                        ),
                        _buildFeatureItem(
                          iconWidget: _buildDiamondRing(),
                          label: 'Marriage\nFocused',
                        ),
                        _buildFeatureItem(
                          iconWidget: const Text(
                            '🤲',
                            style: TextStyle(fontSize: 26),
                          ),
                          label: 'Halal\nCourtship',
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    // Free Trial Banner pill
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF0F5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('🎉', style: TextStyle(fontSize: 14)),
                          SizedBox(width: 6),
                          Text(
                            'First month completely FREE — No card needed',
                            style: TextStyle(
                              fontSize: 12.5,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF8B2B4C),
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
                          backgroundColor: _primaryPink,
                          foregroundColor: Colors.white,
                          elevation: 3,
                          shadowColor: _primaryPink.withValues(alpha: 0.4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        child: const Text(
                          'Create Free Account',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // "I already have an account" Outlined Button
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.login);
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: _primaryPink,
                          side: const BorderSide(color: _primaryPink, width: 1.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        child: const Text(
                          'I already have an account',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFB03A62),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // "Instant Demo Login (1-Click)" Soft Button
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, AppRoutes.home);
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFF7F9),
                          side: BorderSide(
                            color: _primaryPink.withValues(alpha: 0.35),
                            width: 1.2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('⚡', style: TextStyle(fontSize: 16)),
                            SizedBox(width: 6),
                            Text(
                              'Instant Demo Login (1-Click)',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF8B2B4C),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Terms Footer
                    Text(
                      'By signing up you agree to our Terms & Privacy Policy. 18+ only.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 11.5,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildFeatureItem({
    required Widget iconWidget,
    required String label,
  }) {
    return Column(
      children: [
        SizedBox(
          height: 32,
          child: Center(child: iconWidget),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 11,
            height: 1.15,
            fontWeight: FontWeight.w600,
            color: Color(0xFF555B6E),
          ),
        ),
      ],
    );
  }

  static Widget _buildMiniLock() {
    return SizedBox(
      width: 22,
      height: 26,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFF56CCF2),
                  width: 2.8,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: 20,
              height: 16,
              decoration: BoxDecoration(
                color: const Color(0xFFFFB800),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Container(
                  width: 3.5,
                  height: 6,
                  decoration: BoxDecoration(
                    color: const Color(0xFF4A3E1B),
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildGreenCheckbox() {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        color: const Color(0xFF65B741),
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Icon(
        Icons.check,
        size: 16,
        color: Colors.white,
      ),
    );
  }

  static Widget _buildDiamondRing() {
    return const Icon(
      Icons.diamond_outlined,
      size: 24,
      color: Color(0xFF56CCF2),
    );
  }
}
