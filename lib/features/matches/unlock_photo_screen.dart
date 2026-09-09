import 'package:flutter/material.dart';
import 'package:halal_swipe/features/matches/models/match_profile.dart';

class UnlockPhotoScreen extends StatefulWidget {
  final MatchProfile profile;

  const UnlockPhotoScreen({super.key, required this.profile});

  @override
  State<UnlockPhotoScreen> createState() => _UnlockPhotoScreenState();
}

class _UnlockPhotoScreenState extends State<UnlockPhotoScreen> {
  bool _requestSent = false;

  static const Color _primaryPink = Color(0xFF941235);
  static const Color _buttonPink = Color(0xFF941235);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textGrey = Color(0xFF5A606E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close_rounded, color: _textDark, size: 24),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Noor Shield™ Photo Privacy',
          style: TextStyle(
            color: _textDark,
            fontSize: 16.5,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),

              // Blurred / Protected Photo Simulation Core
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFFFF0F5),
                  border: Border.all(color: const Color(0xFFFFD1DC), width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: _primaryPink.withValues(alpha: 0.15),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Avatar blurred underneath
                    Text(
                      widget.profile.avatarEmoji,
                      style: const TextStyle(fontSize: 68),
                    ),

                    // Frosted glass privacy overlay
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withValues(alpha: 0.35),
                      ),
                    ),

                    // Golden Lock Icon
                    Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.lock_rounded,
                        color: Color(0xFFFFB800),
                        size: 26,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Title
              Text(
                "${widget.profile.name}'s Photos are Protected",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: _textDark,
                ),
              ),

              const SizedBox(height: 8),

              // Explanation
              const Text(
                'In accordance with Islamic modesty principles, photos remain blurred until both parties express mutual interest or approve a request.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13.5,
                  color: _textGrey,
                  height: 1.45,
                ),
              ),

              const SizedBox(height: 28),

              // Unlock Criteria Box
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFDFBFC),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: const Color(0xFFF3E2EA), width: 1.2),
                ),
                child: Column(
                  children: [
                    _buildConditionRow(
                      icon: Icons.check_circle_rounded,
                      text: 'Your profile must be 100% ID Verified',
                      isCompleted: true,
                    ),
                    const Divider(height: 20, color: Color(0xFFF3E2EA)),
                    _buildConditionRow(
                      icon: Icons.favorite_border_rounded,
                      text: 'Express Mutual Interest or Send Request',
                      isCompleted: false,
                    ),
                    const Divider(height: 20, color: Color(0xFFF3E2EA)),
                    _buildConditionRow(
                      icon: Icons.shield_moon_rounded,
                      text: 'Noor Shield protects photos against screenshots',
                      isCompleted: true,
                    ),
                  ],
                ),
              ),

              const Spacer(flex: 2),

              // CTA: Request Photo / Mutual Unlock
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: _requestSent
                      ? null
                      : () {
                          setState(() {
                            _requestSent = true;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Photo unlock request sent respectfully!'),
                              backgroundColor: Color(0xFF007554),
                            ),
                          );
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _buttonPink,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: Colors.grey.shade300,
                    elevation: _requestSent ? 0 : 4,
                    shadowColor: _buttonPink.withValues(alpha: 0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _requestSent
                            ? Icons.check_rounded
                            : Icons.lock_open_rounded,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _requestSent
                            ? 'Request Sent Respectfully'
                            : 'Request to Unlock Photos',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildConditionRow({
    required IconData icon,
    required String text,
    required bool isCompleted,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: isCompleted ? const Color(0xFF007554) : _primaryPink,
          size: 20,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2D3142),
            ),
          ),
        ),
      ],
    );
  }
}
