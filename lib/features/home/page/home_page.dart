import 'package:flutter/material.dart';
import 'package:halal_swipe/features/chat/messages_list_screen.dart';
import 'package:halal_swipe/features/matches/models/match_profile.dart';
import 'package:halal_swipe/features/profile/my_profile_screen.dart';
import 'package:halal_swipe/features/roadmap/nikah_roadmap_screen.dart';
import 'package:halal_swipe/routes/app_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  int _currentSoulmateIndex = 0;
  String _selectedFilter = 'All Matches';

  final List<String> _filters = [
    'All Matches',
    'Soulmate',
    'Strong',
    'Good',
  ];

  // Refined Color Palette
  static const Color _brandBurgundy = Color(0xFF8A1E41); // Deep Raspberry/Burgundy for Introduce button
  static const Color _buttonPink = Color(0xFF941235);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textGrey = Color(0xFF757A88);
  static const Color _goldAccent = Color(0xFFFFC72C);

  List<MatchProfile> get _filteredGridProfiles {
    if (_selectedFilter == 'All Matches') {
      return MatchProfile.compatibleGrid;
    }
    return MatchProfile.compatibleGrid
        .where((p) => p.matchTier.toLowerCase() == _selectedFilter.toLowerCase())
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFB),
      appBar: _currentIndex == 0 ? _buildHomeAppBar() : null,
      body: _buildCurrentTab(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 16,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: _buttonPink,
          unselectedItemColor: Colors.grey.shade400,
          selectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.w800, fontSize: 11),
          unselectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.w600, fontSize: 11),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_rounded),
              label: 'Matches',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map_rounded),
              label: 'Roadmap',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_rounded),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.auto_awesome_rounded),
              label: 'Azura AI',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentTab() {
    switch (_currentIndex) {
      case 0:
        return _buildCuratedMatchesBody();
      case 1:
        return const NikahRoadmapScreen();
      case 2:
        return const MessagesListScreen();
      case 3:
        return _buildAzuraPlaceholder();
      case 4:
        return const MyProfileScreen();
      default:
        return _buildCuratedMatchesBody();
    }
  }

  PreferredSizeWidget _buildHomeAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFFFAFAFB),
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 14.0),
        child: Container(
          margin: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFEFEFEF), width: 1.2),
          ),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: _textDark,
            size: 15,
          ),
        ),
      ),
      title: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'Curated Matches',
                style: TextStyle(
                  fontFamily: 'serif',
                  color: _textDark,
                  fontSize: 21,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.3,
                ),
              ),
              SizedBox(width: 5),
              Text('🌙', style: TextStyle(fontSize: 18)),
            ],
          ),
          const SizedBox(height: 2),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('★ ', style: TextStyle(fontSize: 9.5, color: Color(0xFFC8902A))),
              Text(
                'HANDCRAFTED SELECTION',
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFFC8902A),
                  letterSpacing: 0.8,
                ),
              ),
            ],
          ),
        ],
      ),
      centerTitle: true,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 16, top: 6, bottom: 6),
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFEFEFEF), width: 1.2),
          ),
          child: IconButton(
            icon: const Icon(Icons.tune_rounded, color: _textDark, size: 18),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.setupPreferences);
            },
          ),
        ),
      ],
    );
  }

  // ==========================================================
  // CURATED MATCHES BODY
  // ==========================================================
  Widget _buildCuratedMatchesBody() {
    final soulmateList = MatchProfile.soulmates;
    final gridList = _filteredGridProfiles;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Subheader
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 4.0),
              child: Text(
                'Azura AI alignment based on shared values, deen & timelines',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: _textGrey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // 1. Soulmate Alignment Header Row (with Serif Font & Top Tier badge)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Soulmate Alignment',
                  style: TextStyle(
                    fontFamily: 'serif',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: _textDark,
                    letterSpacing: -0.3,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 9, vertical: 3.5),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFDF0F3),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFFFDDE5), width: 1),
                  ),
                  child: const Text(
                    'Top Tier',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFBA335E),
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  '${_currentSoulmateIndex + 1} OF ${soulmateList.length}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF8E95A5),
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          // 2. Large Soulmate Card Carousel
          SizedBox(
            height: 520,
            child: PageView.builder(
              controller: PageController(viewportFraction: 0.88),
              physics: const BouncingScrollPhysics(),
              onPageChanged: (idx) {
                setState(() {
                  _currentSoulmateIndex = idx;
                });
              },
              itemCount: soulmateList.length,
              itemBuilder: (context, index) {
                final profile = soulmateList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: _buildExactSoulmateCard(profile),
                );
              },
            ),
          ),

          const SizedBox(height: 24),

          // 3. Category Filter Tabs (All Matches, Soulmate, Strong, Good)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: const Color(0xFFF6F3F5),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: _filters.map((filter) {
                  final isSelected = _selectedFilter == filter;
                  return Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedFilter = filter;
                        });
                      },
                      borderRadius: BorderRadius.circular(25),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(vertical: 9),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.06),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ]
                              : null,
                        ),
                        child: Text(
                          filter,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12.5,
                            fontWeight: isSelected
                                ? FontWeight.w800
                                : FontWeight.w600,
                            color: isSelected ? _textDark : _textGrey,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          const SizedBox(height: 18),

          // 4. Statistics 3-Box Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              children: [
                Expanded(
                  child: _buildStatTierBox(
                    dotColor: const Color(0xFFFFB800),
                    count: '3',
                    title: 'Soulmate',
                    subtitle: '95%+ Match',
                    borderColor: const Color(0xFFFFE39B),
                    isSelected: _selectedFilter == 'Soulmate',
                    onTap: () => setState(() => _selectedFilter = 'Soulmate'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildStatTierBox(
                    dotColor: const Color(0xFFE56A8F),
                    count: '2',
                    title: 'Strong',
                    subtitle: '85–94%',
                    borderColor: const Color(0xFFFFD1DC),
                    isSelected: _selectedFilter == 'Strong',
                    onTap: () => setState(() => _selectedFilter = 'Strong'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildStatTierBox(
                    dotColor: Colors.grey.shade400,
                    count: '1',
                    title: 'Good',
                    subtitle: '75–84%',
                    borderColor: const Color(0xFFE5E7EB),
                    isSelected: _selectedFilter == 'Good',
                    onTap: () => setState(() => _selectedFilter = 'Good'),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // 5. Compatible Introductions Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Compatible Introductions',
                  style: TextStyle(
                    fontFamily: 'serif',
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    color: _textDark,
                    letterSpacing: -0.3,
                  ),
                ),
                Text(
                  'View All',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF8A1E41),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          // 6. 2-Column Grid (Bottom Section)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 0.68,
              ),
              itemCount: gridList.length,
              itemBuilder: (context, index) {
                final profile = gridList[index];
                return _buildCompatibleIntroCard(profile);
              },
            ),
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  // ==========================================================
  // EXACT SOULMATE CARD (PIXEL-PERFECT REPLICA)
  // ==========================================================
  Widget _buildExactSoulmateCard(MatchProfile profile) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.matchDetail, arguments: profile);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: const Color(0xFFF0EBEF), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: Column(
            children: [
              // Upper Photo Area
              Expanded(
                flex: 13,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Real Realistic Photo / Image
                    Image.asset(
                      'assets/images/amina.jpg',
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xFFD84A79),
                                Color(0xFFBA335E),
                              ],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              profile.avatarEmoji,
                              style: const TextStyle(fontSize: 84),
                            ),
                          ),
                        );
                      },
                    ),

                    // Soulmate Match Tag (Top Left - Pill with Gold Dot)
                    Positioned(
                      top: 14,
                      left: 14,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 11, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF282424).withValues(alpha: 0.65),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.circle, color: Color(0xFFFFC72C), size: 8),
                            SizedBox(width: 6),
                            Text(
                              'Soulmate Match',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11.5,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // 99% Match Badge (Top Right - Golden Pill)
                    Positioned(
                      top: 14,
                      right: 14,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 11, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFCB3A),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '${profile.matchScore}% Match',
                          style: const TextStyle(
                            color: Color(0xFF2B2104),
                            fontSize: 11.5,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),

                    // Dark Shadow Gradient at bottom of image
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      height: 100,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withValues(alpha: 0.85),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Name & Profession Text over image (Exact typography)
                    Positioned(
                      bottom: 12,
                      left: 16,
                      right: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${profile.name}, ${profile.age}',
                            style: const TextStyle(
                              fontFamily: 'serif',
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Row(
                            children: [
                              const Icon(Icons.location_on_rounded,
                                  size: 14, color: Color(0xFFFFCB3A)),
                              const SizedBox(width: 4),
                              Text(
                                '${profile.location} • ${profile.profession}',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Lower Content Area (Exact Card Layout)
              Expanded(
                flex: 9,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Intent: Within 6 Months | HIGH URGENCY
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 8.5),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFCF8F3),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: const Color(0xFFF4E5D4)),
                        ),
                        child: Row(
                          children: [
                            const Text('💍', style: TextStyle(fontSize: 14)),
                            const SizedBox(width: 8),
                            Text(
                              'Intent: ${profile.intent}',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF2E2000),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              profile.intentTag.isNotEmpty
                                  ? profile.intentTag
                                  : 'HIGH URGENCY',
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w900,
                                color: Color(0xFFA0721E),
                                letterSpacing: 0.4,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Tags (Practicing Sunnah, Family Values, Creative Arts)
                      Row(
                        children: [
                          _buildTagPill('Practicing Sunnah'),
                          const SizedBox(width: 6),
                          _buildTagPill('Family Values'),
                        ],
                      ),
                      Row(
                        children: [
                          _buildTagPill('Creative Arts'),
                        ],
                      ),

                      // Action Buttons Row: [X]  [Introduce ->]  [Heart]
                      Row(
                        children: [
                          // Pass (X)
                          Container(
                            width: 44,
                            height: 44,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFF4F4F6),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.close_rounded,
                                  size: 20, color: Color(0xFF757A88)),
                              onPressed: () {},
                            ),
                          ),

                          const SizedBox(width: 10),

                          // Introduce -> (Signature Burgundy/Raspberry Button)
                          Expanded(
                            child: SizedBox(
                              height: 44,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, AppRoutes.matchReady,
                                      arguments: profile);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: _brandBurgundy,
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: const StadiumBorder(),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Introduce',
                                      style: TextStyle(
                                        fontSize: 14.5,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Icon(Icons.arrow_forward_rounded, size: 16),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 10),

                          // Like (Heart with soft pink ring)
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                  color: const Color(0xFFE5E7EB), width: 1.4),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.favorite_rounded,
                                  size: 20, color: _brandBurgundy),
                              onPressed: () {
                                Navigator.pushNamed(context, AppRoutes.matchReady,
                                    arguments: profile);
                              },
                            ),
                          ),
                        ],
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

  Widget _buildTagPill(String tag) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F1F1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        tag,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: Color(0xFF4A4E5E),
        ),
      ),
    );
  }

  // ==========================================================
  // STAT TIER BOX
  // ==========================================================
  Widget _buildStatTierBox({
    required Color dotColor,
    required String count,
    required String title,
    required String subtitle,
    required Color borderColor,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFF0F5) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? _buttonPink : borderColor,
            width: isSelected ? 1.8 : 1.2,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: dotColor),
                ),
                const SizedBox(width: 5),
                Text(
                  count,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    color: _textDark,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 3),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: _textDark,
              ),
            ),
            const SizedBox(height: 1),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: _textGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================================
  // COMPATIBLE INTRODUCTIONS CARD (EXACT REPLICA)
  // ==========================================================
  Widget _buildCompatibleIntroCard(MatchProfile profile) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.matchDetail, arguments: profile);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: const Color(0xFFF0EBEF), width: 1.2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            children: [
              // Top Image Area
              Expanded(
                flex: 12,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Photo with fallback
                    if (profile.imagePath.isNotEmpty)
                      Image.asset(
                        profile.imagePath,
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFFD84A79), Color(0xFFBA335E)],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                profile.avatarEmoji,
                                style: const TextStyle(fontSize: 48),
                              ),
                            ),
                          );
                        },
                      )
                    else
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFFD84A79), Color(0xFFBA335E)],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            profile.avatarEmoji,
                            style: const TextStyle(fontSize: 48),
                          ),
                        ),
                      ),

                    // % Match Badge Top Right (Translucent Dark Pill with Gold Text)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: const Color(0xFF282424).withValues(alpha: 0.7),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '${profile.matchScore}%',
                          style: const TextStyle(
                            color: Color(0xFFFFD438),
                            fontSize: 10.5,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),

                    // Bottom Gradient Shadow Overlay
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      height: 60,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withValues(alpha: 0.85),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Name & Info over image (Serif Font)
                    Positioned(
                      bottom: 8,
                      left: 10,
                      right: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${profile.name}, ${profile.age}',
                            style: const TextStyle(
                              fontFamily: 'serif',
                              fontSize: 14.5,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 1),
                          Text(
                            '${profile.location} • ${profile.profession}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 10.5,
                              color: Colors.white.withValues(alpha: 0.9),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Bottom Timeline & Circular Heart Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Timeline: ${profile.intent}',
                        style: const TextStyle(
                          fontSize: 11,
                          color: _textGrey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: const Color(0xFFE5E7EB), width: 1.2),
                      ),
                      child: const Icon(
                        Icons.favorite_rounded,
                        size: 16,
                        color: _brandBurgundy,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAzuraPlaceholder() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.auto_awesome_rounded, size: 64, color: Color(0xFFFFB800)),
            SizedBox(height: 16),
            Text(
              'Azura Marriage AI',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
            SizedBox(height: 8),
            Text(
              'Your match-aware marriage guide to ask the right questions and evaluate compatibility.',
              textAlign: TextAlign.center,
              style: TextStyle(color: _textGrey, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfilePlaceholder() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person_rounded, size: 64, color: _buttonPink),
            const SizedBox(height: 16),
            const Text(
              'My Profile',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 8),
            const Text(
              'View your verified status, edit preferences, and manage Noor Shield privacy.',
              textAlign: TextAlign.center,
              style: TextStyle(color: _textGrey, fontSize: 14),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.setupProfile);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _buttonPink,
                foregroundColor: Colors.white,
                shape: const StadiumBorder(),
              ),
              child: const Text('Edit Full Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
