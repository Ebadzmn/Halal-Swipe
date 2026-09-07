class UserProfileData {
  // Screen 10: Basic Info
  String name;
  DateTime? dob;
  String gender;
  String location;
  String height;
  String avatarEmoji;

  // Screen 11: Religious Practice
  String religiousPracticeLevel;
  String madhhab;
  String prayerHabits;
  List<String> islamicValues;
  String dietPreference;

  // Screen 12: Education & Career
  String education;
  String profession;
  String jobOrBusiness;
  String incomeRange;
  String workPreference;

  // Screen 13: Family & Lifestyle
  String familyValues;
  String familyStructure;
  String livingArrangement;
  String childrenPreference;
  String smokingStatus;
  List<String> hobbies;

  // Screen 14: Profile Photos
  List<String> photoPlaceholders;
  bool isBlurEnabled;

  UserProfileData({
    this.name = 'Ahmad Al-Mansoor',
    this.dob,
    this.gender = 'Male',
    this.location = 'London, United Kingdom',
    this.height = "5' 11\" (180 cm)",
    this.avatarEmoji = '🧔🏻‍♂️',
    this.religiousPracticeLevel = 'Practicing Muslim',
    this.madhhab = 'Hanafi',
    this.prayerHabits = 'Always Pray 5 Times Daily',
    List<String>? islamicValues,
    this.dietPreference = 'Strict Halal Only',
    this.education = "Master's Degree (MSc)",
    this.profession = 'Software Engineer',
    this.jobOrBusiness = 'Tech & Product Lead',
    this.incomeRange = '\$80k - \$120k / year',
    this.workPreference = 'Hybrid / Full-time',
    this.familyValues = 'Traditional & Supportive',
    this.familyStructure = 'Nuclear / Moderate',
    this.livingArrangement = 'Living Independently',
    this.childrenPreference = 'Wants Children InshaAllah',
    this.smokingStatus = 'Non-Smoker',
    List<String>? hobbies,
    List<String>? photoPlaceholders,
    this.isBlurEnabled = true,
  })  : islamicValues = islamicValues ??
            ['Quran Recitation', 'Charity (Sadaqah)', 'Family First', 'Modesty'],
        hobbies = hobbies ??
            ['Reading & Tafseer', 'Gym & Fitness', 'Travel & Nature', 'Cooking', 'Tech & AI'],
        photoPlaceholders = photoPlaceholders ??
            [
              '📸 Primary Profile Photo',
              '🌿 Casual & Lifestyle',
              '✈️ Outdoor & Travel',
              '🕌 Islamic Events & Family',
            ];
}
