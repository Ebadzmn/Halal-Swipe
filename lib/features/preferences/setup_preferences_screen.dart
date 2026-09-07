import 'package:flutter/material.dart';
import 'package:halal_swipe/routes/app_routes.dart';

class SetupPreferencesScreen extends StatefulWidget {
  const SetupPreferencesScreen({super.key});

  @override
  State<SetupPreferencesScreen> createState() => _SetupPreferencesScreenState();
}

class _SetupPreferencesScreenState extends State<SetupPreferencesScreen> {
  RangeValues _ageRange = const RangeValues(21, 28);
  double _distanceRadius = 25; // in miles

  String _religiousPractice = 'Practicing Muslimah';
  String _education = 'Bachelor’s Degree or Higher';
  String _maritalStatus = 'Never Married';
  String _childrenPreference = 'Wants Children InshaAllah';
  String _livingArrangement = 'Flexible / Independent';
  List<String> _preferredValues = [
    '5 Times Daily Salah',
    'Modesty / Hijab',
    'Halal Income',
    'Family Oriented'
  ];

  static const Color _primaryPink = Color(0xFFD64D7B);
  static const Color _buttonPink = Color(0xFFD44F7A);
  static const Color _inputFill = Color(0xFFFDF6F8);
  static const Color _inputBorder = Color(0xFFF3D2DE);
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
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: _primaryPink, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Partner Preferences',
          style: TextStyle(
            color: _textDark,
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Subtitle
                    const Text(
                      'Customize Your Ideal Match',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: _textDark,
                        letterSpacing: -0.3,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Azura AI uses these criteria to calculate accurate compatibility scores.',
                      style: TextStyle(
                        fontSize: 13.5,
                        color: _textGrey,
                        height: 1.35,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // 1. Age Range Slider
                    _buildSectionHeader(
                      title: 'Preferred Age Range',
                      trailing:
                          '${_ageRange.start.round()} - ${_ageRange.end.round()} yrs',
                    ),
                    RangeSlider(
                      values: _ageRange,
                      min: 18,
                      max: 50,
                      divisions: 32,
                      activeColor: _buttonPink,
                      inactiveColor: const Color(0xFFF3D2DE),
                      labels: RangeLabels(
                        '${_ageRange.start.round()} yrs',
                        '${_ageRange.end.round()} yrs',
                      ),
                      onChanged: (values) {
                        setState(() {
                          _ageRange = values;
                        });
                      },
                    ),

                    const SizedBox(height: 18),

                    // 2. Maximum Distance
                    _buildSectionHeader(
                      title: 'Maximum Distance',
                      trailing: 'Within ${_distanceRadius.round()} miles',
                    ),
                    Slider(
                      value: _distanceRadius,
                      min: 5,
                      max: 100,
                      divisions: 19,
                      activeColor: _buttonPink,
                      inactiveColor: const Color(0xFFF3D2DE),
                      label: '${_distanceRadius.round()} miles',
                      onChanged: (val) {
                        setState(() {
                          _distanceRadius = val;
                        });
                      },
                    ),

                    const SizedBox(height: 18),

                    // 3. Religious Practice Level
                    _buildSectionHeader(title: 'Religious Practice'),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        'Very Practicing',
                        'Practicing Muslimah',
                        'Moderate Practicing',
                        'Any Level',
                      ].map((level) => _buildChoiceChip(
                            label: level,
                            isSelected: _religiousPractice == level,
                            onTap: () => setState(() => _religiousPractice = level),
                          )).toList(),
                    ),

                    const SizedBox(height: 20),

                    // 4. Education Preference
                    _buildSectionHeader(title: 'Minimum Education'),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        'High School',
                        'Bachelor’s Degree or Higher',
                        'Master’s / PhD',
                        'Doesn’t Matter',
                      ].map((edu) => _buildChoiceChip(
                            label: edu,
                            isSelected: _education == edu,
                            onTap: () => setState(() => _education = edu),
                          )).toList(),
                    ),

                    const SizedBox(height: 20),

                    // 5. Marital Status
                    _buildSectionHeader(title: 'Marital Status'),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        'Never Married',
                        'Divorced',
                        'Widowed',
                        'Open to All',
                      ].map((status) => _buildChoiceChip(
                            label: status,
                            isSelected: _maritalStatus == status,
                            onTap: () => setState(() => _maritalStatus = status),
                          )).toList(),
                    ),

                    const SizedBox(height: 20),

                    // 6. Must-Have Values (Multi-select)
                    _buildSectionHeader(title: 'Must-Have Islamic Values'),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        '5 Times Daily Salah',
                        'Modesty / Hijab',
                        'Halal Income',
                        'Family Oriented',
                        'Quranic Knowledge',
                        'Wali Involved from Start',
                      ].map((val) {
                        final isSelected = _preferredValues.contains(val);
                        return _buildChoiceChip(
                          label: val,
                          isSelected: isSelected,
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                _preferredValues.remove(val);
                              } else {
                                _preferredValues.add(val);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 20),

                    // 7. Children Preference
                    _buildSectionHeader(title: 'Children Preference'),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        'Wants Children InshaAllah',
                        'Doesn’t Want Children',
                        'Open to Discussion',
                      ].map((c) => _buildChoiceChip(
                            label: c,
                            isSelected: _childrenPreference == c,
                            onTap: () => setState(() => _childrenPreference = c),
                          )).toList(),
                    ),

                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),

            // Bottom Save Preferences Button
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 10, 22, 20),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.home);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _buttonPink,
                    foregroundColor: Colors.white,
                    elevation: 4,
                    shadowColor: _buttonPink.withValues(alpha: 0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: const Text(
                    'Save Preferences & Find Matches',
                    style: TextStyle(
                      fontSize: 16.5,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader({required String title, String? trailing}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14.5,
              fontWeight: FontWeight.w800,
              color: _textDark,
            ),
          ),
          if (trailing != null)
            Text(
              trailing,
              style: const TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.w700,
                color: _primaryPink,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildChoiceChip({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFF0F5) : _inputFill,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? _buttonPink : _inputBorder,
            width: isSelected ? 1.6 : 1.2,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
            color: isSelected ? _buttonPink : const Color(0xFF4A4E5E),
          ),
        ),
      ),
    );
  }
}
