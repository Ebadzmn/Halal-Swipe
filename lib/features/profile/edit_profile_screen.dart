import 'package:flutter/material.dart';
import 'package:halal_swipe/features/profile/models/profile_setup_data.dart';
import 'package:halal_swipe/routes/app_routes.dart';

class EditProfileScreen extends StatefulWidget {
  final UserProfileData? profileData;

  const EditProfileScreen({super.key, this.profileData});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  static const Color _primaryPink = Color(0xFF941235);
  static const Color _darkBurgundy = Color(0xFF6B0623);
  static const Color _emeraldGreen = Color(0xFF007554);
  static const Color _goldYellow = Color(0xFFFFB800);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textGrey = Color(0xFF6B7280);

  late UserProfileData _profile;

  late TextEditingController _nameController;
  late TextEditingController _locationController;
  late TextEditingController _heightController;
  late TextEditingController _educationController;
  late TextEditingController _professionController;
  late TextEditingController _jobController;
  late TextEditingController _incomeController;

  @override
  void initState() {
    super.initState();
    _profile = widget.profileData ?? UserProfileData();

    _nameController = TextEditingController(text: _profile.name);
    _locationController = TextEditingController(text: _profile.location);
    _heightController = TextEditingController(text: _profile.height);
    _educationController = TextEditingController(text: _profile.education);
    _professionController = TextEditingController(text: _profile.profession);
    _jobController = TextEditingController(text: _profile.jobOrBusiness);
    _incomeController = TextEditingController(text: _profile.incomeRange);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _heightController.dispose();
    _educationController.dispose();
    _professionController.dispose();
    _jobController.dispose();
    _incomeController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    setState(() {
      _profile.name = _nameController.text.trim();
      _profile.location = _locationController.text.trim();
      _profile.height = _heightController.text.trim();
      _profile.education = _educationController.text.trim();
      _profile.profession = _professionController.text.trim();
      _profile.jobOrBusiness = _jobController.text.trim();
      _profile.incomeRange = _incomeController.text.trim();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('✓ Profile updated successfully with barakah!'),
        backgroundColor: _emeraldGreen,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    Navigator.pop(context, _profile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.6,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: _primaryPink, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: _textDark,
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: _saveProfile,
            child: const Text(
              'Save',
              style: TextStyle(
                color: _primaryPink,
                fontSize: 15,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar & Photo Edit Section
              _buildAvatarEditSection(),

              const SizedBox(height: 24),

              // Noor Shield Privacy Toggle
              _buildNoorShieldSection(),

              const SizedBox(height: 24),

              // Basic Info Section
              _buildSectionCard(
                title: '👤 Basic Information',
                children: [
                  _buildTextField(label: 'Full Name', controller: _nameController, icon: Icons.person_rounded),
                  const SizedBox(height: 14),
                  _buildTextField(label: 'Location / City', controller: _locationController, icon: Icons.location_on_rounded),
                  const SizedBox(height: 14),
                  _buildTextField(label: 'Height', controller: _heightController, icon: Icons.height_rounded),
                  const SizedBox(height: 14),
                  _buildDropdownField(
                    label: 'Gender',
                    value: _profile.gender,
                    items: ['Male', 'Female'],
                    onChanged: (val) => setState(() => _profile.gender = val!),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Religious Practice Section
              _buildSectionCard(
                title: '🕌 Deen & Religious Practice',
                children: [
                  _buildDropdownField(
                    label: 'Religious Practice Level',
                    value: _profile.religiousPracticeLevel,
                    items: ['Practicing Muslim', 'Very Practicing', 'Moderately Practicing', 'Revert Muslim'],
                    onChanged: (val) => setState(() => _profile.religiousPracticeLevel = val!),
                  ),
                  const SizedBox(height: 14),
                  _buildDropdownField(
                    label: 'Prayer Habits',
                    value: _profile.prayerHabits,
                    items: [
                      'Always Pray 5 Times Daily',
                      'Usually Pray 5 Times',
                      'Praying Regularly / Improving',
                    ],
                    onChanged: (val) => setState(() => _profile.prayerHabits = val!),
                  ),
                  const SizedBox(height: 14),
                  _buildDropdownField(
                    label: 'Madhhab / School of Thought',
                    value: _profile.madhhab,
                    items: ['Hanafi', 'Shafi\'i', 'Maliki', 'Hanbali', 'Just Muslim / Sunnah'],
                    onChanged: (val) => setState(() => _profile.madhhab = val!),
                  ),
                  const SizedBox(height: 14),
                  _buildDropdownField(
                    label: 'Halal Diet',
                    value: _profile.dietPreference,
                    items: ['Strict Halal Only', 'Always Halal / Zabiha', 'Halal Friendly'],
                    onChanged: (val) => setState(() => _profile.dietPreference = val!),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Education & Career Section
              _buildSectionCard(
                title: '🎓 Education & Career',
                children: [
                  _buildTextField(label: 'Education Level', controller: _educationController, icon: Icons.school_rounded),
                  const SizedBox(height: 14),
                  _buildTextField(label: 'Profession / Title', controller: _professionController, icon: Icons.work_rounded),
                  const SizedBox(height: 14),
                  _buildTextField(label: 'Job Role / Business', controller: _jobController, icon: Icons.business_center_rounded),
                  const SizedBox(height: 14),
                  _buildTextField(label: 'Income Range (Optional)', controller: _incomeController, icon: Icons.attach_money_rounded),
                ],
              ),

              const SizedBox(height: 20),

              // Family & Marriage Expectations
              _buildSectionCard(
                title: '👨‍👩‍👧 Family & Marriage Vision',
                children: [
                  _buildDropdownField(
                    label: 'Family Values',
                    value: _profile.familyValues,
                    items: ['Traditional & Supportive', 'Moderate & Open', 'Strong Islamic Values'],
                    onChanged: (val) => setState(() => _profile.familyValues = val!),
                  ),
                  const SizedBox(height: 14),
                  _buildDropdownField(
                    label: 'Children Preference',
                    value: _profile.childrenPreference,
                    items: [
                      'Wants Children InshaAllah',
                      'Open to Discussion',
                      'Already Have Children',
                    ],
                    onChanged: (val) => setState(() => _profile.childrenPreference = val!),
                  ),
                  const SizedBox(height: 14),
                  _buildDropdownField(
                    label: 'Smoking / Shisha',
                    value: _profile.smokingStatus,
                    items: ['Non-Smoker', 'Occasionally', 'Trying to Quit'],
                    onChanged: (val) => setState(() => _profile.smokingStatus = val!),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Save Button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _saveProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _primaryPink,
                    foregroundColor: Colors.white,
                    elevation: 3,
                    shadowColor: _primaryPink.withValues(alpha: 0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Save Profile Changes',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatarEditSection() {
    return Center(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: _primaryPink, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: _primaryPink.withValues(alpha: 0.2),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    _profile.avatarEmoji,
                    style: const TextStyle(fontSize: 50),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  final emojis = ['🧔🏻‍♂️', '🧕🏼', '👳🏽‍♂️', '🧕🏾', '👨🏻‍💼', '👩🏻‍💻'];
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (ctx) => Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Choose Avatar Emoji', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
                          const SizedBox(height: 16),
                          Wrap(
                            spacing: 16,
                            children: emojis.map((e) => GestureDetector(
                              onTap: () {
                                setState(() => _profile.avatarEmoji = e);
                                Navigator.pop(ctx);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFBF6F8),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Text(e, style: const TextStyle(fontSize: 34)),
                              ),
                            )).toList(),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: _primaryPink,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.camera_alt_rounded, color: Colors.white, size: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Tap camera icon to customize avatar',
            style: TextStyle(fontSize: 12, color: _textGrey),
          ),
        ],
      ),
    );
  }

  Widget _buildNoorShieldSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF6FCF9),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFA8E6CF)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: _emeraldGreen.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.shield_rounded, color: _emeraldGreen, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Noor Shield Privacy',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: _textDark,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Keep your extra photos blurred until mutual interest is approved.',
                  style: TextStyle(fontSize: 11.5, color: _textGrey),
                ),
              ],
            ),
          ),
          Switch(
            value: _profile.isBlurEnabled,
            activeColor: _emeraldGreen,
            onChanged: (val) => setState(() => _profile.isBlurEnabled = val),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF0EBEF)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w900,
              color: _textDark,
            ),
          ),
          const SizedBox(height: 14),
          ...children,
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12.5,
            fontWeight: FontWeight.w700,
            color: Color(0xFF4A4E5E),
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: _primaryPink, size: 20),
            filled: true,
            fillColor: const Color(0xFFFDF6F8),
            contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: Color(0xFFF3D2DE)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: Color(0xFFF3D2DE)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: _primaryPink, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    final effectiveValue = items.contains(value) ? value : items.first;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12.5,
            fontWeight: FontWeight.w700,
            color: Color(0xFF4A4E5E),
          ),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: const Color(0xFFFDF6F8),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFF3D2DE)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: effectiveValue,
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down_rounded, color: _primaryPink),
              items: items
                  .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(item, style: const TextStyle(fontSize: 13.5, color: _textDark)),
                      ))
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
