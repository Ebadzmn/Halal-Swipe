import 'package:flutter/material.dart';
import 'package:halal_swipe/features/profile/edit_profile_screen.dart';
import 'package:halal_swipe/features/profile/models/profile_setup_data.dart';
import 'package:halal_swipe/routes/app_routes.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  static const Color _brandBurgundy = Color(0xFF5A051D);
  static const Color _cardBurgundy = Color(0xFF5E0B22);
  static const Color _primaryPink = Color(0xFF941235);
  static const Color _emeraldGreen = Color(0xFF00A86B);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textGrey = Color(0xFF6B7280);

  UserProfileData _profile = UserProfileData();

  void _navigateToEditProfile() async {
    final updatedProfile = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EditProfileScreen(profileData: _profile),
      ),
    );

    if (updatedProfile != null && updatedProfile is UserProfileData) {
      setState(() {
        _profile = updatedProfile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFBF9FA),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 14.0),
          child: Container(
            margin: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFF4A4E5A), size: 16),
              onPressed: () => Navigator.pop(context),
              padding: EdgeInsets.zero,
            ),
          ),
        ),
        title: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Curated Matches ',
                  style: TextStyle(
                    color: _textDark,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text('🌙', style: TextStyle(fontSize: 14)),
              ],
            ),
            const SizedBox(height: 1),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('★ ', style: TextStyle(color: Color(0xFFC07000), fontSize: 9)),
                Text(
                  'HANDCRAFTED SELECTION',
                  style: TextStyle(
                    color: Color(0xFFB06010),
                    fontSize: 9.5,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.8,
                  ),
                ),
              ],
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: Container(
              margin: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.tune_rounded, color: Color(0xFF4A4E5A), size: 18),
                onPressed: () => Navigator.pushNamed(context, AppRoutes.setupPreferences),
                padding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // "My Profile" Title Header with Edit Pencil Icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'My Profile',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: _textDark,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit_outlined, color: Color(0xFF757A88), size: 22),
                    onPressed: _navigateToEditProfile,
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // 1. Top Deep Maroon Profile Card with 3 Badges
              _buildTopHeroProfileCard(),

              const SizedBox(height: 16),

              // 2. Yellow/Cream "Profile is in Private Draft" Card
              _buildPrivateDraftCard(),

              const SizedBox(height: 14),

              // 3. Green "Noor Shield Privacy Active" Card
              _buildNoorShieldCard(),

              const SizedBox(height: 14),

              // 4. Preferences & Verify ID Split Row
              _buildPreferencesAndVerifyRow(),

              const SizedBox(height: 16),

              // 5. Deen & Religious Practice Card
              _buildDeenAndReligiousCard(),

              const SizedBox(height: 16),

              // 6. Education & Career Card
              _buildEducationAndCareerCard(),

              const SizedBox(height: 16),

              // 7. Family & Marriage Vision Card
              _buildFamilyAndMarriageCard(),

              const SizedBox(height: 16),

              // 8. Islamic Values & Interests Tags Card
              _buildIslamicValuesAndInterestsCard(),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopHeroProfileCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: _cardBurgundy,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: _cardBurgundy.withValues(alpha: 0.35),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Avatar with Double Ring and Green Check Badge
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: 76,
                    height: 76,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF1E1F24),
                      border: Border.all(color: const Color(0xFFFFD438), width: 2.5),
                    ),
                    child: Center(
                      child: Text(
                        _profile.avatarEmoji,
                        style: const TextStyle(fontSize: 40),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2.5),
                      decoration: const BoxDecoration(
                        color: Color(0xFF00C853),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.check_rounded, color: Colors.white, size: 13),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            _profile.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Icon(Icons.check_circle_rounded, color: Color(0xFF00E676), size: 18),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Text(
                      '${_profile.profession}  •  ${_profile.height}',
                      style: TextStyle(
                        fontSize: 12.5,
                        color: Colors.white.withValues(alpha: 0.85),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.location_on_rounded, color: Color(0xFFFFD438), size: 14),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            _profile.location,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFFFFD438),
                              fontWeight: FontWeight.w700,
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

          const SizedBox(height: 18),

<<<<<<< HEAD
          // 3 Pill Badges at Bottom of Maroon Card (Distinguishing ID from Marriage Intent)
          Row(
            children: [
              _buildMaroonPillBadge('INTENT BADGE', 'Verified 4/4 🎯', const Color(0xFF00E676)),
              const SizedBox(width: 8),
              _buildMaroonPillBadge('NIKAH TIMELINE', 'Within 6 Mos', const Color(0xFFFFD438)),
=======
          // 3 Pill Badges at Bottom of Maroon Card
          Row(
            children: [
              _buildMaroonPillBadge('ID VERIFICATION', 'Verified ✓', const Color(0xFF00E676)),
              const SizedBox(width: 8),
              _buildMaroonPillBadge('PROFILE SCORE', '98% Complete', const Color(0xFFFFD438)),
>>>>>>> c46467f7fa99b010fcd2783f93f04e8c194b88c7
              const SizedBox(width: 8),
              _buildMaroonPillBadge('WALI STATUS', 'Linked 🛡️', const Color(0xFF4FC3F7)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMaroonPillBadge(String topTitle, String bottomVal, Color valColor) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.22),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
        ),
        child: Column(
          children: [
            Text(
              topTitle,
              style: TextStyle(
                fontSize: 8.5,
                fontWeight: FontWeight.w900,
                color: Colors.white.withValues(alpha: 0.7),
                letterSpacing: 0.4,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              bottomVal,
              style: TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.w900,
                color: valColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrivateDraftCard() {
    final isPublished = _profile.isPublishedForMatches;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFDF5),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFFFECC2), width: 1.4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Lock Icon in Rounded Yellow Box
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF4D6),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.lock_outline_rounded,
                  color: Color(0xFFC07A00),
                  size: 22,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Profile is in Private\nDraft',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: _textDark,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFE8B2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: const [
                              Text('⏸ ', style: TextStyle(fontSize: 9, color: Color(0xFF8A5800))),
                              Text(
                                'Paused',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF8A5800),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Switch
              Switch(
                value: isPublished,
                activeColor: _emeraldGreen,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: const Color(0xFFD1D5DB),
                onChanged: (val) {
                  setState(() {
                    _profile.isPublishedForMatches = val;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Your profile is hidden from suitors. Post it whenever you are ready to receive matches.',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF5A606E),
              height: 1.35,
            ),
          ),
          const SizedBox(height: 14),
          // Deep Maroon Button with Rocket Icon
          SizedBox(
            width: double.infinity,
            height: 46,
            child: ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _profile.isPublishedForMatches = true;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('🎉 Profile posted! Visible to compatible matches.'),
                    backgroundColor: _emeraldGreen,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                );
              },
              icon: const Icon(Icons.rocket_launch_rounded, color: Color(0xFFFFD438), size: 18),
              label: const Text(
                'Post Profile to Matches Now',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5A051D),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoorShieldCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF3FAF7),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFBCE7D9), width: 1.2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Green Shield Icon in Rounded Box
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF00A86B),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.shield_rounded, color: Colors.white, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Noor Shield Privacy Active',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF00593B),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _navigateToEditProfile(),
                      child: const Text(
                        'Manage',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF007554),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                const Text(
                  'Extra photos stay modestly blurred until you mutually accept an unlock request.',
                  style: TextStyle(
                    fontSize: 11.5,
                    color: Color(0xFF4A6B5E),
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

  Widget _buildPreferencesAndVerifyRow() {
    return Row(
      children: [
        // Left: Preferences
        Expanded(
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, AppRoutes.setupPreferences),
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFF1EBF0), width: 1.2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.02),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFDF0F3),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(Icons.tune_rounded, color: _primaryPink, size: 20),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Preferences',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w900,
                            color: _textDark,
                          ),
                        ),
                        SizedBox(height: 1),
                        Text(
                          'Marriage Filter',
                          style: TextStyle(fontSize: 11, color: _textGrey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        // Right: Verify ID
        Expanded(
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, AppRoutes.verifyIdentity),
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFF1EBF0), width: 1.2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.02),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F8F2),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(Icons.verified_outlined, color: _emeraldGreen, size: 20),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Verify ID',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w900,
                            color: _textDark,
                          ),
                        ),
                        SizedBox(height: 1),
                        Text(
                          'Govt. Verified',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: _emeraldGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDeenAndReligiousCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF1EBF0), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF5E8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text('🕌', style: TextStyle(fontSize: 18)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Deen & Religious Practice',
                        style: TextStyle(
                          fontSize: 14.5,
                          fontWeight: FontWeight.w900,
                          color: _textDark,
                        ),
                      ),
                      Text(
                        'Core faith foundation & habits',
                        style: TextStyle(fontSize: 11, color: _textGrey),
                      ),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: _navigateToEditProfile,
                child: const Text(
                  'Edit',
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w800,
                    color: _primaryPink,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          // 1. Practice Level Row
          _buildDeenRowItem(
            icon: Icons.star_rounded,
            iconColor: const Color(0xFF941235),
            label: 'Practice Level',
            pillText: _profile.religiousPracticeLevel,
          ),

          const SizedBox(height: 14),

          // 2. Prayer Habits Row
          _buildDeenRowItem(
            icon: Icons.access_time_filled_rounded,
            iconColor: const Color(0xFFC07A00),
            label: 'Prayer Habits',
            pillText: _profile.prayerHabits,
          ),

          const SizedBox(height: 14),

          // 3. Madhhab Row
          _buildDeenRowItem(
            icon: Icons.menu_book_rounded,
            iconColor: const Color(0xFF00A86B),
            label: 'Madhhab',
            pillText: _profile.madhhab,
          ),

          const SizedBox(height: 18),

          // Bottom Pills (Halal Food Only & Never Smokes / No Alcohol)
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFBF0),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFFFE8B2)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('🌙 ', style: TextStyle(fontSize: 10)),
                      Flexible(
                        child: Text(
                          'Halal Food Only',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 10.5,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF8A5800),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF8F9),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFFFD6E0)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.block_rounded, size: 11, color: Color(0xFFD32F2F)),
                      SizedBox(width: 3),
                      Flexible(
                        child: Text(
                          'Never Smokes / Alcohol',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF8A1838),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEducationAndCareerCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF1EBF0), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFF6FF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text('🎓', style: TextStyle(fontSize: 18)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Education & Profession',
                        style: TextStyle(
                          fontSize: 14.5,
                          fontWeight: FontWeight.w900,
                          color: _textDark,
                        ),
                      ),
                      Text(
                        'Career, study & income background',
                        style: TextStyle(fontSize: 11, color: _textGrey),
                      ),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: _navigateToEditProfile,
                child: const Text(
                  'Edit',
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w800,
                    color: _primaryPink,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          _buildDeenRowItem(
            icon: Icons.school_rounded,
            iconColor: const Color(0xFF2563EB),
            label: 'Education Level',
            pillText: _profile.education,
          ),

          const SizedBox(height: 14),

          _buildDeenRowItem(
            icon: Icons.work_rounded,
            iconColor: const Color(0xFF0284C7),
            label: 'Profession',
            pillText: _profile.profession,
          ),

          const SizedBox(height: 14),

          _buildDeenRowItem(
            icon: Icons.business_center_rounded,
            iconColor: const Color(0xFF0D9488),
            label: 'Job Role / Focus',
            pillText: _profile.jobOrBusiness,
          ),

          const SizedBox(height: 14),

          _buildDeenRowItem(
            icon: Icons.payments_rounded,
            iconColor: const Color(0xFF059669),
            label: 'Income Range',
            pillText: _profile.incomeRange,
          ),
        ],
      ),
    );
  }

  Widget _buildFamilyAndMarriageCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF1EBF0), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF0F5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text('👨‍👩‍👧', style: TextStyle(fontSize: 18)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Family & Marriage Vision',
                        style: TextStyle(
                          fontSize: 14.5,
                          fontWeight: FontWeight.w900,
                          color: _textDark,
                        ),
                      ),
                      Text(
                        'Living, children & marital plans',
                        style: TextStyle(fontSize: 11, color: _textGrey),
                      ),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: _navigateToEditProfile,
                child: const Text(
                  'Edit',
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w800,
                    color: _primaryPink,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          _buildDeenRowItem(
            icon: Icons.home_rounded,
            iconColor: const Color(0xFFD97706),
            label: 'Family Values',
            pillText: _profile.familyValues,
          ),

          const SizedBox(height: 14),

          _buildDeenRowItem(
            icon: Icons.apartment_rounded,
            iconColor: const Color(0xFF7C3AED),
            label: 'Living Arrangement',
            pillText: _profile.livingArrangement,
          ),

          const SizedBox(height: 14),

          _buildDeenRowItem(
            icon: Icons.child_care_rounded,
            iconColor: const Color(0xFFDB2777),
            label: 'Children Preference',
            pillText: _profile.childrenPreference,
          ),

          const SizedBox(height: 14),

          _buildDeenRowItem(
            icon: Icons.smoke_free_rounded,
            iconColor: const Color(0xFF059669),
            label: 'Smoking Status',
            pillText: _profile.smokingStatus,
          ),
        ],
      ),
    );
  }

  Widget _buildIslamicValuesAndInterestsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF1EBF0), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0FDF4),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text('🌟', style: TextStyle(fontSize: 18)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Core Values & Lifestyle',
                        style: TextStyle(
                          fontSize: 14.5,
                          fontWeight: FontWeight.w900,
                          color: _textDark,
                        ),
                      ),
                      Text(
                        'Key principles and everyday interests',
                        style: TextStyle(fontSize: 11, color: _textGrey),
                      ),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: _navigateToEditProfile,
                child: const Text(
                  'Edit',
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w800,
                    color: _primaryPink,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          const Text(
            'Islamic Principles & Values',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: Color(0xFF4A4E5E),
            ),
          ),
          const SizedBox(height: 8),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _profile.islamicValues.map(
              (v) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF0F5),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFFFD1DC)),
                ),
                child: Text(
                  v,
                  style: const TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w800,
                    color: _primaryPink,
                  ),
                ),
              ),
            ).toList(),
          ),

          const SizedBox(height: 14),

          const Text(
            'Hobbies & Lifestyle Interests',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: Color(0xFF4A4E5E),
            ),
          ),
          const SizedBox(height: 8),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _profile.hobbies.map(
              (h) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3FAF7),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFBCE7D9)),
                ),
                child: Text(
                  h,
                  style: const TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF007554),
                  ),
                ),
              ),
            ).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildDeenRowItem({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String pillText,
  }) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: 18),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12.5,
            color: Color(0xFF4A4E5E),
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        Flexible(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F8FA),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE5E7EB)),
            ),
            child: Text(
              pillText,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.w800,
                color: _textDark,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
