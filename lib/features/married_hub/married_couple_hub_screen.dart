import 'package:flutter/material.dart';
import 'package:halal_swipe/routes/app_routes.dart';

class MarriedCoupleHubScreen extends StatefulWidget {
  final String partnerName;
  final String partnerEmoji;

  const MarriedCoupleHubScreen({
    super.key,
    this.partnerName = 'Maryam Al-Zahra',
    this.partnerEmoji = '🧕🏼',
  });

  @override
  State<MarriedCoupleHubScreen> createState() => _MarriedCoupleHubScreenState();
}

class _MarriedCoupleHubScreenState extends State<MarriedCoupleHubScreen> {
  static const Color _primaryPink = Color(0xFF941235);
  static const Color _darkBurgundy = Color(0xFF6B0623);
  static const Color _emeraldGreen = Color(0xFF007554);
  static const Color _goldYellow = Color(0xFFFFB800);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textGrey = Color(0xFF6B7280);

  int _selectedTabIndex = 0; // 0: Azura Coach, 1: Gratitude & Dua, 2: Shared Goals

  final List<Map<String, dynamic>> _coachReminders = [
    {
      'title': 'The Sunnah of Gentle Speech',
      'arabic': 'وَقُولُوا لِلنَّاسِ حُسْنًا',
      'quote':
          'The Messenger of Allah (ﷺ) said: "The best of you are those who are best to their wives, and I am the best of you to my wives." (Tirmidhi)',
      'action': 'Say one genuine compliment to your spouse before Maghrib today.',
      'category': 'Daily Sunnah Practice',
      'icon': Icons.favorite_rounded,
      'isCompleted': false,
    },
    {
      'title': 'Mercy & Overlooking Flaws',
      'arabic': 'مَوَدَّةً وَرَحْمَةً',
      'quote':
          'A believing man should not hate a believing woman; if he dislikes one of her characteristics, he is pleased with another. (Sahih Muslim)',
      'action': 'Identify one thing you appreciate about your spouse today and express thanks.',
      'category': 'Character & Patience',
      'icon': Icons.spa_rounded,
      'isCompleted': true,
    },
    {
      'title': 'Shared Tahajjud & Duas',
      'arabic': 'رَبَّنَا هَبْ لَنَا مِنْ أَزْوَاجِنَا',
      'quote':
          '"Our Lord, grant us from among our wives and offspring comfort to our eyes and make us an example for the righteous." (Al-Furqan: 74)',
      'action': 'Perform 2 Rak’ahs of Sunnah prayer together this week.',
      'category': 'Spiritual Bonding',
      'icon': Icons.nights_stay_rounded,
      'isCompleted': false,
    },
  ];

  final List<String> _quickDuaNotes = [
    'May Allah grant barakah in our home and keep our hearts united upon the Quran and Sunnah.',
    'Thank you for being my peace, my friend, and my partner in this life and the next.',
    'May Allah reward your patience and sweet efforts in our family.',
  ];

  final TextEditingController _customNoteController = TextEditingController();

  @override
  void dispose() {
    _customNoteController.dispose();
    super.dispose();
  }

