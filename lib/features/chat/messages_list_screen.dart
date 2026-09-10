import 'package:flutter/material.dart';
import 'package:halal_swipe/features/matches/models/match_profile.dart';
import 'package:halal_swipe/routes/app_routes.dart';

class ConversationItem {
  final MatchProfile profile;
  final String lastMessage;
  final String time;
  final int unreadCount;

  const ConversationItem({
    required this.profile,
    required this.lastMessage,
    required this.time,
    required this.unreadCount,
  });
}

class MessagesListScreen extends StatelessWidget {
  const MessagesListScreen({super.key});

  static const Color _primaryPink = Color(0xFF941235);
  static const Color _buttonPink = Color(0xFF941235);
  static const Color _emeraldGreen = Color(0xFF007554);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textGrey = Color(0xFF6B7280);

  @override
  Widget build(BuildContext context) {
    final List<ConversationItem> conversations = [
      ConversationItem(
        profile: MatchProfile.sampleMatches[0], // Maryam
        lastMessage:
            "Alhamdulillah! I see you mentioned you enjoy volunteering and charity...",
        time: '10:22 AM',
        unreadCount: 2,
      ),
      ConversationItem(
        profile: MatchProfile.sampleMatches[1], // Fatima
        lastMessage:
            "Assalamu Alaikum brother Ahmad, Azura suggested we discuss family values.",
        time: 'Yesterday',
        unreadCount: 0,
      ),
      ConversationItem(
        profile: MatchProfile.sampleMatches[2], // Aisha
        lastMessage: "I would be happy to involve my Wali for the next step.",
        time: '2 days ago',
        unreadCount: 1,
      ),
      ConversationItem(
        profile: MatchProfile.sampleMatches[3], // Zainab
        lastMessage: "Thank you for sharing your thoughts on Islamic art!",
        time: 'May 12',
        unreadCount: 0,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const Text(
          'Messages',
          style: TextStyle(
            color: _textDark,
            fontSize: 22,
            fontWeight: FontWeight.w900,
            letterSpacing: -0.5,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shield_moon_rounded,
                color: _emeraldGreen, size: 22),
            onPressed: () {},
            tooltip: 'Noor Shield Halal Oversight',
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Top Matched Contacts Horizontal Row (Recent Matches)
            Container(
              height: 104,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: MatchProfile.sampleMatches.length,
                itemBuilder: (context, index) {
                  final p = MatchProfile.sampleMatches[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 14.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.chat,
                            arguments: p);
                      },
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 56,
                                height: 56,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFFD84A79),
                                      Color(0xFFBA335E)
                                    ],
                                  ),
                                  border: Border.all(
                                    color: const Color(0xFFFFD1DC),
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    p.avatarEmoji,
                                    style: const TextStyle(fontSize: 26),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 14,
                                  height: 14,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF00E676),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            p.name.split(' ')[0],
                            style: const TextStyle(
                              fontSize: 11.5,
                              fontWeight: FontWeight.w700,
                              color: _textDark,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const Divider(height: 1, color: Color(0xFFF3E2EA)),

            // Active Conversations List
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: conversations.length,
                separatorBuilder: (context, index) =>
                    const Divider(height: 1, indent: 76, color: Color(0xFFF9EEF2)),
                itemBuilder: (context, index) {
                  final item = conversations[index];
                  return ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.chat,
                          arguments: item.profile);
                    },
                    leading: Stack(
                      children: [
                        Container(
                          width: 52,
                          height: 52,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [Color(0xFFD84A79), Color(0xFFBA335E)],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              item.profile.avatarEmoji,
                              style: const TextStyle(fontSize: 26),
                            ),
                          ),
                        ),
                        if (item.profile.isVerified)
                          const Positioned(
                            bottom: 0,
                            right: 0,
                            child: Icon(
                              Icons.verified_rounded,
                              color: Color(0xFF00E676),
                              size: 16,
                            ),
                          ),
                      ],
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              item.profile.name,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                color: _textDark,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFF0F5),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: const Color(0xFFFFD1DC)),
                              ),
                              child: Text(
                                index == 0
                                    ? 'Stage 4 • Talk Seriously'
                                    : (index == 1
                                        ? 'Stage 3 • Confirm Intent'
                                        : (index == 2
                                            ? 'Stage 6 • Involve Family'
                                            : 'Stage 2 • Understand')),
                                style: const TextStyle(
                                  fontSize: 9.5,
                                  fontWeight: FontWeight.w800,
                                  color: _primaryPink,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          item.time,
                          style: TextStyle(
                            fontSize: 11.5,
                            color: item.unreadCount > 0
                                ? _buttonPink
                                : Colors.grey.shade400,
                            fontWeight: item.unreadCount > 0
                                ? FontWeight.w800
                                : FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        item.lastMessage,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13,
                          color: item.unreadCount > 0
                              ? _textDark
                              : _textGrey,
                          fontWeight: item.unreadCount > 0
                              ? FontWeight.w700
                              : FontWeight.w400,
                        ),
                      ),
                    ),
                    trailing: item.unreadCount > 0
                        ? Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: _buttonPink,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              '${item.unreadCount}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          )
                        : null,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
