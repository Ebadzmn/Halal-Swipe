import 'package:flutter/material.dart';
import 'package:halal_swipe/routes/app_routes.dart';

class WelcomeAuthScreen extends StatelessWidget {
  const WelcomeAuthScreen({super.key});

  // Authentic Raspberry Pink Colors matching screenshot
  static const Color _bgTopColor = Color(0xFFD84A79);
  static const Color _bgMidColor = Color(0xFFC03664);
  static const Color _bgBottomColor = Color(0xFFA6254E);

  static const Color _accentPink = Color(0xFFC7436E);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textMuted = Color(0xFF5A606E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              _bgTopColor,
              _bgMidColor,
              _bgBottomColor,
            ],
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              // Top Brand Section
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(flex: 2),

                      // Logo Card - Crisp 3D Shadow
                      Container(
                        width: 124,
                        height: 124,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(28),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.18),
                              blurRadius: 24,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                // Golden Crescent
                                Icon(
                                  Icons.nightlight_round,
                                  size: 54,
                                  color: const Color(0xFFD4AF37).withValues(alpha: 0.90),
                                ),
                                // Green Heart
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
                                fontWeight: FontWeight.w900,
                                color: Color(0xFFB8860B),
                                letterSpacing: 0.3,
                              ),
                            ),
                            const Text(
                              'MATRIMONY',
                              style: TextStyle(
                                fontSize: 5.5,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF0E6953),
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 22),

                      // App Name
                      const Text(
                        'HalalSwipes',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          letterSpacing: -0.6,
                          shadows: [
                            Shadow(
                              color: Color(0x33000000),
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Tagline
                      Text(
                        'Halal Love. Real Connections. Worldwide.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.5,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withValues(alpha: 0.95),
                          letterSpacing: 0.2,
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
                      color: Colors.black.withValues(alpha: 0.16),
                      blurRadius: 30,
                      offset: const Offset(0, -6),
                    ),
                  ],
                ),
                padding: const EdgeInsets.fromLTRB(22, 26, 22, 24),
                child: SafeArea(
                  top: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // 4 Pillars Grid
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
                        padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 14),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF0F5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('🎉', style: TextStyle(fontSize: 14)),
                            SizedBox(width: 8),
                            Text(
                              'First month completely FREE — No card needed',
                              style: TextStyle(
                                fontSize: 12.5,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF8B2B4C),
                                letterSpacing: 0.1,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // "Create Free Account" Filled Button
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.signup);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _accentPink,
                            foregroundColor: Colors.white,
                            elevation: 4,
                            shadowColor: _accentPink.withValues(alpha: 0.45),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Create Free Account',
                            style: TextStyle(
                              fontSize: 16.5,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // "I already have an account" Outlined Button
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.login);
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: _accentPink,
                            side: const BorderSide(color: _accentPink, width: 1.6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'I already have an account',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: _accentPink,
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
                              color: _accentPink.withValues(alpha: 0.3),
                              width: 1.2,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('⚡', style: TextStyle(fontSize: 16)),
                              SizedBox(width: 8),
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
                          color: _textMuted,
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
            fontSize: 11.5,
            height: 1.15,
            fontWeight: FontWeight.w600,
            color: Color(0xFF4A4E5E),
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
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF65B741).withValues(alpha: 0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const Icon(
        Icons.check_rounded,
        size: 16,
        color: Colors.white,
      ),
    );
  }

  static Widget _buildDiamondRing() {
    return const Icon(
      Icons.diamond_outlined,
      size: 25,
      color: Color(0xFF56CCF2),
    );
  }
}
