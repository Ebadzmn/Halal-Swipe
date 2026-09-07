import 'package:flutter/material.dart';

class MatchProfile {
  final String id;
  final String name;
  final int age;
  final String location;
  final String height;
  final String profession;
  final String company;
  final String education;
  final String intent; // 'Within 6 Months', 'Within 1 Year', '< 9 Mos'
  final String intentTag; // 'HIGH URGENCY'
  final int matchScore;
  final String matchTier; // 'Soulmate', 'Strong', 'Good'
  final String avatarEmoji;
  final String religiousPractice;
  final String madhhab;
  final String prayerHabits;
  final String familyValues;
  final String livingArrangement;
  final String childrenPreference;
  final String aboutMe;
  final List<String> compatibilityReasons;
  final List<String> hobbies;
  final String imagePath;
  final List<String> tags;
  final bool isPhotoBlurred;
  final bool isVerified;

  const MatchProfile({
    required this.id,
    required this.name,
    required this.age,
    required this.location,
    this.height = "5' 5\" (165 cm)",
    required this.profession,
    this.company = 'Leading Organization',
    this.education = 'Bachelor / Master Degree',
    required this.intent,
    this.intentTag = '',
    required this.matchScore,
    required this.matchTier,
    required this.avatarEmoji,
    this.imagePath = '',
    this.religiousPractice = 'Practicing Muslimah',
    this.madhhab = 'Hanafi / Sunni',
    this.prayerHabits = 'Always Pray 5 Times Daily',
    this.familyValues = 'Traditional & Supportive',
    this.livingArrangement = 'Flexible after Nikah',
    this.childrenPreference = 'Wants Children InshaAllah',
    this.aboutMe =
        'Seeking a pious, kind-hearted spouse who values Deen, family, and personal growth.',
    this.compatibilityReasons = const [
      'Shared dedication to 5 daily prayers',
      'Aligned marriage timeline & intentions',
      'Compatible career and family goals',
    ],
    this.hobbies = const ['Quran Study', 'Travel', 'Reading', 'Volunteering'],
    required this.tags,
    this.isPhotoBlurred = false,
    this.isVerified = true,
  });

  static List<MatchProfile> soulmates = const [
    MatchProfile(
      id: '1',
      name: 'Amina',
      age: 24,
      location: 'Manchester, UK',
      height: "5' 5\" (165 cm)",
      profession: 'Architect',
      company: 'Urban Design Studio',
      education: 'Master of Architecture',
      intent: 'Within 6 Months',
      intentTag: 'HIGH URGENCY',
      matchScore: 99,
      matchTier: 'Soulmate',
      avatarEmoji: '🧕🏽',
      imagePath: 'assets/images/amina.jpg',
      religiousPractice: 'Practicing Muslimah',
      madhhab: 'Hanafi',
      prayerHabits: 'Always Pray 5 Times Daily',
      familyValues: 'Traditional & Warm',
      livingArrangement: 'Flexible after Nikah',
      childrenPreference: 'Wants Children InshaAllah',
      aboutMe:
          'Seeking a pious, kind-hearted spouse who values Deen, family, and personal growth. I enjoy Quran study, Islamic architecture, and hiking.',
      compatibilityReasons: [
        'Shared dedication to 5 daily prayers',
        'Aligned marriage timeline (within 6 months)',
        'Compatible career and creative goals',
      ],
      hobbies: ['Architecture', 'Hiking & Nature', 'Baking', 'Quran Study'],
      tags: ['Practicing Sunnah', 'Family Values', 'Creative Arts'],
      isPhotoBlurred: false,
      isVerified: true,
    ),
    MatchProfile(
      id: '2',
      name: 'Zara',
      age: 26,
      location: 'Central London',
      height: "5' 6\" (168 cm)",
      profession: 'Fintech Lead',
      company: 'Global Fintech Corp',
      education: 'MSc Financial Technology',
      intent: 'Within 1 Year',
      intentTag: 'MODERATE',
      matchScore: 98,
      matchTier: 'Soulmate',
      avatarEmoji: '🧕🏼',
      religiousPractice: 'Very Practicing',
      madhhab: 'Shafi\'i',
      prayerHabits: 'Always Pray 5 Times Daily & Tahajjud',
      familyValues: 'Supportive & Modern Islamic',
      livingArrangement: 'Living Independently',
      childrenPreference: 'Wants Children InshaAllah',
      aboutMe:
          'Passionate about ethical Islamic finance and tech innovation. Grounded in Islamic character, loves travel and community service.',
      compatibilityReasons: [
        'High religious practice compatibility',
        'Aligned views on halal finance & education',
        'Mutual focus on personal fitness & charity',
      ],
      hobbies: ['Halal Travel', 'Charity Work', 'Tennis', 'Podcasts'],
      tags: ['Postgrad Degree', 'Halal Travel', 'Charity Work'],
      isPhotoBlurred: true,
      isVerified: true,
    ),
    MatchProfile(
      id: '3',
      name: 'Fatima',
      age: 23,
      location: 'Birmingham, UK',
      height: "5' 4\" (162 cm)",
      profession: 'Pharmacist',
      company: 'NHS Trust Hospital',
      education: 'MPharm Pharmacy',
      intent: 'Within 6 Months',
      intentTag: 'HIGH URGENCY',
      matchScore: 96,
      matchTier: 'Soulmate',
      avatarEmoji: '🧕🏻',
      religiousPractice: 'Practicing Muslimah',
      madhhab: 'Hanafi',
      prayerHabits: '5 Times Daily',
      familyValues: 'Close-knit Islamic Family',
      livingArrangement: 'Flexible',
      childrenPreference: 'Wants Children (2-3) InshaAllah',
      aboutMe:
          'Dedicated healthcare professional, Hafiza of Quran. Values humble character, modesty, and righteous upbringing for future children.',
      compatibilityReasons: [
        'Quranic commitment synergy',
        'Aligned family aspirations & modesty',
        'Balanced lifestyle and mutual respect',
      ],
      hobbies: ['Daily Quran', 'Healthy Cooking', 'Volunteering', 'Gardening'],
      tags: ['Daily Quran', 'Healthy Cooking', 'Family First'],
      isPhotoBlurred: false,
      isVerified: true,
    ),
  ];

