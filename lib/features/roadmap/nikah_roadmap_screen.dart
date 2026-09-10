import 'package:flutter/material.dart';
import 'package:halal_swipe/routes/app_routes.dart';

class RoadmapStage {
  final int stageNumber;
  final String title;
  final String subtitle;
  final String iconEmoji;
  final String explanation;
  final List<String> checklist;

  const RoadmapStage({
    required this.stageNumber,
    required this.title,
    required this.subtitle,
    required this.iconEmoji,
    required this.explanation,
    required this.checklist,
  });
}

class NikahRoadmapScreen extends StatefulWidget {
  final String partnerName;
  final String partnerEmoji;

  const NikahRoadmapScreen({
    super.key,
    this.partnerName = 'Maryam Al-Zahra',
    this.partnerEmoji = '🧕🏼',
  });

  @override
  State<NikahRoadmapScreen> createState() => _NikahRoadmapScreenState();
}

class _NikahRoadmapScreenState extends State<NikahRoadmapScreen> {
  static const Color _primaryPink = Color(0xFF941235);
  static const Color _buttonPink = Color(0xFF941235);
  static const Color _emeraldGreen = Color(0xFF007554);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textGrey = Color(0xFF6B7280);

  // Active current stage (1 to 7)
  int _currentStageNumber = 4;

  // Track user consent state for current stage
  bool _userAgreedCurrentStage = false;
  bool _partnerAgreedCurrentStage = false;

  // Connection paused state
  bool _isConnectionPaused = false;

  // Checklist checked state map: "stageNumber_itemIndex" -> bool
  final Map<String, bool> _checklistState = {
    // Pre-check Stage 1, 2, 3 items
    '1_0': true, '1_1': true, '1_2': true,
    '2_0': true, '2_1': true, '2_2': true,
    '3_0': true, '3_1': true, '3_2': true,
    // Stage 4 items (5 of 8 completed)
    '4_0': true, '4_1': true, '4_2': true, '4_3': true, '4_4': true,
    '4_5': false, '4_6': false, '4_7': false,
  };

  // The Official 7-Stage Nikah Roadmap
  final List<RoadmapStage> _stages = const [
    RoadmapStage(
      stageNumber: 1,
      title: 'Match',
      subtitle: 'Mutual alignment & initial compatibility breakdown',
      iconEmoji: '❤️',
      explanation:
          'Mutual match discovered. Review 5-category Islamic compatibility: Deen, Family & Children, Lifestyle, Marriage Expectations & Communication.',
      checklist: [
        'Mutual profile like confirmed',
        'Review 5-category compatibility alignment',
        'Explore 2-3 smart conversation starters',
      ],
    ),
    RoadmapStage(
      stageNumber: 2,
      title: 'Understand',
      subtitle: 'Identify alignment strengths & discussion topics',
      iconEmoji: '💬',
      explanation:
          'Turn compatibility into respectful dialogue without premature labels. Focus on core shared values and open questions.',
      checklist: [
        'Acknowledge strongest areas of alignment',
        'Discuss topics needing deeper clarification',
        'Agree on respectful, purposeful conversation',
      ],
    ),
    RoadmapStage(
      stageNumber: 3,
      title: 'Confirm Intent',
      subtitle: 'Align on marriage readiness & timelines',
      iconEmoji: '🎯',
      explanation:
          'Verify that both individuals share genuine marriage intent and compatible Ready for Nikah timelines.',
      checklist: [
        'Review Ready for Nikah timelines (e.g. Within 6 Mos)',
        'Check Marriage Intent Verified status',
        'Complete Quick Alignment Check',
      ],
    ),
    RoadmapStage(
      stageNumber: 4,
      title: 'Talk Seriously',
      subtitle: '8 structured premarital conversations with Azura',
      iconEmoji: '🕌',
      explanation:
          'Azura guides couples through 8 vital premarital areas. Revisit topics anytime and complete a compatibility re-check.',
      checklist: [
        '1. Deen (Practicing habits & values)',
        '2. Children (Family vision & timeline)',
        '3. Finances (Mahr & financial roles)',
        '4. Family (Dynamics & extended relations)',
        '5. Living Arrangements (Location & home setup)',
        '6. Career (Ambitions & work-life balance)',
        '7. Conflict (Resolution & communication style)',
        '8. Expectations (Mutual marital rights & duties)',
      ],
    ),
    RoadmapStage(
      stageNumber: 5,
      title: 'Marriage Checkpoint',
      subtitle: 'Structured review & private family-readiness poll',
      iconEmoji: '⚖️',
      explanation:
          'Review progress, alignment changes, and compatibility re-check. Privately state readiness for formal family involvement.',
      checklist: [
        'Review Strong Alignment vs. Discussion areas',
        'Inspect "What Changed" since Stage 1',
        'Run compatibility re-check report',
        'Privately confirm readiness for family involvement',
      ],
    ),
    RoadmapStage(
      stageNumber: 6,
      title: 'Involve Family',
      subtitle: 'Barakah Room, Wali invitation & group meetings',
      iconEmoji: '👨‍👩‍👧',
      explanation:
          'Recommended formal step to bring families together with Azura Family Guide, group video meetings, and next-step checklist.',
      checklist: [
        'Invite Wali & family members to Barakah Room',
        'Schedule group meeting & review Azura Family Guide',
        'Conduct respectful in-app family video meeting',
        'Complete post-meeting next-step checklist',
      ],
    ),
    RoadmapStage(
      stageNumber: 7,
      title: 'Move Toward Nikah',
      subtitle: 'Complete journey & practical real-world steps',
      iconEmoji: '💍',
      explanation:
          'Digital guidance completed. Transition into off-app legal & religious solemnization with blessings and peace of mind.',
      checklist: [
        'Finalize legal & religious solemnization arrangements',
        'Designate official Imam & two righteous witnesses',
        'Record private next-step status / Found My Person',
      ],
    ),
  ];

