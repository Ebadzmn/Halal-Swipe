import 'package:flutter/material.dart';
import 'package:halal_swipe/features/chat/call_screen.dart';
import 'package:halal_swipe/features/matches/models/match_profile.dart';
import 'package:halal_swipe/routes/app_routes.dart';

class ChatMessage {
  final String text;
  final bool isMe;
  final String time;
  final bool isPrompt;

  const ChatMessage({
    required this.text,
    required this.isMe,
    required this.time,
    this.isPrompt = false,
  });
}

class ChatScreen extends StatefulWidget {
  final MatchProfile profile;

  const ChatScreen({super.key, required this.profile});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  static const Color _primaryPink = Color(0xFF941235);
  static const Color _buttonPink = Color(0xFF941235);
  static const Color _emeraldGreen = Color(0xFF007554);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textGrey = Color(0xFF6B7280);

  final List<ChatMessage> _messages = [
    const ChatMessage(
      text:
          "Assalamu Alaikum! Azura AI suggested this conversation starter:\n\n'What are the most important Islamic qualities you are looking for in a partner?'",
      isMe: false,
      time: '10:14 AM',
      isPrompt: true,
    ),
    const ChatMessage(
      text:
          "Wa Alaikum Assalam! For me, dedication to daily Salah, practicing modesty, and good character (Akhlaaq) come first. How about you?",
      isMe: true,
      time: '10:16 AM',
    ),
    const ChatMessage(
      text:
          "SubhanAllah, exactly the same! Also, honesty and having a kind, supportive heart for building a family.",
      isMe: false,
      time: '10:18 AM',
    ),
    const ChatMessage(
      text:
          "Alhamdulillah! I see you mentioned you enjoy volunteering and charity. What projects do you usually work on?",
      isMe: true,
      time: '10:22 AM',
    ),
  ];

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add(ChatMessage(
        text: text,
        isMe: true,
        time: 'Just now',
      ));
      _messageController.clear();
    });

    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent + 60,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _showWaliInviteDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFFF0F5),
                ),
                child: const Icon(
                  Icons.family_restroom_rounded,
                  size: 34,
                  color: _buttonPink,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Invite Wali to Conversation',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: _textDark,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Bring transparency and Islamic barakah to your communications. Your Wali can observe or participate in this thread.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: _textGrey,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: "Wali's Email or Phone Number",
                  hintStyle:
                      TextStyle(color: Colors.grey.shade400, fontSize: 13.5),
                  filled: true,
                  fillColor: const Color(0xFFFDF6F8),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Color(0xFFF3D2DE)),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Wali invitation link sent successfully!'),
                        backgroundColor: _emeraldGreen,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _buttonPink,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    'Send Wali Invitation',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF8F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.8,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: _primaryPink, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: Row(
          children: [
            // Avatar
            Stack(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Color(0xFFD84A79), Color(0xFFBA335E)],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      widget.profile.avatarEmoji,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                if (widget.profile.isVerified)
                  const Positioned(
                    bottom: 0,
                    right: 0,
                    child: Icon(
                      Icons.verified_rounded,
                      color: Color(0xFF00E676),
                      size: 14,
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.profile.name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      color: _textDark,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 7,
                        height: 7,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF00E676),
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Online • Matched',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF007554),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          // Audio Call Button
          IconButton(
            icon: const Icon(Icons.call_rounded, color: _primaryPink, size: 21),
            tooltip: 'Audio Call',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CallScreen(
                    partnerName: widget.profile.name,
                    partnerEmoji: widget.profile.avatarEmoji,
                    isVideoCall: false,
                    isWaliJoined: true,
                  ),
                ),
              );
            },
          ),
          // Video Call Button
          IconButton(
            icon: const Icon(Icons.videocam_rounded, color: _primaryPink, size: 23),
            tooltip: 'Video Call',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CallScreen(
                    partnerName: widget.profile.name,
                    partnerEmoji: widget.profile.avatarEmoji,
                    isVideoCall: true,
                    isWaliJoined: true,
                  ),
                ),
              );
            },
          ),
          // Menu Options (Pause / End / Report / Wali)
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert_rounded, color: _primaryPink),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            onSelected: (val) {
              if (val == 'roadmap') {
                Navigator.pushNamed(context, AppRoutes.roadmap);
              } else if (val == 'wali') {
                _showWaliInviteDialog();
              } else if (val == 'pause') {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Connection with ${widget.profile.name} paused.'),
                    backgroundColor: _primaryPink,
                  ),
                );
              } else if (val == 'end') {
                Navigator.pushNamed(context, AppRoutes.roadmap);
              } else if (val == 'report') {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Safety report submitted to moderation team.')),
                );
              }
            },
            itemBuilder: (ctx) => [
              const PopupMenuItem(
                value: 'roadmap',
                child: Row(
                  children: [
                    Icon(Icons.map_rounded, size: 18, color: _primaryPink),
                    SizedBox(width: 10),
                    Text('Open Nikah Roadmap', style: TextStyle(fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'wali',
                child: Row(
                  children: [
                    Icon(Icons.family_restroom_rounded, size: 18, color: _emeraldGreen),
                    SizedBox(width: 10),
                    Text('Invite Wali / Guardian', style: TextStyle(fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'pause',
                child: Row(
                  children: [
                    Icon(Icons.pause_circle_outline_rounded, size: 18, color: Color(0xFFC07000)),
                    SizedBox(width: 10),
                    Text('Pause Connection', style: TextStyle(fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem(
                value: 'end',
                child: Row(
                  children: [
                    Icon(Icons.close_rounded, size: 18, color: _primaryPink),
                    SizedBox(width: 10),
                    Text('End Connection Respectfully', style: TextStyle(color: _primaryPink, fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'report',
                child: Row(
                  children: [
                    Icon(Icons.shield_outlined, size: 18, color: Colors.grey),
                    SizedBox(width: 10),
                    Text('Report / Block Suitor', style: TextStyle(color: Colors.red, fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Persistent Roadmap Header Bar (Clickable)
            InkWell(
              onTap: () => Navigator.pushNamed(context, AppRoutes.roadmap),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: const BoxDecoration(
                  color: Color(0xFFFFF0F5),
                  border: Border(bottom: BorderSide(color: Color(0xFFFFD1DC), width: 1)),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: _primaryPink,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.map_rounded, color: Colors.white, size: 13),
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        'Stage 4 of 7 • Talk Seriously (5/8 topics completed)',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF8B2B4C),
                        ),
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios_rounded, size: 11, color: _primaryPink),
                  ],
                ),
              ),
            ),

            // Screenshot Protection Notice Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              color: const Color(0xFFF4FBF7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.lock_outline_rounded, size: 12, color: _emeraldGreen),
                  SizedBox(width: 6),
                  Text(
                    'Noor Shield™ Protected: Phone numbers hidden • In-app messaging only',
                    style: TextStyle(
                      fontSize: 10.5,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF007554),
                    ),
                  ),
                ],
              ),
            ),

            // Message Bubble List
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 14.0),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final msg = _messages[index];
                  return _buildMessageBubble(msg);
                },
              ),
            ),

            // Input Bar
            Container(
              padding: const EdgeInsets.fromLTRB(14, 8, 14, 12),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Azura Suggested Prompt Quick Button
                  IconButton(
                    icon: const Icon(Icons.auto_awesome_rounded,
                        color: Color(0xFFFFB800), size: 22),
                    tooltip: 'Azura Halal Prompt',
                    onPressed: () {
                      _messageController.text =
                          "What are your thoughts on balancing career and family life?";
                    },
                  ),
                  // Wali / Call Quick Action
                  IconButton(
                    icon: const Icon(Icons.shield_rounded, color: _emeraldGreen, size: 22),
                    tooltip: 'Invite Wali',
                    onPressed: _showWaliInviteDialog,
                  ),

                  // Text Field
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFFDF6F8),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                            color: const Color(0xFFF3D2DE), width: 1.2),
                      ),
                      child: TextField(
                        controller: _messageController,
                        style: const TextStyle(fontSize: 14),
                        decoration: const InputDecoration(
                          hintText: 'Type a halal message...',
                          hintStyle: TextStyle(
                              color: Color(0xFFA0AEC0), fontSize: 13.5),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          border: InputBorder.none,
                        ),
                        onSubmitted: (_) => _sendMessage(),
                      ),
                    ),
                  ),

                  const SizedBox(width: 8),

                  // Send Button
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _buttonPink,
                      boxShadow: [
                        BoxShadow(
                          color: _buttonPink.withValues(alpha: 0.35),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.send_rounded,
                          color: Colors.white, size: 20),
                      onPressed: _sendMessage,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageBubble(ChatMessage msg) {
    if (msg.isPrompt) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF0F5),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFFFD1DC)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(Icons.auto_awesome_rounded,
                    color: Color(0xFFFFB800), size: 16),
                SizedBox(width: 6),
                Text(
                  'Azura AI Icebreaker Prompt',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF8B2B4C),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              msg.text,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF2D3142),
                height: 1.35,
              ),
            ),
          ],
        ),
      );
    }

    return Align(
      alignment: msg.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.76,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: msg.isMe ? _buttonPink : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(18),
            topRight: const Radius.circular(18),
            bottomLeft: Radius.circular(msg.isMe ? 18 : 4),
            bottomRight: Radius.circular(msg.isMe ? 4 : 18),
          ),
          border: msg.isMe
              ? null
              : Border.all(color: const Color(0xFFF3E2EA), width: 1.2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment:
              msg.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              msg.text,
              style: TextStyle(
                fontSize: 14,
                color: msg.isMe ? Colors.white : _textDark,
                height: 1.35,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              msg.time,
              style: TextStyle(
                fontSize: 10,
                color: msg.isMe
                    ? Colors.white.withValues(alpha: 0.75)
                    : Colors.grey.shade400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
