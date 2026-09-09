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

  // Active current stage (1 to 6)
  int _currentStageNumber = 3;

  // Track user consent state for current stage: 'not_agreed', 'pending_partner', 'approved'
  bool _userAgreedCurrentStage = false;
  bool _partnerAgreedCurrentStage = false;

  // Checklist checked state map: "stageNumber_itemIndex" -> bool
  final Map<String, bool> _checklistState = {
    // Pre-check Stage 1 & 2 items
    '1_0': true, '1_1': true, '1_2': true,
    '2_0': true, '2_1': true, '2_2': true,
    // Stage 3 items
    '3_0': true, '3_1': true, '3_2': false,
  };

  final List<RoadmapStage> _stages = const [
    RoadmapStage(
      stageNumber: 1,
      title: 'Match',
      subtitle: 'Mutual interest expressed & verified',
      iconEmoji: '❤️',
      explanation:
          'Both profiles matched with high Islamic compatibility scores. Identity and basic criteria checked.',
      checklist: [
        'Mutual profile like confirmed',
        'Noor Shield photo access granted',
        'Compatibility summary reviewed',
      ],
    ),
    RoadmapStage(
      stageNumber: 2,
      title: 'Initial Conversation',
      subtitle: 'Respectful dialogue with halal prompts',
      iconEmoji: '💬',
      explanation:
          'Breaking the ice with guided questions, introducing life goals and personal values in a respectful tone.',
      checklist: [
        'Exchanged introductory messages',
        'Explored Azura suggested icebreakers',
        'Agreed on respectful communication guidelines',
      ],
    ),
    RoadmapStage(
      stageNumber: 3,
      title: 'Values & Compatibility',
      subtitle: 'Core deen, character & life vision',
      iconEmoji: '🕌',
      explanation:
          'Deep-dive into prayer habits, financial philosophy, living arrangements, and Islamic family priorities.',
      checklist: [
        'Discussed daily religious routines & Madhhab',
        'Aligned on financial expectations & Mahr concepts',
        'Reviewed long-term living & career vision',
      ],
    ),
    RoadmapStage(
      stageNumber: 4,
      title: 'Family / Wali Involvement',
      subtitle: 'Official guardian invite & family introduction',
      iconEmoji: '👨‍👩‍👧',
      explanation:
          'Bringing families into the fold for transparency, barakah, and mutual guardian approval.',
      checklist: [
        'Send Wali invite link or joint call',
        'Parents/guardians formal introduction',
        'Family blessings & initial meeting',
      ],
    ),
    RoadmapStage(
      stageNumber: 5,
      title: 'Marriage Discussion',
      subtitle: 'Mahr, Nikah contract & practical steps',
      iconEmoji: '🤝',
      explanation:
          'Clarifying the marriage contract terms, rights, responsibilities, and mutual conditions according to the Sunnah.',
      checklist: [
        'Agreement on Mahr & wedding arrangements',
        'Discussion of marital rights & expectations',
        'Final family consensus',
      ],
    ),
    RoadmapStage(
      stageNumber: 6,
      title: 'Nikah Preparation',
      subtitle: 'Official solemnization & blessed start',
      iconEmoji: '💍',
      explanation:
          'Signing the Nikah contract with witnesses, Imam solemnization, and beginning your blessed halal union.',
      checklist: [
        'Imam and legal paperwork arranged',
        'Two righteous witnesses confirmed',
        'BarakAllahu Lakuma celebration',
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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    const Text(
                      'Stage Action Checklist (Tap to mark done):',
                      style: TextStyle(
                        fontSize: 11.5,
                        fontWeight: FontWeight.w800,
                        color: _textDark,
                      ),
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
