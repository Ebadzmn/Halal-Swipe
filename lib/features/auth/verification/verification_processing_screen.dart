import 'dart:async';
import 'package:flutter/material.dart';
import 'package:halal_swipe/routes/app_routes.dart';

class VerificationProcessingScreen extends StatefulWidget {
  const VerificationProcessingScreen({super.key});

  @override
  State<VerificationProcessingScreen> createState() =>
      _VerificationProcessingScreenState();
}

class _VerificationProcessingScreenState
    extends State<VerificationProcessingScreen> with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _rotationController;
  int _currentStepIndex = 0;
  Timer? _timer;

  static const Color _primaryPink = Color(0xFFD64D7B);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textGrey = Color(0xFF5A606E);

  final List<String> _statusSteps = [
    'Connecting to Didit.me protocol...',
    'Analyzing document security features...',
    'Performing 3D biometrics liveness check...',
    'Finalizing cryptographic verification...',
  ];

  @override
  void initState() {
    super.initState();

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    )..repeat(reverse: true);

    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();

    // Step cycle and auto-navigate to success
    _timer = Timer.periodic(const Duration(milliseconds: 1400), (timer) {
      if (_currentStepIndex < _statusSteps.length - 1) {
        if (mounted) {
          setState(() {
            _currentStepIndex++;
          });
        }
      } else {
        _timer?.cancel();
        Future.delayed(const Duration(milliseconds: 600), () {
          if (mounted) {
            Navigator.pushReplacementNamed(
                context, AppRoutes.verificationSuccess);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _rotationController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 3),

              // Glowing & Rotating Animation Core
              Center(
                child: SizedBox(
                  width: 180,
                  height: 180,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Pulsing outer ripple
                      AnimatedBuilder(
                        animation: _pulseController,
                        builder: (context, child) {
                          return Container(
                            width: 150 + (_pulseController.value * 28),
                            height: 150 + (_pulseController.value * 28),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _primaryPink.withValues(
                                  alpha: 0.15 - (_pulseController.value * 0.1)),
                            ),
                          );
                        },
                      ),

                      // Rotating gradient ring
                      RotationTransition(
                        turns: _rotationController,
                        child: Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const SweepGradient(
                              colors: [
                                Color(0xFFD84A79),
                                Color(0xFFFFD438),
                                Color(0xFF007554),
                                Color(0xFFD84A79),
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Center Icon
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFFD84A79),
                              Color(0xFFBA335E),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: _primaryPink.withValues(alpha: 0.35),
                              blurRadius: 18,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.face_retouching_natural_rounded,
                            size: 46,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 42),

              // Title
              const Text(
                "We're verifying your identity...",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: _textDark,
                  letterSpacing: -0.4,
                ),
              ),

              const SizedBox(height: 12),

              // Animated Status text
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Text(
                  _statusSteps[_currentStepIndex],
                  key: ValueKey<int>(_currentStepIndex),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w600,
                    color: _primaryPink,
                    height: 1.4,
                  ),
                ),
              ),

              const SizedBox(height: 36),

              // Progress Bar
              Container(
                width: 200,
                height: 6,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3E2EA),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: (_currentStepIndex + 1) / _statusSteps.length,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFD84A79), Color(0xFFFFD438)],
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'Please keep this screen open',
                style: TextStyle(
                  fontSize: 12,
                  color: _textGrey,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }
}