  void _sendLoveNoteModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 44,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: _primaryPink.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.favorite_rounded, color: _primaryPink, size: 20),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Send Dua Note to ${widget.partnerName}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: _textDark,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              TextField(
                controller: _customNoteController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Write a sweet dua or word of appreciation...',
                  hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13),
                  filled: true,
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
                    borderSide: const BorderSide(color: _primaryPink, width: 1.5),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_customNoteController.text.trim().isNotEmpty) {
                      setState(() {
                        _quickDuaNotes.insert(0, _customNoteController.text.trim());
                        _customNoteController.clear();
                      });
                    }
                    Navigator.pop(ctx);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('✓ Sent with love & barakah to ${widget.partnerName}!'),
                        backgroundColor: _primaryPink,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _primaryPink,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Send Blessed Note 💌',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: _primaryPink, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('💍 ', style: TextStyle(fontSize: 18)),
            Text(
              'Married Couple Hub',
              style: TextStyle(
                color: _textDark,
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.verified_rounded, color: _emeraldGreen, size: 22),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.nikahCelebration),
            tooltip: 'View Nikah Certificate',
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Married Couple Banner Card
              _buildCoupleBannerCard(),

              const SizedBox(height: 16),

              // Discovery Disabled Status Pill
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFF6FCF9),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFFA8E6CF)),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.lock_rounded, color: _emeraldGreen, size: 16),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Account Mode: Happily Married • Matching & Discovery Deactivated',
                        style: TextStyle(
                          fontSize: 11.5,
                          fontWeight: FontWeight.w700,
                          color: _emeraldGreen,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Segmented Tab Selector
              _buildSegmentedTabSelector(),

              const SizedBox(height: 20),

              // Tab Content Area
              if (_selectedTabIndex == 0) _buildAzuraCoachTab(),
              if (_selectedTabIndex == 1) _buildGratitudeAndDuaTab(),
              if (_selectedTabIndex == 2) _buildSharedGoalsTab(),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCoupleBannerCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF941235),
            Color(0xFF6B0623),
            Color(0xFF4A0418),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: _primaryPink.withValues(alpha: 0.35),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Avatar Cluster
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: _goldYellow, width: 2),
                    ),
                    child: const Center(
                      child: Text('🤵🏻', style: TextStyle(fontSize: 26)),
                    ),
                  ),
                  Positioned(
                    left: 32,
                    child: Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(color: _goldYellow, width: 2),
                      ),
                      child: Center(
                        child: Text(widget.partnerEmoji, style: const TextStyle(fontSize: 26)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 48),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'You & ${widget.partnerName}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: const [
                        Icon(Icons.favorite_rounded, color: _goldYellow, size: 13),
                        SizedBox(width: 4),
                        Text(
                          'Blessed Union • Halal Swipe',
                          style: TextStyle(
                            fontSize: 11.5,
                            color: _goldYellow,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(height: 1, color: Colors.white24),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Nikah Milestone: 100% Fulfilled',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, AppRoutes.nikahCelebration),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white30),
                  ),
                  child: Row(
                    children: const [
                      Text(
                        'View Certificate',
                        style: TextStyle(
                          color: _goldYellow,
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(width: 3),
                      Icon(Icons.arrow_forward_ios_rounded, color: _goldYellow, size: 9),
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

  Widget _buildSegmentedTabSelector() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFF1EDF0),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          _buildTabButton(0, '🤖 Azura Coach'),
          _buildTabButton(1, '💌 Dua Notes'),
          _buildTabButton(2, '🎯 Goals'),
        ],
      ),
    );
  }

  Widget _buildTabButton(int index, String title) {
    final isSelected = _selectedTabIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTabIndex = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 9),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
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
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w900 : FontWeight.w600,
                color: isSelected ? _primaryPink : _textGrey,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAzuraCoachTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text('✨', style: TextStyle(fontSize: 16)),
            SizedBox(width: 8),
            Text(
              'Azura Marriage Coach Reminders',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: _textDark,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        const Text(
          'Daily Sunnah guidance for lasting tranquility (Sakinah) and affection (Mawaddah).',
          style: TextStyle(fontSize: 12.5, color: _textGrey),
        ),
        const SizedBox(height: 14),

        // Reminders List
        ...List.generate(_coachReminders.length, (idx) {
          final item = _coachReminders[idx];
          final bool isDone = item['isCompleted'] as bool;

          return Container(
            margin: const EdgeInsets.only(bottom: 14),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: isDone ? const Color(0xFFA8E6CF) : const Color(0xFFFFD1DC),
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: _primaryPink.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        item['category'] as String,
                        style: const TextStyle(
                          fontSize: 10.5,
                          fontWeight: FontWeight.w800,
                          color: _primaryPink,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _coachReminders[idx]['isCompleted'] = !isDone;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: isDone
                              ? _emeraldGreen.withValues(alpha: 0.12)
                              : Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              isDone ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded,
                              size: 14,
                              color: isDone ? _emeraldGreen : Colors.grey,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              isDone ? 'Practiced ✓' : 'Mark Done',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: isDone ? _emeraldGreen : Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  item['title'] as String,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: _textDark,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  item['quote'] as String,
                  style: TextStyle(
                    fontSize: 12.5,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey.shade700,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFBF6F8),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.task_alt_rounded, color: _primaryPink, size: 16),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          item['action'] as String,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: _textDark,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildGratitudeAndDuaTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '💌 Love & Gratitude Notes',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: _textDark,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Express sincere Islamic love & appreciation.',
                  style: TextStyle(fontSize: 12, color: _textGrey),
                ),
              ],
            ),
            ElevatedButton.icon(
              onPressed: () => _sendLoveNoteModal(),
              icon: const Icon(Icons.add_rounded, size: 16),
              label: const Text('New Note'),
              style: ElevatedButton.styleFrom(
                backgroundColor: _primaryPink,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                elevation: 0,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),

        ..._quickDuaNotes.map(
          (note) => Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFFFD1DC)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: _primaryPink.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.favorite_rounded, color: _primaryPink, size: 16),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    note,
                    style: const TextStyle(
                      fontSize: 13,
                      color: _textDark,
                      height: 1.4,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSharedGoalsTab() {
    final goals = [
      {'title': 'Complete Surah Al-Baqarah Recitation Together', 'done': true},
      {'title': 'Perform Umrah Together in Ramadan', 'done': false},
      {'title': 'Establish Daily Family Halqah / Quran Tafsir', 'done': false},
      {'title': 'Cook a Sunnah meal together on Fridays', 'done': true},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '🎯 Shared Islamic Family Goals',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w900,
            color: _textDark,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Build your home upon righteousness and mutual deen targets.',
          style: TextStyle(fontSize: 12.5, color: _textGrey),
        ),
        const SizedBox(height: 14),

        ...goals.map(
          (g) => Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: (g['done'] as bool) ? const Color(0xFFA8E6CF) : Colors.grey.shade200,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  (g['done'] as bool) ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded,
                  color: (g['done'] as bool) ? _emeraldGreen : Colors.grey,
                  size: 20,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    g['title'] as String,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: (g['done'] as bool) ? _textGrey : _textDark,
                      decoration: (g['done'] as bool) ? TextDecoration.lineThrough : null,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