  bool _isItemChecked(int stageNum, int itemIdx) {
    return _checklistState['${stageNum}_$itemIdx'] ?? false;
  }

  void _toggleChecklistItem(int stageNum, int itemIdx) {
    if (stageNum != _currentStageNumber) return;
    setState(() {
      final key = '${stageNum}_$itemIdx';
      _checklistState[key] = !(_checklistState[key] ?? false);
    });
  }

  void _showPauseOrEndModal() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'Connection Options',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: _textDark),
                ),
                const SizedBox(height: 4),
                const Text(
                  'You have full control over your Nikah Roadmap journey at any stage.',
                  style: TextStyle(fontSize: 13, color: _textGrey),
                ),
                const SizedBox(height: 18),

                // Option 1: Pause Connection
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF7E6),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.pause_circle_outline_rounded, color: Color(0xFFC07000)),
                  ),
                  title: Text(
                    _isConnectionPaused ? 'Resume Connection' : 'Pause Connection',
                    style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
                  ),
                  subtitle: const Text(
                    'Temporarily pause roadmap progression without deleting account or penalty.',
                    style: TextStyle(fontSize: 12, color: _textGrey),
                  ),
                  onTap: () {
                    Navigator.pop(ctx);
                    setState(() {
                      _isConnectionPaused = !_isConnectionPaused;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(_isConnectionPaused
                            ? 'Connection with ${widget.partnerName} is now paused.'
                            : 'Connection resumed.'),
                        backgroundColor: _primaryPink,
                      ),
                    );
                  },
                ),
                const Divider(height: 16),

                // Option 2: Respectful End Connection
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF0F3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.close_rounded, color: _primaryPink),
                  ),
                  title: const Text(
                    'End Connection Respectfully',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15, color: _primaryPink),
                  ),
                  subtitle: const Text(
                    'Close this serious connection gracefully. Reasons stay completely private.',
                    style: TextStyle(fontSize: 12, color: _textGrey),
                  ),
                  onTap: () {
                    Navigator.pop(ctx);
                    _showEndReasonDialog();
                  },
                ),
                const Divider(height: 16),

                // Option 3: Report or Block
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.shield_outlined, color: Colors.grey.shade700),
                  ),
                  title: const Text(
                    'Report or Block for Safety',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
                  ),
                  subtitle: const Text(
                    'Immediate safety moderation. Discrete and secure.',
                    style: TextStyle(fontSize: 12, color: _textGrey),
                  ),
                  onTap: () {
                    Navigator.pop(ctx);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Safety team notified. Report recorded.')),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showEndReasonDialog() {
    final reasons = [
      'Not compatible on core values',
      'Marriage timing isn’t aligned',
      'Different family/living vision',
      'Communication style concerns',
      'Prefer not to say',
      'Other',
    ];
    String selected = reasons[0];

    showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
              title: const Text(
                'End Connection Respectfully',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Select a private reason. Your partner will only receive a polite Sunnah-inspired closing message.',
                    style: TextStyle(fontSize: 12.5, color: _textGrey, height: 1.35),
                  ),
                  const SizedBox(height: 14),
                  ...reasons.map((r) => RadioListTile<String>(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text(r, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                        value: r,
                        groupValue: selected,
                        activeColor: _primaryPink,
                        onChanged: (val) {
                          if (val != null) {
                            setDialogState(() => selected = val);
                          }
                        },
                      )),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('Cancel', style: TextStyle(color: _textGrey)),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                    _showAmanahQualityCheckModal();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _primaryPink,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Confirm & End'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showAmanahQualityCheckModal() {
    int respectfulRating = 1;
    int seriousRating = 1;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.verified_user_rounded, color: _emeraldGreen, size: 22),
                        SizedBox(width: 8),
                        Text(
                          'Private Amanah Quality Check',
                          style: TextStyle(fontSize: 16.5, fontWeight: FontWeight.w900, color: _textDark),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Your private input builds a trustworthy community. Answers are never shown publicly.',
                      style: TextStyle(fontSize: 12.5, color: _textGrey, height: 1.35),
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      '1. Was this person respectful throughout communication?',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        ChoiceChip(
                          label: const Text('Yes, respectful'),
                          selected: respectfulRating == 1,
                          selectedColor: const Color(0xFFE8F5E9),
                          onSelected: (_) => setModalState(() => respectfulRating = 1),
                        ),
                        const SizedBox(width: 8),
                        ChoiceChip(
                          label: const Text('Had concerns'),
                          selected: respectfulRating == 0,
                          selectedColor: const Color(0xFFFFEBEE),
                          onSelected: (_) => setModalState(() => respectfulRating = 0),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      '2. Did this person appear genuinely serious about marriage?',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        ChoiceChip(
                          label: const Text('Yes, serious intent'),
                          selected: seriousRating == 1,
                          selectedColor: const Color(0xFFE8F5E9),
                          onSelected: (_) => setModalState(() => seriousRating = 1),
                        ),
                        const SizedBox(width: 8),
                        ChoiceChip(
                          label: const Text('Unsure / Casual'),
                          selected: seriousRating == 0,
                          selectedColor: const Color(0xFFFFEBEE),
                          onSelected: (_) => setModalState(() => seriousRating = 0),
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(ctx);
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _primaryPink,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        ),
                        child: const Text('Submit & Finish', style: TextStyle(fontWeight: FontWeight.w800)),
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

  void _showQuickAlignmentCheckDialog() {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
          title: Row(
            children: const [
              Text('✨ ', style: TextStyle(fontSize: 16)),
              Expanded(
                child: Text(
                  'Quick Alignment Check',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16.5),
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                '“Do you still feel this connection is worth exploring seriously?”',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: _textDark, height: 1.35),
              ),
              SizedBox(height: 10),
              Text(
                'Keep peace of mind before completing weeks of guided premarital conversations. Responses remain completely private.',
                style: TextStyle(fontSize: 12, color: _textGrey, height: 1.35),
              ),
            ],
          ),
          actions: [
            OutlinedButton(
              onPressed: () {
                Navigator.pop(ctx);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('No problem! Take all the time you need.')),
                );
              },
              child: const Text('I need more time', style: TextStyle(color: _textDark)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(ctx);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('✓ Alignment confirmed! Continuing serious talks.'),
                    backgroundColor: _emeraldGreen,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _emeraldGreen,
                foregroundColor: Colors.white,
              ),
              child: const Text('Yes, Continue'),
            ),
          ],
        );
      },
    );
  }

  bool _areAllCurrentChecklistItemsCompleted() {
    final currentStage = _stages.firstWhere((s) => s.stageNumber == _currentStageNumber);
    for (int i = 0; i < currentStage.checklist.length; i++) {
      if (!_isItemChecked(_currentStageNumber, i)) {
        return false;
      }
    }
    return true;
  }

  void _showConsentModal() {
    final currentStage = _stages.firstWhere((s) => s.stageNumber == _currentStageNumber);
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (modalCtx) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              ),
              child: SafeArea(
                top: false,
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
                    const SizedBox(height: 20),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _primaryPink.withValues(alpha: 0.1),
                      ),
                      child: Center(
                        child: Text(
                          currentStage.iconEmoji,
                          style: const TextStyle(fontSize: 28),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'Mutual Consent: Stage $_currentStageNumber',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: _textDark,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      currentStage.title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: _primaryPink,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'By granting mutual consent, both you and ${widget.partnerName} agree that all criteria and discussions for this stage have been satisfactorily met with Islamic decorum.',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 13,
                        color: _textGrey,
                        height: 1.45,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Both partners consent status indicator
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFBF6F8),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFFFD1DC)),
                      ),
                      child: Row(
                        children: [
                          // You
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  _userAgreedCurrentStage
                                      ? Icons.check_circle_rounded
                                      : Icons.radio_button_unchecked_rounded,
                                  color: _userAgreedCurrentStage ? _emeraldGreen : _primaryPink,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Your Consent',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w800,
                                          color: _textDark,
                                        ),
                                      ),
                                      Text(
                                        _userAgreedCurrentStage ? 'Agreed' : 'Pending',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                          color: _userAgreedCurrentStage ? _emeraldGreen : _textGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(width: 1, height: 32, color: const Color(0xFFFFD1DC)),
                          const SizedBox(width: 12),
                          // Partner
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  _partnerAgreedCurrentStage
                                      ? Icons.check_circle_rounded
                                      : Icons.pending_rounded,
                                  color: _partnerAgreedCurrentStage ? _emeraldGreen : const Color(0xFFFFB800),
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.partnerName.split(' ').first,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w800,
                                          color: _textDark,
                                        ),
                                      ),
                                      Text(
                                        _partnerAgreedCurrentStage ? 'Agreed' : 'Pending response',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                          color: _partnerAgreedCurrentStage ? _emeraldGreen : const Color(0xFFC07000),
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

                    const SizedBox(height: 24),

                    // Action buttons
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.pop(modalCtx),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              side: BorderSide(color: Colors.grey.shade300),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                color: _textDark,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 2,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(modalCtx);
                              _handleGiveConsent();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _primaryPink,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: Text(
                              _userAgreedCurrentStage
                                  ? 'Simulate Partner Agree'
                                  : 'Give My Halal Consent',
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 13.5,
                              ),
                            ),
                          ),
                        ),
                      ],
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

  void _handleGiveConsent() {
    if (!_userAgreedCurrentStage) {
      setState(() {
        _userAgreedCurrentStage = true;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '✓ You gave consent for Stage $_currentStageNumber. Consent request sent to ${widget.partnerName}!',
          ),
          backgroundColor: _primaryPink,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
    } else {
      // Both agreed -> unlock next stage
      setState(() {
        _partnerAgreedCurrentStage = true;
      });

      Future.delayed(const Duration(milliseconds: 300), () {
        _unlockNextStage();
      });
    }
  }

  void _unlockNextStage() {
    if (_currentStageNumber < _stages.length) {
      final nextStageNum = _currentStageNumber + 1;
      
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _emeraldGreen.withValues(alpha: 0.12),
                  ),
                  child: const Icon(
                    Icons.celebration_rounded,
                    color: _emeraldGreen,
                    size: 34,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Alhamdulillah! 🎉',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: _textDark,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Stage $_currentStageNumber Completed!',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: _emeraldGreen,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Both you and ${widget.partnerName} have mutually agreed. Unlocking Stage $nextStageNum: ${_stages[nextStageNum - 1].title}.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 13, color: _textGrey, height: 1.4),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                      setState(() {
                        _currentStageNumber = nextStageNum;
                        _userAgreedCurrentStage = false;
                        _partnerAgreedCurrentStage = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _primaryPink,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text('Proceed to Stage $nextStageNum'),
                  ),
                ),
              ],
            ),
          );
        },
      );
    } else {
      // 100% Complete (Stage 6) -> Direct to Premium Nikah Celebration Screen
      Navigator.pushReplacementNamed(
        context,
        AppRoutes.nikahCelebration,
      );
    }
  }

  void _simulateJumpToStage(int targetStage) {
    setState(() {
      _currentStageNumber = targetStage;
      _userAgreedCurrentStage = false;
      _partnerAgreedCurrentStage = false;

      // Mark previous stages checklist items completed
      for (int s = 1; s < targetStage; s++) {
        final stageObj = _stages.firstWhere((st) => st.stageNumber == s);
        for (int i = 0; i < stageObj.checklist.length; i++) {
          _checklistState['${s}_$i'] = true;
        }
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('⚡ Stage Simulator: Switched to Stage $targetStage: ${_stages[targetStage - 1].title}'),
        backgroundColor: _emeraldGreen,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showStageSimulatorModal() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: const [
                    Icon(Icons.bolt_rounded, color: Color(0xFFFFB800), size: 22),
                    SizedBox(width: 8),
                    Text(
                      'Demo Stage Simulator',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: _textDark),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  'Jump directly to any stage or complete all 7 stages to test the celebration flow.',
                  style: TextStyle(fontSize: 12.5, color: _textGrey),
                ),
                const SizedBox(height: 16),
                ...List.generate(_stages.length, (idx) {
                  final s = _stages[idx];
                  final isCurrent = s.stageNumber == _currentStageNumber;
                  return ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isCurrent ? _primaryPink : const Color(0xFFF3F4F6),
                      ),
                      child: Center(
                        child: Text(
                          s.iconEmoji,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    title: Text(
                      'Stage ${s.stageNumber}: ${s.title}',
                      style: TextStyle(
                        fontSize: 13.5,
                        fontWeight: isCurrent ? FontWeight.w900 : FontWeight.w700,
                        color: isCurrent ? _primaryPink : _textDark,
                      ),
                    ),
                    trailing: isCurrent
                        ? const Text('ACTIVE', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: _primaryPink))
                        : const Icon(Icons.arrow_forward_ios_rounded, size: 12, color: Colors.grey),
                    onTap: () {
                      Navigator.pop(ctx);
                      _simulateJumpToStage(s.stageNumber);
                    },
                  );
                }),
                const SizedBox(height: 10),
                // Instant Complete 100% Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(ctx);
                      Navigator.pushNamed(context, AppRoutes.nikahCelebration);
                    },
                    icon: const Icon(Icons.celebration_rounded, size: 18),
                    label: const Text('Simulate Full Completion (Stage 7 Final)', style: TextStyle(fontWeight: FontWeight.w800)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _emeraldGreen,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double progressPercent = _currentStageNumber / _stages.length;
    final currentStageObj = _stages.firstWhere((s) => s.stageNumber == _currentStageNumber);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: _primaryPink, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Nikah Roadmap',
          style: TextStyle(
            color: _textDark,
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
        actions: [
          // Demo Simulator Button
          IconButton(
            icon: const Icon(Icons.bolt_rounded, color: Color(0xFFFFB800), size: 24),
            tooltip: 'Simulate Stages (Demo)',
            onPressed: _showStageSimulatorModal,
          ),
          IconButton(
            icon: const Icon(Icons.tune_rounded, color: _primaryPink, size: 22),
            tooltip: 'Connection Options',
            onPressed: _showPauseOrEndModal,
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Paused Alert Banner (if paused)
              if (_isConnectionPaused)
                Container(
                  margin: const EdgeInsets.only(bottom: 14),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF7E6),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: const Color(0xFFFFECC2)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.pause_circle_filled_rounded, color: Color(0xFFC07000), size: 20),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          'Roadmap Progression is Paused. Take all the time you need.',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF8A5800),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () => setState(() => _isConnectionPaused = false),
                        child: const Text('Resume', style: TextStyle(fontWeight: FontWeight.w900, color: _primaryPink)),
                      ),
                    ],
                  ),
                ),

              // Quick Alignment Check Banner (Around Stage 3 -> 4)
              if (_currentStageNumber == 3 || _currentStageNumber == 4)
                Container(
                  margin: const EdgeInsets.only(bottom: 14),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3FAF7),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: const Color(0xFFBCE7D9)),
                  ),
                  child: Row(
                    children: [
                      const Text('✨ ', style: TextStyle(fontSize: 16)),
                      const Expanded(
                        child: Text(
                          'Are we still aligned? Check in privately before deep topics.',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF00593B),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _showQuickAlignmentCheckDialog,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _emeraldGreen,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          elevation: 0,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text('Check In', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800)),
                      ),
                    ],
                  ),
                ),

              // Top Partner Card with Progress
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF941235),
                      Color(0xFF700B26),
                      Color(0xFF52071B),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: _buttonPink.withValues(alpha: 0.35),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        // Partner Avatar
                        Container(
                          width: 54,
                          height: 54,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: Center(
                            child: Text(
                              widget.partnerEmoji,
                              style: const TextStyle(fontSize: 28),
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Roadmap with ${widget.partnerName}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Stage $_currentStageNumber of ${_stages.length} • ${currentStageObj.title}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFFFFD438),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Progress Bar
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Overall Roadmap Progress',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '${(progressPercent * 100).toInt()}% Completed',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w900,
                                color: Color(0xFFFFD438),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: LinearProgressIndicator(
                            value: progressPercent,
                            backgroundColor: Colors.white.withValues(alpha: 0.25),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Color(0xFFFFD438),
                            ),
                            minHeight: 8,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Title Section
              const Text(
                'Sacred Steps to Marriage',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: _textDark,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Tap items to complete checklists and give mutual consent to unlock next steps.',
                style: TextStyle(fontSize: 13, color: _textGrey),
              ),

              const SizedBox(height: 20),

              // Visual Timeline of 6 Stages
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _stages.length,
                itemBuilder: (context, index) {
                  final stage = _stages[index];
                  final isLast = index == _stages.length - 1;
                  return _buildTimelineItem(stage, isLast);
                },
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimelineItem(RoadmapStage stage, bool isLast) {
    final bool isCompleted = stage.stageNumber < _currentStageNumber;
    final bool isCurrent = stage.stageNumber == _currentStageNumber;
    final bool isLocked = stage.stageNumber > _currentStageNumber;

    Color nodeBg;
    Color nodeBorder;
    Widget nodeIcon;

    if (isCompleted) {
      nodeBg = _emeraldGreen;
      nodeBorder = _emeraldGreen;
      nodeIcon = const Icon(Icons.check_rounded, color: Colors.white, size: 18);
    } else if (isCurrent) {
      nodeBg = _buttonPink;
      nodeBorder = _buttonPink;
      nodeIcon = Text(stage.iconEmoji, style: const TextStyle(fontSize: 16));
    } else {
      nodeBg = const Color(0xFFF3F4F6);
      nodeBorder = const Color(0xFFE5E7EB);
      nodeIcon = const Icon(Icons.lock_rounded, color: Colors.grey, size: 16);
    }

    final allItemsChecked = isCurrent && _areAllCurrentChecklistItemsCompleted();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Timeline Node & Vertical Connector
        Column(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: nodeBg,
                border: Border.all(
                  color: nodeBorder,
                  width: isCurrent ? 3 : 1,
                ),
                boxShadow: isCurrent
                    ? [
                        BoxShadow(
                          color: _buttonPink.withValues(alpha: 0.35),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : null,
              ),
              child: Center(child: nodeIcon),
            ),
            if (!isLast)
              Container(
                width: 2.5,
                height: isCurrent ? 240 : 75,
                color: isCompleted
                    ? _emeraldGreen
                    : const Color(0xFFE5E7EB),
              ),
          ],
        ),

        const SizedBox(width: 14),

        // Right Stage Card Details
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isCurrent
                    ? const Color(0xFFFFF0F5)
                    : (isCompleted
                        ? const Color(0xFFF6FCF9)
                        : const Color(0xFFFAFAFA)),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: isCurrent
                      ? const Color(0xFFFFD1DC)
                      : (isCompleted
                          ? const Color(0xFFA8E6CF)
                          : const Color(0xFFE5E7EB)),
                  width: isCurrent ? 1.6 : 1.2,
                ),
                boxShadow: isCurrent
                    ? [
                        BoxShadow(
                          color: _buttonPink.withValues(alpha: 0.08),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : null,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'STAGE ${stage.stageNumber}',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w900,
                          color: isCurrent
                              ? _buttonPink
                              : (isCompleted
                                  ? _emeraldGreen
                                  : Colors.grey.shade500),
                          letterSpacing: 0.8,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: isCompleted
                              ? _emeraldGreen.withValues(alpha: 0.1)
                              : (isCurrent
                                  ? _buttonPink.withValues(alpha: 0.1)
                                  : Colors.grey.shade200),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          isCompleted
                              ? 'Completed ✓'
                              : (isCurrent ? 'In Progress' : 'Locked 🔒'),
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            color: isCompleted
                                ? _emeraldGreen
                                : (isCurrent ? _buttonPink : Colors.grey.shade600),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    stage.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: isLocked ? Colors.grey.shade600 : _textDark,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    stage.subtitle,
                    style: TextStyle(
                      fontSize: 12.5,
                      color: isLocked ? Colors.grey.shade500 : _textGrey,
                    ),
                  ),

                  // If Current Stage -> Show Expanded Interactive Checklist & Consent Button
                  if (isCurrent) ...[
                    const SizedBox(height: 12),
                    const Divider(height: 1, color: Color(0xFFFFD1DC)),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Stage Action Checklist:',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 11.5,
                              fontWeight: FontWeight.w800,
                              color: _textDark,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        InkWell(
                          onTap: () {
                            setState(() {
                              for (int i = 0; i < stage.checklist.length; i++) {
                                _checklistState['${stage.stageNumber}_$i'] = true;
                              }
                            });
                          },
                          borderRadius: BorderRadius.circular(6),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF0FDF4),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: const Color(0xFFBCE7D9)),
                            ),
                            child: const Text(
                              '⚡ Check All',
                              style: TextStyle(
                                fontSize: 9.5,
                                fontWeight: FontWeight.w800,
                                color: _emeraldGreen,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ...List.generate(stage.checklist.length, (itemIdx) {
                      final item = stage.checklist[itemIdx];
                      final isChecked = _isItemChecked(stage.stageNumber, itemIdx);

                      return InkWell(
                        onTap: () => _toggleChecklistItem(stage.stageNumber, itemIdx),
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                isChecked
                                    ? Icons.check_box_rounded
                                    : Icons.check_box_outline_blank_rounded,
                                size: 18,
                                color: isChecked ? _emeraldGreen : _buttonPink,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: 12.5,
                                    fontWeight: isChecked ? FontWeight.w700 : FontWeight.w500,
                                    decoration: isChecked ? TextDecoration.lineThrough : null,
                                    color: isChecked ? _textGrey : const Color(0xFF2C303E),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),

                    const SizedBox(height: 14),

                    // Consent & Proceed Action Container
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: allItemsChecked
                              ? const Color(0xFFFFD1DC)
                              : Colors.grey.shade200,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.handshake_rounded,
                                size: 16,
                                color: allItemsChecked ? _primaryPink : Colors.grey,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                'Mutual Consent Status',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                  color: allItemsChecked ? _textDark : Colors.grey,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                _userAgreedCurrentStage ? 'Agreed (1/2)' : '0/2 Agreed',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  color: _userAgreedCurrentStage ? _emeraldGreen : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: allItemsChecked
                                  ? () => _showConsentModal()
                                  : null,
                              icon: Icon(
                                _userAgreedCurrentStage
                                    ? Icons.hourglass_top_rounded
                                    : Icons.verified_user_rounded,
                                size: 16,
                              ),
                              label: Text(
                                _userAgreedCurrentStage
                                    ? 'Awaiting Partner Consent'
                                    : (allItemsChecked
                                        ? 'Give Consent & Complete Stage'
                                        : 'Complete Checklist First'),
                                style: const TextStyle(
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _primaryPink,
                                foregroundColor: Colors.white,
                                disabledBackgroundColor: Colors.grey.shade300,
                                disabledForegroundColor: Colors.grey.shade600,
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
