import 'package:flutter/material.dart';

class RoadmapStage {
  final int stageNumber;
  final String title;
  final String subtitle;
  final String iconEmoji;
  final String status; // 'completed', 'current', 'locked'
  final String explanation;
  final List<String> checklist;

  const RoadmapStage({
    required this.stageNumber,
    required this.title,
    required this.subtitle,
    required this.iconEmoji,
    required this.status,
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
  static const Color _primaryPink = Color(0xFFD64D7B);
  static const Color _buttonPink = Color(0xFFD44F7A);
  static const Color _emeraldGreen = Color(0xFF007554);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textGrey = Color(0xFF6B7280);

  final List<RoadmapStage> _stages = const [
    RoadmapStage(
      stageNumber: 1,
      title: 'Match',
      subtitle: 'Mutual interest expressed & verified',
      iconEmoji: '❤️',
      status: 'completed',
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
      status: 'completed',
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
      status: 'current',
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
      status: 'locked',
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
      status: 'locked',
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
      status: 'locked',
      explanation:
          'Signing the Nikah contract with witnesses, Imam solemnization, and beginning your blessed halal union.',
      checklist: [
        'Imam and legal paperwork arranged',
        'Two righteous witnesses confirmed',
        'BarakAllahu Lakuma celebration',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    const int currentStage = 3;
    const double progressPercent = 0.50; // Stage 3 out of 6 (50%)

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
                      Color(0xFFD84A79),
                      Color(0xFFBA335E),
                      Color(0xFF8F1E42),
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
                              const Text(
                                'Stage 3 of 6 • Values & Compatibility',
                                style: TextStyle(
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
                          children: const [
                            Text(
                              'Overall Roadmap Progress',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '50% Completed',
                              style: TextStyle(
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
                'Follow this Sunnah-guided structured pathway for clarity and barakah.',
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
    final bool isCompleted = stage.status == 'completed';
    final bool isCurrent = stage.status == 'current';
    final bool isLocked = stage.status == 'locked';

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
                height: isCurrent ? 160 : 70,
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
                              ? 'Completed'
                              : (isCurrent ? 'Current Stage' : 'Locked'),
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

                  // If Current Stage -> Show Expanded Guidance Checklist
                  if (isCurrent) ...[
                    const SizedBox(height: 12),
                    const Divider(height: 1, color: Color(0xFFFFD1DC)),
                    const SizedBox(height: 10),
                    ...stage.checklist.map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.radio_button_checked_rounded,
                              size: 15,
                              color: _buttonPink,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF4A4E5E),
                                ),
                              ),
                            ),
                          ],
                        ),
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
