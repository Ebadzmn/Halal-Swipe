import 'dart:async';
import 'package:flutter/material.dart';

class CallScreen extends StatefulWidget {
  final String partnerName;
  final String partnerEmoji;
  final String avatarUrl;
  final bool isVideoCall;
  final bool isWaliJoined;

  const CallScreen({
    super.key,
    required this.partnerName,
    required this.partnerEmoji,
    this.avatarUrl = '',
    required this.isVideoCall,
    this.isWaliJoined = true,
  });

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> with TickerProviderStateMixin {
  static const Color _primaryPink = Color(0xFF941235);
  static const Color _darkBurgundy = Color(0xFF5A051D);
  static const Color _emeraldGreen = Color(0xFF007554);
  static const Color _goldYellow = Color(0xFFFFB800);

  bool _isMuted = false;
  bool _isVideoOff = false;
  bool _isSpeakerOn = true;
  bool _isWaliInCall = true;

  int _callSeconds = 0;
  Timer? _callTimer;

  late final AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _isWaliInCall = widget.isWaliJoined;
    _isVideoOff = !widget.isVideoCall;

    _callTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _callSeconds++;
        });
      }
    });

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _callTimer?.cancel();
    _pulseController.dispose();
    super.dispose();
  }

  String _formatDuration(int seconds) {
    final m = (seconds ~/ 60).toString().padLeft(2, '0');
    final s = (seconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  void _showHalalGuidelines() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: const [
            Icon(Icons.shield_rounded, color: _emeraldGreen, size: 22),
            SizedBox(width: 8),
            Text(
              'Halal Call Protocol',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
            ),
          ],
        ),
        content: const Text(
          '• Wali presence or notification is active for modesty.\n• Modest dress code (Hijab/Decency) is observed.\n• Respectful, marriage-focused conversation is maintained.',
          style: TextStyle(fontSize: 13, height: 1.5, color: Color(0xFF2B2E3A)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('I Understand', style: TextStyle(fontWeight: FontWeight.w800, color: _primaryPink)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.isVideoCall ? const Color(0xFF1E1F29) : _darkBurgundy,
      body: Stack(
        children: [
          // If Video Call -> Background Video View Simulation
          if (widget.isVideoCall && !_isVideoOff)
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF2C1924),
                      Color(0xFF191118),
                      Color(0xFF0F0B0E),
                    ],
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withValues(alpha: 0.1),
                          border: Border.all(color: _primaryPink.withValues(alpha: 0.5), width: 3),
                        ),
                        child: Center(
                          child: Text(widget.partnerEmoji, style: const TextStyle(fontSize: 70)),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        widget.partnerName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'HD Halal Video Active',
                        style: TextStyle(fontSize: 12, color: _emeraldGreen, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
            )
          else
            // Audio Call / Video Disabled Background
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment(0.0, -0.3),
                    radius: 1.2,
                    colors: [
                      Color(0xFF941235),
                      Color(0xFF5A051D),
                      Color(0xFF2E020E),
                    ],
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedBuilder(
                        animation: _pulseController,
                        builder: (context, child) {
                          final p = _pulseController.value;
                          return Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withValues(alpha: 0.1),
                              boxShadow: [
                                BoxShadow(
                                  color: _primaryPink.withValues(alpha: 0.25 + 0.15 * p),
                                  blurRadius: 40 + 20 * p,
                                  spreadRadius: 8 + 6 * p,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Container(
                                width: 110,
                                height: 110,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  border: Border.all(color: _goldYellow, width: 2.5),
                                ),
                                child: Center(
                                  child: Text(widget.partnerEmoji, style: const TextStyle(fontSize: 54)),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      Text(
                        widget.partnerName,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        _formatDuration(_callSeconds),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: _goldYellow,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          // Top App Bar Controls
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white, size: 30),
                        onPressed: () => Navigator.pop(context),
                      ),

                      // Halal Protection & Wali Indicator Pill
                      GestureDetector(
                        onTap: _showHalalGuidelines,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.4),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: _isWaliInCall ? _emeraldGreen : _goldYellow,
                              width: 1.2,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                _isWaliInCall ? Icons.shield_rounded : Icons.info_outline_rounded,
                                color: _isWaliInCall ? _emeraldGreen : _goldYellow,
                                size: 14,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                _isWaliInCall ? 'Wali Supervised Call' : 'Halal Audio',
                                style: TextStyle(
                                  color: _isWaliInCall ? const Color(0xFFA8E6CF) : Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Flip Camera or Info
                      IconButton(
                        icon: const Icon(Icons.flip_camera_ios_rounded, color: Colors.white, size: 22),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Camera flipped'), duration: Duration(milliseconds: 800)),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Bottom Self Floating Preview (If Video Call)
          if (widget.isVideoCall && !_isVideoOff)
            Positioned(
              right: 18,
              bottom: 120,
              child: Container(
                width: 95,
                height: 135,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.black.withValues(alpha: 0.6),
                  border: Border.all(color: Colors.white30, width: 1.5),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withValues(alpha: 0.4), blurRadius: 10),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: const [
                    Text('🤵🏻', style: TextStyle(fontSize: 34)),
                    Positioned(
                      bottom: 6,
                      child: Text(
                        'You',
                        style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Bottom Floating Action Control Bar
          Positioned(
            left: 20,
            right: 20,
            bottom: 30,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.45),
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Mic Mute Button
                  _buildCallActionBtn(
                    icon: _isMuted ? Icons.mic_off_rounded : Icons.mic_rounded,
                    isActive: _isMuted,
                    activeColor: Colors.white,
                    onTap: () => setState(() => _isMuted = !_isMuted),
                  ),

                  // Video Toggle Button
                  _buildCallActionBtn(
                    icon: _isVideoOff ? Icons.videocam_off_rounded : Icons.videocam_rounded,
                    isActive: _isVideoOff,
                    activeColor: Colors.white,
                    onTap: () => setState(() => _isVideoOff = !_isVideoOff),
                  ),

                  // Speaker Button
                  _buildCallActionBtn(
                    icon: _isSpeakerOn ? Icons.volume_up_rounded : Icons.volume_down_rounded,
                    isActive: _isSpeakerOn,
                    activeColor: _goldYellow,
                    onTap: () => setState(() => _isSpeakerOn = !_isSpeakerOn),
                  ),

                  // Wali Join/Invite Button
                  _buildCallActionBtn(
                    icon: Icons.family_restroom_rounded,
                    isActive: _isWaliInCall,
                    activeColor: _emeraldGreen,
                    onTap: () {
                      setState(() => _isWaliInCall = !_isWaliInCall);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(_isWaliInCall ? '✓ Wali is currently in this call' : 'Wali session paused'),
                          backgroundColor: _isWaliInCall ? _emeraldGreen : _primaryPink,
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                  ),

                  // End Call Button
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 52,
                      height: 52,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE53935),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x66E53935),
                            blurRadius: 12,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(Icons.call_end_rounded, color: Colors.white, size: 26),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCallActionBtn({
    required IconData icon,
    required bool isActive,
    required Color activeColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: isActive ? Colors.white.withValues(alpha: 0.25) : Colors.white.withValues(alpha: 0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: isActive ? activeColor : Colors.white, size: 22),
      ),
    );
  }
}
