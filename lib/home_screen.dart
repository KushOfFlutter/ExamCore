import 'package:flutter/material.dart';
import 'package:flutter_pract/profile_screen.dart';
import 'noification_screen.dart';
import 'notes_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int xp = 0;
  int quizCompleted = 0;
  double accuracy = 0;
  int currentStreak = 0;
  bool isLoading = true;

  static const Color green = Color(0xFF16A34A);
  static const Color darkGreen = Color(0xFF166534);
  static const Color background = Color(0xFFF7F9FC);
  static const Color textDark = Color(0xFF172033);
  static const Color textMuted = Color(0xFF7B8495);

  bool get isDarkMode =>
      Theme.of(context).brightness == Brightness.dark;

  Color get pageBackground =>
      isDarkMode ? const Color(0xFF121212) : background;

  Color get cardBackground =>
      isDarkMode ? const Color(0xFF1E1E1E) : Colors.white;

  Color get primaryTextColor =>
      isDarkMode ? const Color(0xFFF5F5F5) : textDark;

  Color get secondaryTextColor =>
      isDarkMode ? const Color(0xFFB8C0CC) : textMuted;

  Color get cardBorderColor =>
      isDarkMode ? const Color(0xFF383838) : const Color(0xFFE8EDF2);

  Color get softGreenBackground =>
      isDarkMode ? const Color(0xFF183B27) : const Color(0xFFE7F8EC);

  Color get softBlueBackground =>
      isDarkMode ? const Color(0xFF1C2B42) : const Color(0xFFE9F2FF);

  Color get softPinkBackground =>
      isDarkMode ? const Color(0xFF40232D) : const Color(0xFFFFEAF0);

  Color get softYellowBackground =>
      isDarkMode ? const Color(0xFF3D321A) : const Color(0xFFFFF8E7);

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final user = Supabase.instance.client.auth.currentUser;

    if (user == null) {
      if (mounted) setState(() => isLoading = false);
      return;
    }

    try {
      final profile = await Supabase.instance.client
          .from('profiles')
          .select('xp, quiz_completed, accuracy, current_streak')
          .eq('id', user.id)
          .maybeSingle();

      if (!mounted) return;

      setState(() {
        if (profile != null) {
          xp = profile['xp'] ?? 0;
          quizCompleted = profile['quiz_completed'] ?? 0;
          accuracy = (profile['accuracy'] ?? 0).toDouble();
          currentStreak = profile['current_streak'] ?? 0;
        }
        isLoading = false;
      });
    } catch (e) {
      debugPrint('Error loading profile: $e');
      if (mounted) setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackground,
      appBar: AppBar(
        backgroundColor: pageBackground,
        foregroundColor: primaryTextColor,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu_rounded),
          onPressed: () => _showMenu(context),
        ),
        title: Row(
          children: [
            Container(
              height: 38,
              width: 38,
              decoration: BoxDecoration(
                color: green,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.school_rounded,
                color: Colors.white,
                size: 23,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Exam Core',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: primaryTextColor,
                  ),
                ),
                Text(
                  'YOUR JAMB COMPANION',
                  style: TextStyle(
                    fontSize: 9,
                    letterSpacing: 1.1,
                    color: secondaryTextColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Notifications',
            icon: const Icon(Icons.notifications_none_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const NotificationScreen(),
                ),
              );
            },
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(18, 10, 18, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, Candidate 👋',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  color: primaryTextColor,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Ready to get closer to your dream score?',
                style: TextStyle(
                  fontSize: 14,
                  color: secondaryTextColor,
                ),
              ),
              const SizedBox(height: 22),

              // STREAK AND XP
              Row(
                children: [
                  Expanded(
                    child: _miniInfoCard(
                      icon: Icons.local_fire_department_rounded,
                      iconColor: const Color(0xFFFF7A30),
                      title: '$currentStreak Day Streak',
                      subtitle: 'Keep it going!',
                      backgroundColor: isDarkMode
                          ? const Color(0xFF3B281F)
                          : const Color(0xFFFFF1E8),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _miniInfoCard(
                      icon: Icons.bolt_rounded,
                      iconColor: const Color(0xFFAA8AFF),
                      title: '$xp XP',
                      subtitle: 'Level ${(xp ~/ 250) + 1} learner',
                      backgroundColor: isDarkMode
                          ? const Color(0xFF302448)
                          : const Color(0xFFF0EAFF),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),

              // HERO BANNER
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF15803D), Color(0xFF22C55E)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: green.withOpacity(0.18),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -8,
                      top: 5,
                      child: Icon(
                        Icons.rocket_launch_rounded,
                        size: 100,
                        color: Colors.white.withOpacity(0.14),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 11,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.18),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Text(
                            'YOUR JAMB JOURNEY 🚀',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        const SizedBox(height: 17),
                        const Text(
                          'Practice Today,\nAce Tomorrow!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 27,
                            height: 1.15,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Small steps every day lead to big results.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () => _showMessage(
                            context,
                            'Choose a subject below to begin practicing.',
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 17,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Start Practicing',
                                  style: TextStyle(
                                    color: darkGreen,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Icon(
                                  Icons.arrow_forward_rounded,
                                  color: darkGreen,
                                  size: 17,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // TARGET SCORE
              _sectionHeading(
                'Your JAMB Target',
                'Edit in Profile',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ProfileScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 13),
              Container(
                padding: const EdgeInsets.all(18),
                decoration: _cardDecoration(),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            color: softGreenBackground,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Icon(
                            Icons.flag_rounded,
                            color: green,
                            size: 27,
                          ),
                        ),
                        const SizedBox(width: 13),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Target Score',
                                style: TextStyle(
                                  color: secondaryTextColor,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '320 / 400',
                                style: TextStyle(
                                  fontSize: 23,
                                  color: primaryTextColor,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            color: softGreenBackground,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            '80%',
                            style: TextStyle(
                              color: isDarkMode
                                  ? const Color(0xFF86EFAC)
                                  : darkGreen,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: const LinearProgressIndicator(
                        value: 0.80,
                        minHeight: 9,
                        backgroundColor: Color(0xFFE9F0E9),
                        valueColor:
                            AlwaysStoppedAnimation<Color>(green),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Stay consistent and work towards your goal.',
                        style: TextStyle(
                          color: secondaryTextColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // CONTINUE PRACTICE
              _sectionHeading('Continue Practice', 'Resume'),
              const SizedBox(height: 13),
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () => _showMessage(
                  context,
                  'Your last practice session will appear here once quiz progress is saved.',
                ),
                child: Container(
                  padding: const EdgeInsets.all(17),
                  decoration: _cardDecoration(),
                  child: Row(
                    children: [
                      Container(
                        height: 58,
                        width: 58,
                        decoration: BoxDecoration(
                          color: softBlueBackground,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(
                          Icons.menu_book_rounded,
                          color: Color(0xFF3478F6),
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pick up where you left off',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 14,
                                color: primaryTextColor,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Continue your JAMB preparation',
                              style: TextStyle(
                                fontSize: 12,
                                color: secondaryTextColor,
                              ),
                            ),
                            const SizedBox(height: 9),
                            const Text(
                              'Open practice  →',
                              style: TextStyle(
                                color: Color(0xFF5795FF),
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 28),

              // DAILY CHALLENGE
              _sectionHeading('Daily Challenge', 'Build your streak'),
              const SizedBox(height: 13),
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: softYellowBackground,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isDarkMode
                        ? const Color(0xFF5B4920)
                        : const Color(0xFFFFE7AE),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        color: isDarkMode
                            ? const Color(0xFF55431B)
                            : const Color(0xFFFFE8A8),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(
                        Icons.emoji_events_rounded,
                        color: Color(0xFFB77908),
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Answer 20 Questions',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                              color: primaryTextColor,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Complete today’s challenge to earn XP.',
                            style: TextStyle(
                              color: secondaryTextColor,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 9),
                          const Text(
                            '+50 XP reward',
                            style: TextStyle(
                              color: Color(0xFFB77908),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => _showMessage(
                        context,
                        'Select a subject below to start your challenge.',
                      ),
                      icon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Color(0xFFB77908),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // SUBJECTS
              _sectionHeading('Practice by Subject', '8 subjects'),
              const SizedBox(height: 6),
              Text(
                'Choose a subject and sharpen your skills.',
                style: TextStyle(
                  color: secondaryTextColor,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 16),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 13,
                mainAxisSpacing: 13,
                childAspectRatio: 1.23,
                children: [
                  _subjectCard(
                    'Mathematics',
                    'Calculations & numbers',
                    Icons.calculate_rounded,
                    const Color(0xFF7856D8),
                    const Color(0xFFF0EBFF),
                  ),
                  _subjectCard(
                    'English',
                    'Grammar & comprehension',
                    Icons.menu_book_rounded,
                    const Color(0xFFE14D72),
                    const Color(0xFFFFEAF0),
                  ),
                  _subjectCard(
                    'Physics',
                    'Matter & energy',
                    Icons.science_rounded,
                    const Color(0xFF3478F6),
                    const Color(0xFFE8F1FF),
                  ),
                  _subjectCard(
                    'Chemistry',
                    'Elements & reactions',
                    Icons.biotech_rounded,
                    const Color(0xFFE58A22),
                    const Color(0xFFFFF1DF),
                  ),
                  _subjectCard(
                    'Biology',
                    'Life & living things',
                    Icons.eco_rounded,
                    const Color(0xFF159D83),
                    const Color(0xFFE2F8F1),
                  ),
                  _subjectCard(
                    'Economics',
                    'Markets & resources',
                    Icons.bar_chart_rounded,
                    const Color(0xFFBB8A0A),
                    const Color(0xFFFFF5D8),
                  ),
                  _subjectCard(
                    'Government',
                    'Politics & governance',
                    Icons.account_balance_rounded,
                    const Color(0xFF8B6546),
                    const Color(0xFFF4EADF),
                  ),
                  _subjectCard(
                    'Literature',
                    'Books & literary works',
                    Icons.auto_stories_rounded,
                    const Color(0xFF607D8B),
                    const Color(0xFFEAF0F3),
                  ),
                ],
              ),
              const SizedBox(height: 28),

              // PERFORMANCE
              _sectionHeading('Your Performance', 'View Profile'),
              const SizedBox(height: 13),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.65,
                children: [
                  _performanceCard(
                    'Questions Answered',
                    '1,240',
                    Icons.quiz_rounded,
                    const Color(0xFF3478F6),
                  ),
                  _performanceCard(
                    'Accuracy',
                    '${accuracy.toStringAsFixed(0)}%',
                    Icons.track_changes_rounded,
                    green,
                  ),
                  _performanceCard(
                    'Quizzes Completed',
                    '$quizCompleted',
                    Icons.task_alt_rounded,
                    const Color(0xFF8155E8),
                  ),
                  _performanceCard(
                    'Current Streak',
                    '$currentStreak days',
                    Icons.local_fire_department_rounded,
                    const Color(0xFFFF7A30),
                  ),
                ],
              ),
              const SizedBox(height: 18),

              // WEAK TOPIC RECOMMENDATION
              Container(
                padding: const EdgeInsets.all(18),
                decoration: _cardDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 42,
                          width: 42,
                          decoration: BoxDecoration(
                            color: softPinkBackground,
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: const Icon(
                            Icons.lightbulb_rounded,
                            color: Color(0xFFE14D72),
                            size: 23,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Smart Study Recommendation',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: primaryTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Focus on your weak topics',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: primaryTextColor,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      'Revisit difficult questions and practise topics you find challenging. Your actual weak topics can be shown here once quiz results are tracked.',
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.5,
                        color: secondaryTextColor,
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () => _showMessage(
                          context,
                          'Topic recommendations will be based on your saved quiz results.',
                        ),
                        icon: const Icon(Icons.auto_awesome_rounded),
                        label: const Text('Explore Recommendations'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: isDarkMode
                              ? const Color(0xFF86EFAC)
                              : green,
                          side: const BorderSide(color: green),
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              // MOTIVATION CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: softGreenBackground,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.stars_rounded,
                      color: green,
                      size: 37,
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Every question counts!',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: isDarkMode
                                  ? const Color(0xFF86EFAC)
                                  : darkGreen,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Stay consistent. Your future is worth the effort.',
                            style: TextStyle(
                              color: isDarkMode
                                  ? const Color(0xFFB7E4C7)
                                  : darkGreen,
                              fontSize: 12,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: cardBackground,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: cardBorderColor),
    );
  }

  Widget _subjectCard(
    String title,
    String subtitle,
    IconData icon,
    Color color,
    Color paleColor,
  ) {
    final iconBackground = isDarkMode
        ? Color.lerp(paleColor, Colors.black, 0.65)!
        : paleColor;

    return InkWell(
      borderRadius: BorderRadius.circular(19),
      onTap: () {
        _showMessage(
          context,
          '$title selected. Connect this card to your quiz screen to begin.',
        );
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: cardBackground,
          borderRadius: BorderRadius.circular(19),
          border: Border.all(color: cardBorderColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 43,
              width: 43,
              decoration: BoxDecoration(
                color: iconBackground,
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(icon, color: color, size: 25),
            ),
            const Spacer(),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: primaryTextColor,
                fontWeight: FontWeight.w800,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              subtitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: secondaryTextColor,
                fontSize: 10,
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _performanceCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          Icon(icon, color: color, size: 25),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 19,
                    color: primaryTextColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10,
                    color: secondaryTextColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _miniInfoCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required Color backgroundColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 28),
          const SizedBox(width: 9),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: isDarkMode
                        ? Colors.white
                        : textDark,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: isDarkMode
                        ? const Color(0xFFD0D0D0)
                        : textMuted,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionHeading(
    String title,
    String action, {
    VoidCallback? onTap,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              color: primaryTextColor,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        if (action.isNotEmpty)
          InkWell(
            onTap: onTap,
            child: Text(
              action,
              style: const TextStyle(
                color: green,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
      ],
    );
  }

  // THEME-AWARE MENU BOTTOM SHEET
  void _showMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 12, 22, 25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 45,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Theme.of(sheetContext)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.25),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 23),
                Text(
                  'Your Menu',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(sheetContext)
                        .colorScheme
                        .onSurface,
                  ),
                ),
                const SizedBox(height: 18),
                _menuTile(
                  sheetContext,
                  icon: Icons.person_rounded,
                  title: 'My Profile',
                  subtitle: 'Goals, XP and performance',
                  onTap: () {
                    Navigator.pop(sheetContext);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ProfileScreen(),
                      ),
                    );
                  },
                ),
                _menuTile(
                  sheetContext,
                  icon: Icons.lightbulb_outline_rounded,
                  title: 'Study Tips',
                  subtitle: 'Make your study sessions count',
                  onTap: () {
                    Navigator.pop(sheetContext);
                    _showMessage(context, 'Study tips will be added here.');
                  },
                ),
                _menuTile(
                  sheetContext,
                  icon: Icons.bookmark_outline_rounded,
                  title: 'Saved Questions',
                  subtitle: 'Review questions for later',
                  onTap: () {
                    Navigator.pop(sheetContext);
                    _showMessage(
                      context,
                      'Saved questions will be available when bookmarking is connected.',
                    );
                  },
                ),
                _menuTile(
                  sheetContext,
                  icon: Icons.support_agent_rounded,
                  title: 'Support',
                  subtitle: 'Get help with Exam Core',
                  onTap: () {
                    Navigator.pop(sheetContext);
                    _showMessage(
                      context,
                      'Support information will be added here.',
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _menuTile(
    BuildContext sheetContext, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    final colors = Theme.of(sheetContext).colorScheme;
    final dark = Theme.of(sheetContext).brightness == Brightness.dark;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 3),
      leading: Container(
        height: 46,
        width: 46,
        decoration: BoxDecoration(
          color: dark
              ? const Color(0xFF183B27)
              : const Color(0xFFE7F8EC),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Icon(icon, color: green),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 14,
          color: colors.onSurface,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 11,
          color: colors.onSurfaceVariant,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 15,
        color: colors.onSurfaceVariant,
      ),
      onTap: onTap,
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 3),
        ),
      );
  }
}