  static List<MatchProfile> compatibleGrid = const [
    MatchProfile(
      id: '4',
      name: 'Maryam',
      age: 25,
      location: 'Birmingham',
      height: "5' 5\" (165 cm)",
      profession: 'Tech Lead',
      company: 'Tech Solutions UK',
      education: 'BSc Computer Science',
      intent: '< 9 Mos',
      matchScore: 94,
      matchTier: 'Strong',
      avatarEmoji: '🧕🏼',
      imagePath: 'assets/images/maryam.jpg',
      religiousPractice: 'Practicing Muslimah',
      madhhab: 'General Sunni',
      prayerHabits: 'Always Pray 5 Times Daily',
      familyValues: 'Traditional & Warm',
      livingArrangement: 'Flexible',
      childrenPreference: 'Wants Children InshaAllah',
      aboutMe:
          'Software engineer with a deep passion for Sunnah living, Islamic technology initiatives, and outdoor adventures.',
      compatibilityReasons: [
        'Technology career and mindset synergy',
        'High religious value compatibility',
        'Aligned timeline within 9 months',
      ],
      hobbies: ['Tech & AI', 'Hiking', 'Coffee Roasting', 'Reading'],
      tags: ['Tech & AI', 'Sunnah Lifestyle'],
      isPhotoBlurred: false,
      isVerified: true,
    ),
    MatchProfile(
      id: '5',
      name: 'Leila',
      age: 27,
      location: 'Leeds',
      height: "5' 6\" (168 cm)",
      profession: 'Pediatrician',
      company: 'Children Specialist Clinic',
      education: 'MBBS Medicine',
      intent: 'Within 1 Yr',
      matchScore: 91,
      matchTier: 'Strong',
      avatarEmoji: '🧕🏽',
      imagePath: 'assets/images/leila.jpg',
      religiousPractice: 'Very Practicing',
      madhhab: 'Hanafi',
      prayerHabits: '5 Times Daily',
      familyValues: 'Supportive Islamic Family',
      livingArrangement: 'Independent / Flexible',
      childrenPreference: 'Wants Children InshaAllah',
      aboutMe:
          'Doctor passionate about children healthcare. Loves fitness, Islamic seminars, and volunteering.',
      compatibilityReasons: [
        'Aligned education & professional goals',
        'Mutual interest in health and deen',
      ],
      hobbies: ['Fitness', 'Medical Outreach', 'Cooking', 'Arabic Language'],
      tags: ['Doctor / Hafiza', 'Fitness'],
      isPhotoBlurred: false,
      isVerified: true,
    ),
    MatchProfile(
      id: '6',
      name: 'Sumayya',
      age: 24,
      location: 'London',
      height: "5' 3\" (160 cm)",
      profession: 'Designer',
      company: 'Creative Media Agency',
      education: 'BA Graphic Design',
      intent: 'Within 1 Yr',
      matchScore: 88,
      matchTier: 'Good',
      avatarEmoji: '🧕🏻',
      religiousPractice: 'Practicing Muslimah',
      madhhab: 'General Sunni',
      prayerHabits: '5 Times Daily',
      familyValues: 'Close-knit',
      livingArrangement: 'Living with Family',
      childrenPreference: 'Wants Children InshaAllah',
      aboutMe:
          'Creative mind, love Islamic calligraphy, digital painting, and visiting historic mosques.',
      compatibilityReasons: [
        'Creative and cultural synergy',
        'Harmonious lifestyle and values',
      ],
      hobbies: ['Calligraphy', 'Travel', 'Reading', 'Art'],
      tags: ['Art & Deen', 'Reading'],
      isPhotoBlurred: true,
      isVerified: true,
    ),
  ];

  // Universal helper list providing all profiles
  static List<MatchProfile> get sampleMatches => [...soulmates, ...compatibleGrid];
}
