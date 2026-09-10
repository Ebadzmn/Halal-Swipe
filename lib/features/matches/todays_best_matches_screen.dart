import 'package:flutter/material.dart';
import 'package:halal_swipe/features/matches/models/match_profile.dart';
import 'package:halal_swipe/routes/app_routes.dart';

class TodaysBestMatchesScreen extends StatelessWidget {
  const TodaysBestMatchesScreen({super.key});

  static const Color _primaryPink = Color(0xFF941235);
  static const Color _buttonPink = Color(0xFF941235);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textGrey = Color(0xFF5A606E);
  static const Color _emeraldGreen = Color(0xFF007554);

  @override
  Widget build(BuildContext context) {
    final matches = MatchProfile.sampleMatches;

    return Scaffold(
      backgroundColor: const Color(0xFFFDFBFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: _primaryPink, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.star_rounded, color: Color(0xFFFFB800), size: 22),
            SizedBox(width: 6),
            Text(
              "Today's Best Matches",
              style: TextStyle(
                color: _textDark,
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          itemCount: matches.length,
          itemBuilder: (context, index) {
            final profile = matches[index];
            return _buildFeaturedMatchCard(context, profile);
          },
        ),
      ),
    );
  }

  Widget _buildFeaturedMatchCard(BuildContext context, MatchProfile profile) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF3E2EA), width: 1.4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Photo Section with Match Pill & Blur Option
          Stack(
            children: [
              Container(
                height: 180,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFD84A79),
                      Color(0xFFBA335E),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22),
                    topRight: Radius.circular(22),
                  ),
                ),
                child: Center(
                  child: Text(
                    profile.avatarEmoji,
                    style: const TextStyle(fontSize: 72),
                  ),
                ),
              ),

              // Match Score Pill Top Left
              Positioned(
                top: 14,
                left: 14,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: _emeraldGreen,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.auto_awesome_rounded,
                          color: Color(0xFFFFD438), size: 14),
                      const SizedBox(width: 4),
                      Text(
                        '${profile.matchScore}% Compatibility',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Photo Blur Badge Top Right
              if (profile.isPhotoBlurred)
                Positioned(
                  top: 14,
                  right: 14,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.unlockPhoto,
                          arguments: profile);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.lock_rounded,
                              color: Color(0xFFFFD438), size: 14),
                          SizedBox(width: 4),
                          Text(
                            'Unlock',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),

          // Content Details
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${profile.name}, ${profile.age}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: _textDark,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Icon(
                          Icons.verified_rounded,
                          color: Color(0xFF00E676),
                          size: 18,
                        ),
                      ],
                    ),
                    Text(
                      profile.location.split('(')[0],
                      style: const TextStyle(
                        fontSize: 12.5,
                        color: _textGrey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                Text(
                  '${profile.profession} • ${profile.education}',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: _primaryPink,
                  ),
                ),

                const SizedBox(height: 14),

                // Why You Match Box
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF0F5),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '✨ Top Synergy Factors:',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF8B2B4C),
                        ),
                      ),
                      const SizedBox(height: 4),
                      ...profile.compatibilityReasons.take(2).map(
                            (r) => Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: Text(
                                '• $r',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF4A4E5E),
                                ),
                              ),
                            ),
                          ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.matchDetail,
                              arguments: profile);
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: _textDark,
                          side: const BorderSide(
                              color: Color(0xFFE2E8F0), width: 1.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          'View Profile',
                          style: TextStyle(
                              fontSize: 13.5, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.matchReady,
                              arguments: profile);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _buttonPink,
                          foregroundColor: Colors.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.favorite_rounded, size: 16),
                            SizedBox(width: 6),
                            Text(
                              'Interested',
                              style: TextStyle(
                                  fontSize: 13.5, fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
