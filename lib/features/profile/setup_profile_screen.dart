import 'package:flutter/material.dart';
import 'package:halal_swipe/features/profile/models/profile_setup_data.dart';
import 'package:halal_swipe/routes/app_routes.dart';

class SetupProfileScreen extends StatefulWidget {
  const SetupProfileScreen({super.key});

  @override
  State<SetupProfileScreen> createState() => _SetupProfileScreenState();
}

class _SetupProfileScreenState extends State<SetupProfileScreen> {
  final PageController _pageController = PageController();
  int _currentStep = 0;
  final int _totalSteps = 6; // Steps: 0: Basic, 1: Religious, 2: Education, 3: Family, 4: Photos, 5: Preview

  final UserProfileData _profile = UserProfileData();

  static const Color _primaryPink = Color(0xFF941235);
  static const Color _buttonPink = Color(0xFF941235);
  static const Color _darkPink = Color(0xFF700B26);
  static const Color _inputFill = Color(0xFFFDF6F8);
  static const Color _inputBorder = Color(0xFFF3D2DE);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textGrey = Color(0xFF5A606E);
  static const Color _emeraldGreen = Color(0xFF007554);

  // Controllers for text fields
  late TextEditingController _nameController;
  late TextEditingController _locationController;
  late TextEditingController _professionController;
  late TextEditingController _jobController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: _profile.name);
    _locationController = TextEditingController(text: _profile.location);
    _professionController = TextEditingController(text: _profile.profession);
    _jobController = TextEditingController(text: _profile.jobOrBusiness);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    _locationController.dispose();
    _professionController.dispose();
    _jobController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (_currentStep < _totalSteps - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
      );
    } else {
      // Completed Profile
      _showCompletionDialog();
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
      );
    } else {
      Navigator.pop(context);
    }
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 76,
                height: 76,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFE8F9F3),
                ),
                child: const Icon(
                  Icons.favorite_rounded,
                  size: 42,
                  color: _emeraldGreen,
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'Profile Completed! 🎉',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: _textDark,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'May Allah grant you a righteous and blessed spouse. You are now ready to explore matches.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13.5,
                  color: _textGrey,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // close dialog
                    Navigator.pushReplacementNamed(context, AppRoutes.home);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _buttonPink,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Explore Halal Matches',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
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
    final stepTitles = [
      'Basic Information',
      'Religious Practice',
      'Education & Career',
      'Family & Lifestyle',
      'Profile Photos & Privacy',
      'Profile Preview',
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: _primaryPink, size: 20),
          onPressed: _previousStep,
        ),
        title: Column(
          children: [
            Text(
              'Step ${_currentStep + 1} of $_totalSteps',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: _primaryPink,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              stepTitles[_currentStep],
              style: const TextStyle(
                color: _textDark,
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Top Multi-step Progress Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: Row(
                children: List.generate(
                  _totalSteps,
                  (index) => Expanded(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 2.5),
                      height: 5,
                      decoration: BoxDecoration(
                        color: index <= _currentStep
                            ? _buttonPink
                            : const Color(0xFFF3E2EA),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Page View with 6 Distinct Setup Screens
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(), // Controls through next/back buttons
                onPageChanged: (index) {
                  setState(() {
                    _currentStep = index;
                  });
                },
                children: [
                  _buildScreen10BasicInfo(),
                  _buildScreen11ReligiousPractice(),
                  _buildScreen12EducationCareer(),
                  _buildScreen13FamilyLifestyle(),
                  _buildScreen14ProfilePhotos(),
                  _buildScreen15ProfilePreview(),
                ],
              ),
            ),

            // Bottom Continue / Next Button
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 20),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: _nextStep,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _buttonPink,
                    foregroundColor: Colors.white,
                    elevation: 4,
                    shadowColor: _buttonPink.withValues(alpha: 0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _currentStep == _totalSteps - 1
                            ? 'Complete Profile & Start'
                            : 'Continue to Next Step',
                        style: const TextStyle(
                          fontSize: 16.5,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        _currentStep == _totalSteps - 1
                            ? Icons.check_circle_rounded
                            : Icons.arrow_forward_rounded,
                        size: 19,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================
  // SCREEN 10: BASIC INFORMATION
  // ==========================================
  Widget _buildScreen10BasicInfo() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Photo Selector Avatar
          Center(
            child: Stack(
              children: [
                Container(
                  width: 104,
                  height: 104,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFFFF0F5),
                    border: Border.all(color: _inputBorder, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: _primaryPink.withValues(alpha: 0.15),
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      _profile.avatarEmoji,
                      style: const TextStyle(fontSize: 46),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _buttonPink,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(
                      Icons.camera_alt_rounded,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          const Center(
            child: Text(
              'Upload Profile Photo',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: _primaryPink,
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Name Field
          _buildInputLabel('Full Name'),
          _buildTextFormField(
            controller: _nameController,
            hint: 'Ahmad Al-Mansoor',
            onChanged: (val) => _profile.name = val,
          ),

          const SizedBox(height: 18),

          // Gender Selector
          _buildInputLabel('Gender'),
          Row(
            children: [
              Expanded(
                child: _buildChoiceChip(
                  label: 'Male 🧔🏻‍♂️',
                  isSelected: _profile.gender == 'Male',
                  onTap: () => setState(() => _profile.gender = 'Male'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildChoiceChip(
                  label: 'Female 🧕🏼',
                  isSelected: _profile.gender == 'Female',
                  onTap: () => setState(() => _profile.gender = 'Female'),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          // Date of Birth
          _buildInputLabel('Date of Birth'),
          _buildDropdownPicker(
            value: '14 May 1997 (27 yrs)',
            icon: Icons.calendar_month_rounded,
            onTap: () {},
          ),

          const SizedBox(height: 18),

          // Location Field
          _buildInputLabel('Location (City, Country)'),
          _buildTextFormField(
            controller: _locationController,
            hint: 'London, United Kingdom',
            prefixIcon: Icons.location_on_rounded,
            onChanged: (val) => _profile.location = val,
          ),

          const SizedBox(height: 18),

          // Height
          _buildInputLabel('Height'),
          _buildDropdownPicker(
            value: _profile.height,
            icon: Icons.height_rounded,
            onTap: () {},
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // ==========================================
  // SCREEN 11: RELIGIOUS PRACTICE
  // ==========================================
  Widget _buildScreen11ReligiousPractice() {
    final practiceLevels = [
      'Very Practicing',
      'Practicing Muslim',
      'Moderate Practicing',
      'Revert / Growing',
    ];

    final madhhabs = ['Hanafi', 'Shafi\'i', 'Maliki', 'Hanbali', 'General Sunni'];

    final prayerOptions = [
      'Always Pray 5 Times Daily',
      'Usually Pray Most Prayers',
      'Striving & Improving',
    ];

    final islamicValuesList = [
      'Quran Recitation',
      'Charity (Sadaqah)',
      'Family First',
      'Modesty',
      'Sunnah Adherence',
      'Dhikr & Dua',
      'Seeking Islamic Knowledge',
    ];

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInputLabel('Religious Practice Level'),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: practiceLevels
                .map((level) => _buildChoiceChip(
                      label: level,
                      isSelected: _profile.religiousPracticeLevel == level,
                      onTap: () =>
                          setState(() => _profile.religiousPracticeLevel = level),
                    ))
                .toList(),
          ),

          const SizedBox(height: 20),

          _buildInputLabel('Madhhab / School of Thought'),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: madhhabs
                .map((m) => _buildChoiceChip(
                      label: m,
                      isSelected: _profile.madhhab == m,
                      onTap: () => setState(() => _profile.madhhab = m),
                    ))
                .toList(),
          ),

          const SizedBox(height: 20),

          _buildInputLabel('Daily Prayer Habits (Salah)'),
          Column(
            children: prayerOptions
                .map((p) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: _buildChoiceChip(
                        label: p,
                        isSelected: _profile.prayerHabits == p,
                        fullWidth: true,
                        onTap: () => setState(() => _profile.prayerHabits = p),
                      ),
                    ))
                .toList(),
          ),

          const SizedBox(height: 20),

          _buildInputLabel('Core Islamic Values (Multi-select)'),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: islamicValuesList.map((val) {
              final isSelected = _profile.islamicValues.contains(val);
              return _buildChoiceChip(
                label: val,
                isSelected: isSelected,
                onTap: () {
                  setState(() {
                    if (isSelected) {
                      _profile.islamicValues.remove(val);
                    } else {
                      _profile.islamicValues.add(val);
                    }
                  });
                },
              );
            }).toList(),
          ),

          const SizedBox(height: 20),

          _buildInputLabel('Dietary Habit'),
          _buildDropdownPicker(
            value: _profile.dietPreference,
            icon: Icons.restaurant_rounded,
            onTap: () {},
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // ==========================================
  // SCREEN 12: EDUCATION & CAREER
  // ==========================================
  Widget _buildScreen12EducationCareer() {
    final educationLevels = [
      "Master's Degree (MSc)",
      "Bachelor's Degree (BSc)",
      'Doctorate / PhD',
      'Associate Degree',
      'Islamic Studies Alimiyyah',
    ];

    final incomeRanges = [
      'Under \$50k / year',
      '\$50k - \$80k / year',
      '\$80k - \$120k / year',
      '\$120k - \$200k+ / year',
    ];

    final workPrefs = [
      'Full-time Onsite',
      'Hybrid / Flexible',
      'Remote Work',
      'Self-Employed / Business',
    ];

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInputLabel('Highest Education Level'),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: educationLevels
                .map((edu) => _buildChoiceChip(
                      label: edu,
                      isSelected: _profile.education == edu,
                      onTap: () => setState(() => _profile.education = edu),
                    ))
                .toList(),
          ),

          const SizedBox(height: 20),

          _buildInputLabel('Profession / Field'),
          _buildTextFormField(
            controller: _professionController,
            hint: 'e.g. Software Engineer, Doctor, Teacher',
            prefixIcon: Icons.work_outline_rounded,
            onChanged: (val) => _profile.profession = val,
          ),

          const SizedBox(height: 18),

          _buildInputLabel('Job Title / Business'),
          _buildTextFormField(
            controller: _jobController,
            hint: 'e.g. Senior Tech Lead, Founder',
            prefixIcon: Icons.business_center_outlined,
            onChanged: (val) => _profile.jobOrBusiness = val,
          ),

          const SizedBox(height: 20),

          _buildInputLabel('Annual Income Range'),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: incomeRanges
                .map((inc) => _buildChoiceChip(
                      label: inc,
                      isSelected: _profile.incomeRange == inc,
                      onTap: () => setState(() => _profile.incomeRange = inc),
                    ))
                .toList(),
          ),

          const SizedBox(height: 20),

          _buildInputLabel('Work Arrangement Preference'),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: workPrefs
                .map((wp) => _buildChoiceChip(
                      label: wp,
                      isSelected: _profile.workPreference == wp,
                      onTap: () => setState(() => _profile.workPreference = wp),
                    ))
                .toList(),
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // ==========================================
  // SCREEN 13: FAMILY & LIFESTYLE
  // ==========================================
  Widget _buildScreen13FamilyLifestyle() {
    final familyStructures = [
      'Nuclear / Independent',
      'Close-knit Extended',
      'Joint Family',
    ];

    final livingOptions = [
      'Living Independently',
      'Living with Parents',
      'Flexible after Marriage',
    ];

    final childrenOptions = [
      'Wants Children InshaAllah',
      'Open to Discussion',
      'Already have Children',
    ];

    final smokingOptions = ['Non-Smoker', 'Social Smoker', 'Never'];

    final hobbyList = [
      'Reading & Tafseer',
      'Gym & Fitness',
      'Travel & Nature',
      'Cooking',
      'Tech & AI',
      'Martial Arts',
      'Photography',
      'Volunteering',
    ];

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInputLabel('Family Structure & Dynamics'),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: familyStructures
                .map((fs) => _buildChoiceChip(
                      label: fs,
                      isSelected: _profile.familyStructure == fs,
                      onTap: () => setState(() => _profile.familyStructure = fs),
                    ))
                .toList(),
          ),

          const SizedBox(height: 20),

          _buildInputLabel('Current / Intended Living Arrangement'),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: livingOptions
                .map((lo) => _buildChoiceChip(
                      label: lo,
                      isSelected: _profile.livingArrangement == lo,
                      onTap: () => setState(() => _profile.livingArrangement = lo),
                    ))
                .toList(),
          ),

          const SizedBox(height: 20),

          _buildInputLabel('Children Plans'),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: childrenOptions
                .map((co) => _buildChoiceChip(
                      label: co,
                      isSelected: _profile.childrenPreference == co,
                      onTap: () =>
                          setState(() => _profile.childrenPreference = co),
                    ))
                .toList(),
          ),

          const SizedBox(height: 20),

          _buildInputLabel('Smoking Habit'),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: smokingOptions
                .map((sm) => _buildChoiceChip(
                      label: sm,
                      isSelected: _profile.smokingStatus == sm,
                      onTap: () => setState(() => _profile.smokingStatus = sm),
                    ))
                .toList(),
          ),

          const SizedBox(height: 20),

          _buildInputLabel('Hobbies & Passions (Multi-select)'),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: hobbyList.map((h) {
              final isSelected = _profile.hobbies.contains(h);
              return _buildChoiceChip(
                label: h,
                isSelected: isSelected,
                onTap: () {
                  setState(() {
                    if (isSelected) {
                      _profile.hobbies.remove(h);
                    } else {
                      _profile.hobbies.add(h);
                    }
                  });
                },
              );
            }).toList(),
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // ==========================================
  // SCREEN 14: PROFILE PHOTOS & PRIVACY
  // ==========================================
  Widget _buildScreen14ProfilePhotos() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Privacy Blur Banner
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF0F5),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFFFD1DC)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.remove_red_eye_rounded,
                    color: _primaryPink,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Noor Shield™ Photo Blur',
                        style: TextStyle(
                          fontSize: 14.5,
                          fontWeight: FontWeight.w800,
                          color: _textDark,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'Photos remain blurred to strangers until you mutually match and unlock.',
                        style: TextStyle(
                          fontSize: 12,
                          color: _textGrey,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
                Switch.adaptive(
                  value: _profile.isBlurEnabled,
                  activeColor: _buttonPink,
                  onChanged: (val) {
                    setState(() {
                      _profile.isBlurEnabled = val;
                    });
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          _buildInputLabel('Upload & Organize Photos (Min. 2 photos)'),

          // Photo Grid (Add / Reorder / Delete)
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.88,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              final isPrimary = index == 0;
              return Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFDF6F8),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isPrimary ? _buttonPink : _inputBorder,
                    width: isPrimary ? 2 : 1.2,
                  ),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            isPrimary
                                ? Icons.add_a_photo_rounded
                                : Icons.image_rounded,
                            size: 36,
                            color: isPrimary ? _buttonPink : Colors.grey.shade400,
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              _profile.photoPlaceholders[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 11.5,
                                fontWeight: FontWeight.w700,
                                color: isPrimary ? _primaryPink : _textGrey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Primary Badge
                    if (isPrimary)
                      Positioned(
                        top: 8,
                        left: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: _buttonPink,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            'Main Photo',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                    // Delete / Reorder actions
                    Positioned(
                      top: 6,
                      right: 6,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.8),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          index == 0 ? Icons.star_rounded : Icons.close_rounded,
                          size: 16,
                          color: index == 0 ? const Color(0xFFFFB800) : Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          const SizedBox(height: 18),

          const Center(
            child: Text(
              '💡 Tip: Clear, modest, smiling photos receive 3x more blessed matches.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.w600,
                color: Color(0xFF007554),
              ),
            ),
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // ==========================================
  // SCREEN 15: PROFILE PREVIEW
  // ==========================================
  Widget _buildScreen15ProfilePreview() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Card Header with Photo & Verified Badge
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFD84A79), Color(0xFFBA335E)],
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: _primaryPink.withValues(alpha: 0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              children: [
                // Avatar & Verified Icon
                Stack(
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          _profile.avatarEmoji,
                          style: const TextStyle(fontSize: 44),
                        ),
                      ),
                    ),
                    const Positioned(
                      bottom: 2,
                      right: 2,
                      child: Icon(
                        Icons.verified_rounded,
                        color: Color(0xFF00E676),
                        size: 24,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  _profile.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${_profile.gender} • 27 yrs • ${_profile.location}',
                  style: TextStyle(
                    fontSize: 13.5,
                    color: Colors.white.withValues(alpha: 0.9),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '🌟 ${_profile.religiousPracticeLevel}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Section 1: Religious Foundation
          _buildPreviewSectionCard(
            title: 'Religious Foundation',
            icon: Icons.mosque_rounded,
            items: [
              'Practice: ${_profile.religiousPracticeLevel}',
              'Madhhab: ${_profile.madhhab}',
              'Prayer Habits: ${_profile.prayerHabits}',
              'Diet: ${_profile.dietPreference}',
              'Core Values: ${_profile.islamicValues.join(', ')}',
            ],
          ),

          const SizedBox(height: 14),

          // Section 2: Education & Career
          _buildPreviewSectionCard(
            title: 'Education & Career',
            icon: Icons.school_rounded,
            items: [
              'Degree: ${_profile.education}',
              'Profession: ${_profile.profession}',
              'Role: ${_profile.jobOrBusiness}',
              'Income: ${_profile.incomeRange}',
              'Work Style: ${_profile.workPreference}',
            ],
          ),

          const SizedBox(height: 14),

          // Section 3: Family & Lifestyle
          _buildPreviewSectionCard(
            title: 'Family & Lifestyle',
            icon: Icons.family_restroom_rounded,
            items: [
              'Family Structure: ${_profile.familyStructure}',
              'Living: ${_profile.livingArrangement}',
              'Children: ${_profile.childrenPreference}',
              'Smoking: ${_profile.smokingStatus}',
              'Hobbies: ${_profile.hobbies.join(', ')}',
            ],
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // ==========================================
  // HELPER WIDGETS FOR CLEAN REUSABILITY
  // ==========================================

  Widget _buildInputLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w800,
          color: _textDark,
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String hint,
    IconData? prefixIcon,
    Function(String)? onChanged,
  }) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14.5),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: _primaryPink, size: 20)
            : null,
        filled: true,
        fillColor: _inputFill,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: _inputBorder, width: 1.2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: _inputBorder, width: 1.2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: _primaryPink, width: 1.5),
        ),
      ),
    );
  }

  Widget _buildDropdownPicker({
    required String value,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        decoration: BoxDecoration(
          color: _inputFill,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: _inputBorder, width: 1.2),
        ),
        child: Row(
          children: [
            Icon(icon, color: _primaryPink, size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.w600,
                  color: _textDark,
                ),
              ),
            ),
            const Icon(Icons.arrow_drop_down_rounded, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildChoiceChip({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    bool fullWidth = false,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: fullWidth ? double.infinity : null,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
          textAlign: fullWidth ? TextAlign.left : TextAlign.center,
          style: TextStyle(
            fontSize: 13.5,
            fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
            color: isSelected ? _buttonPink : const Color(0xFF4A4E5E),
          ),
        ),
      ),
    );
  }

  Widget _buildPreviewSectionCard({
    required String title,
    required IconData icon,
    required List<String> items,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFDFBFC),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFF3E2EA), width: 1.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: _primaryPink, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: _textDark,
                ),
              ),
            ],
          ),
          const Divider(height: 18, color: Color(0xFFF3E2EA)),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• ', style: TextStyle(color: _primaryPink, fontWeight: FontWeight.bold)),
                  Expanded(
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF4A4E5E),
                        height: 1.35,
                      ),
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
}
