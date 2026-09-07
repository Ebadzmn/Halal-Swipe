import 'package:flutter/material.dart';
import 'package:halal_swipe/features/matches/models/match_profile.dart';
import 'package:halal_swipe/routes/app_routes.dart';

class MatchReadyScreen extends StatelessWidget {
  final MatchProfile profile;

  const MatchReadyScreen({super.key, required this.profile});

  static const Color _primaryPink = Color(0xFFD64D7B);
  static const Color _buttonPink = Color(0xFFD44F7A);
  static const Color _emeraldGreen = Color(0xFF007554);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFD84A79),
              Color(0xFFBA335E),
              Color(0xFF70102E),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Top Close button
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.close_rounded,
                        color: Colors.white, size: 26),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),

                const Spacer(flex: 2),

                // Top Match Badge
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: Colors.white.withValues(alpha: 0.3)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('🌙 ', style: TextStyle(fontSize: 14)),
                      Text(
                        '${profile.matchScore}% Halal Compatibility',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 18),

                // "It's a Match!" Title
                const Text(
                  "It's a Match! 🎉",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: -0.6,
                    shadows: [
                      Shadow(
                        color: Color(0x40000000),
                        blurRadius: 12,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  'You and ${profile.name} are mutually interested in exploring a blessed union.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.5,
                    color: Colors.white.withValues(alpha: 0.92),
                    height: 1.4,
                  ),
                ),

                const SizedBox(height: 36),

                // Dual Avatar Overlapping Circles
                SizedBox(
                  width: 220,
                  height: 120,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // User Avatar (Left)
                      Positioned(
                        left: 10,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(color: Colors.white, width: 3),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.25),
                                blurRadius: 16,
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              '🧔🏻‍♂️',
                              style: TextStyle(fontSize: 48),
                            ),
                          ),
                        ),
                      ),

                      // Match Avatar (Right)
                      Positioned(
                        right: 10,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(color: Colors.white, width: 3),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.25),
                                blurRadius: 16,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              profile.avatarEmoji,
                              style: const TextStyle(fontSize: 48),
                            ),
                          ),
                        ),
                      ),

                      // Center Heart Badge
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFFFFD438),
                          border: Border.all(color: Colors.white, width: 2.5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.2),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.favorite_rounded,
                          color: Color(0xFF9E1F45),
                          size: 22,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 36),

                // Next Step Guidance Pill Box
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                        color: Colors.white.withValues(alpha: 0.25)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.mosque_rounded,
                              color: Color(0xFFFFD438), size: 18),
                          SizedBox(width: 8),
                          Text(
                            'Recommended Next Steps:',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '1. Follow the Nikah Roadmap with Azura guidance\n2. Involve your Wali early for transparency and barakah',
                        style: TextStyle(
                          fontSize: 12.5,
                          color: Colors.white.withValues(alpha: 0.9),
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(flex: 3),

                // Primary CTA: Start Nikah Journey
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.roadmap);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: _buttonPink,
                      elevation: 4,
                      shape: const StadiumBorder(),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Start the Nikah Journey',
                          style: TextStyle(
                            fontSize: 16.5,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF8A1E41),
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward_rounded,
                            size: 18, color: Color(0xFF8A1E41)),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                // Secondary Action: Continue to Chat
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.chat,
                        arguments: profile);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Continue to Chat',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.white.withValues(alpha: 0.9),
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
