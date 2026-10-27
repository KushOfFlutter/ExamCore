
import 'package:flutter/material.dart';
import 'package:flutter_pract/theme_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static const Color green = Color(0xFF16834A);
  static const Color darkGreen = Color(0xFF105C35);
  static const Color pageBg = Color(0xFFF5F8F6);
  static const Color purple = Color(0xFF8057C8);
  static const Color orange = Color(0xFFE9942D);
  static const Color blue = Color(0xFF3979D8);
  static const Color teal = Color(0xFF168F91);
  static const Color pink = Color(0xFFD85D86);

  String username = 'Enter Name';
  String email = 'Enter Email';
  String profession = 'JAMB Aspirant';

  bool darkMode = false;
  int targetScore = 320;
  int dailyQuestionGoal = 40;

  // Demo values until connected to actual quiz results.
  int totalQuestions = 1240;
  int quizzesCompleted = 28;
  int currentStreak = 7;
  int bestStreak = 12;
  int xp = 850;
  int level = 4;
  double accuracy = 78;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final professionController = TextEditingController();
  final targetController = TextEditingController();
  final dailyGoalController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  // Load saved profile and apply the theme globally.
  Future<void> loadProfile() async {
    final prefs = await SharedPreferences.getInstance();

    if (!mounted) return;

    final savedDarkMode = prefs.getBool('darkMode') ?? false;

    appThemeMode.value =
        savedDarkMode ? ThemeMode.dark : ThemeMode.light;

    setState(() {
      username = prefs.getString('username') ?? 'Enter Name';
      email = prefs.getString('email') ?? 'Enter Email';
      profession =
          prefs.getString('profession') ?? 'JAMB Aspirant';
      darkMode = savedDarkMode;
      targetScore = prefs.getInt('targetScore') ?? 320;
      dailyQuestionGoal =
          prefs.getInt('dailyQuestionGoal') ?? 40;
    });
  }

  Future<void> saveProfile() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('username', username);
    await prefs.setString('email', email);
    await prefs.setString('profession', profession);
    await prefs.setBool('darkMode', darkMode);
    await prefs.setInt('targetScore', targetScore);
    await prefs.setInt('dailyQuestionGoal', dailyQuestionGoal);
  }

  // Toggle global theme and persist the selection.
  Future<void> toggleDarkMode(bool value) async {
    setState(() {
      darkMode = value;
    });

    appThemeMode.value =
        value ? ThemeMode.dark : ThemeMode.light;

    await saveProfile();
  }

  void editProfile() {
    nameController.text =
        username == 'Enter Name' ? '' : username;
    emailController.text =
        email == 'Enter Email' ? '' : email;
    professionController.text = profession;

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        title: const Text(
          'Edit profile',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _dialogField(
                nameController,
                'Full name',
                Icons.person_outline,
              ),
              const SizedBox(height: 12),
              _dialogField(
                emailController,
                'Email address',
                Icons.mail_outline,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 12),
              _dialogField(
                professionController,
                'Student status',
                Icons.school_outlined,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: green,
            ),
            onPressed: () async {
              final newName = nameController.text.trim();
              final newEmail = emailController.text.trim();

              if (newName.isEmpty || newEmail.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Please enter your name and email.',
                    ),
                  ),
                );
                return;
              }

              setState(() {
                username = newName;
                email = newEmail;
                profession =
                    professionController.text.trim().isEmpty
                        ? 'JAMB Aspirant'
                        : professionController.text.trim();
              });

              await saveProfile();

              if (dialogContext.mounted) {
                Navigator.pop(dialogContext);
              }
            },
            child: const Text('Save changes'),
          ),
        ],
      ),
    );
  }

  Widget _dialogField(
    TextEditingController controller,
    String label,
    IconData icon, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: const Icon(Icons.edit, color: green),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ).copyWith(
        prefixIcon: Icon(icon, color: green),
      ),
    );
  }

  void editStudyGoals() {
    targetController.text = targetScore.toString();
    dailyGoalController.text = dailyQuestionGoal.toString();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        title: const Text(
          'Study goals',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _dialogField(
              targetController,
              'JAMB target score (0–400)',
              Icons.flag_outlined,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            _dialogField(
              dailyGoalController,
              'Daily question goal',
              Icons.track_changes,
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: green,
            ),
            onPressed: () async {
              final target =
                  int.tryParse(targetController.text.trim());
              final daily =
                  int.tryParse(dailyGoalController.text.trim());

              if (target == null ||
                  target < 0 ||
                  target > 400 ||
                  daily == null ||
                  daily < 1) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Enter a target from 0–400 and a daily goal above 0.',
                    ),
                  ),
                );
                return;
              }

              setState(() {
                targetScore = target;
                dailyQuestionGoal = daily;
              });

              await saveProfile();

              if (dialogContext.mounted) {
                Navigator.pop(dialogContext);
              }
            },
            child: const Text('Save goals'),
          ),
        ],
      ),
    );
  }

  void showInfo(String title, String message) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(26),
        ),
      ),
      builder: (sheetContext) => Padding(
        padding: const EdgeInsets.fromLTRB(22, 8, 22, 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              message,
              style: TextStyle(
                fontSize: 14,
                height: 1.5,
                color: Theme.of(sheetContext)
                    .colorScheme
                    .onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: green,
                ),
                onPressed: () => Navigator.pop(sheetContext),
                child: const Text('Got it'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    professionController.dispose();
    targetController.dispose();
    dailyGoalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bg =
        darkMode ? const Color(0xFF111A15) : pageBg;
    final card =
        darkMode ? const Color(0xFF1B2820) : Colors.white;
    final mainText =
        darkMode ? Colors.white : const Color(0xFF1D2A22);
    final mutedText =
        darkMode ? Colors.white70 : const Color(0xFF78847C);

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(18, 14, 18, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'MY SPACE',
                          style: TextStyle(
                            color: green,
                            fontSize: 11,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Profile',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            color: mainText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Material(
                    color: card,
                    borderRadius: BorderRadius.circular(15),
                    child: IconButton(
                      tooltip: 'Edit profile',
                      onPressed: editProfile,
                      icon: const Icon(
                        Icons.edit_rounded,
                        color: green,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              _profileHero(),
              const SizedBox(height: 22),

              _sectionTitle(
                'Your progress',
                'A little progress every day adds up.',
                mainText,
                mutedText,
              ),
              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: _statCard(
                      Icons.bolt_rounded,
                      '$xp',
                      'Total XP',
                      purple,
                      card,
                      mainText,
                      mutedText,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _statCard(
                      Icons.local_fire_department_rounded,
                      '$currentStreak days',
                      'Current streak',
                      orange,
                      card,
                      mainText,
                      mutedText,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: _statCard(
                      Icons.quiz_outlined,
                      '$quizzesCompleted',
                      'Quizzes done',
                      blue,
                      card,
                      mainText,
                      mutedText,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _statCard(
                      Icons.check_circle_outline_rounded,
                      '${accuracy.toInt()}%',
                      'Accuracy',
                      teal,
                      card,
                      mainText,
                      mutedText,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 22),
              _sectionTitle(
                'JAMB target',
                'Your goal, your pace.',
                mainText,
                mutedText,
                trailing: TextButton.icon(
                  onPressed: editStudyGoals,
                  icon: const Icon(Icons.tune_rounded, size: 17),
                  label: const Text('Edit'),
                  style: TextButton.styleFrom(
                    foregroundColor: green,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF16834A),
                      Color(0xFF20A66A),
                      Color(0xFF168F91),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: green.withOpacity(.16),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'TARGET SCORE',
                            style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1.3,
                              fontSize: 11,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.18),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'UTME / 400',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 7),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '$targetScore',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 38,
                            height: 1.1,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            bottom: 5,
                            left: 5,
                          ),
                          child: Text(
                            '/ 400',
                            style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: LinearProgressIndicator(
                        value: targetScore / 400,
                        minHeight: 8,
                        backgroundColor:
                            Colors.white.withOpacity(.24),
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(
                          Color(0xFFFFD166),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '$dailyQuestionGoal questions planned each day • '
                      'Best streak: $bestStreak days',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),
              _sectionTitle(
                'Level & achievements',
                'Keep showing up and earn your next milestone.',
                mainText,
                mutedText,
              ),
              const SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: card,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1E8FF),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Icon(
                            Icons.workspace_premium_rounded,
                            color: purple,
                            size: 27,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Level $level Scholar',
                                style: TextStyle(
                                  color: mainText,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '${xp % 250}/250 XP to next level',
                                style: TextStyle(
                                  color: mutedText,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.auto_awesome_rounded,
                          color: orange,
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: LinearProgressIndicator(
                        value: (xp % 250) / 250,
                        minHeight: 8,
                        backgroundColor: darkMode
                            ? Colors.white12
                            : const Color(0xFFE9EFEA),
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(
                          purple,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: _badge(
                            Icons.flag_rounded,
                            'Goal setter',
                            const Color(0xFFE2F4E8),
                            green,
                            mainText,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _badge(
                            Icons.local_fire_department_rounded,
                            'On fire',
                            const Color(0xFFFFEBD5),
                            orange,
                            mainText,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _badge(
                            Icons.bolt_rounded,
                            'Quick learner',
                            const Color(0xFFE9E2FF),
                            purple,
                            mainText,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),
              _sectionTitle(
                'Study activity',
                'Your learning journey at a glance.',
                mainText,
                mutedText,
              ),
              const SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: card,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '$totalQuestions questions answered',
                            style: TextStyle(
                              color: mainText,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 9,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE0F5E9),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'IN TOTAL',
                            style: TextStyle(
                              color: green,
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: List.generate(7, (index) {
                        final heights = [
                          26.0, 42.0, 32.0, 55.0,
                          38.0, 48.0, 62.0,
                        ];
                        const labels = [
                          'M', 'T', 'W', 'T', 'F', 'S', 'S',
                        ];

                        return Expanded(
                          child: Column(
                            children: [
                              Container(
                                height: heights[index],
                                width: 18,
                                decoration: BoxDecoration(
                                  color: index == 6
                                      ? green
                                      : green.withOpacity(
                                          .13 + index * .09,
                                        ),
                                  borderRadius:
                                      BorderRadius.circular(7),
                                ),
                              ),
                              const SizedBox(height: 7),
                              Text(
                                labels[index],
                                style: TextStyle(
                                  fontSize: 11,
                                  color: mutedText,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Weekly activity preview',
                      style: TextStyle(
                        color: mutedText,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),
              _sectionTitle(
                'Account & preferences',
                'Make Exam Core work for you.',
                mainText,
                mutedText,
              ),
              const SizedBox(height: 10),

              Container(
                decoration: BoxDecoration(
                  color: card,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  children: [
                    _settingsTile(
                      Icons.person_outline_rounded,
                      'Edit profile',
                      'Update your personal details',
                      green,
                      mainText,
                      onTap: editProfile,
                    ),
                    _tileDivider(darkMode),
                    _settingsTile(
                      Icons.flag_outlined,
                      'Study goals',
                      'Set your target and daily questions',
                      blue,
                      mainText,
                      onTap: editStudyGoals,
                    ),
                    _tileDivider(darkMode),
                    _settingsTile(
                      Icons.notifications_none_rounded,
                      'Notifications',
                      'Study reminders and updates',
                      orange,
                      mainText,
                      onTap: () => showInfo(
                        'Notifications',
                        'Notification preferences will be connected '
                        'when reminders are implemented.',
                      ),
                    ),
                    _tileDivider(darkMode),
                    _settingsTile(
                      Icons.bookmark_border_rounded,
                      'Saved questions',
                      'Review questions you bookmarked',
                      purple,
                      mainText,
                      onTap: () => showInfo(
                        'Saved questions',
                        'Your bookmarked questions will appear here '
                        'once bookmarking is connected to the quiz screen.',
                      ),
                    ),
                    _tileDivider(darkMode),
                    _settingsTile(
                      Icons.privacy_tip_outlined,
                      'Privacy & help',
                      'Privacy information and support',
                      teal,
                      mainText,
                      onTap: () => showInfo(
                        'Privacy & help',
                        'Your profile and study goals are stored locally '
                        'on this device using SharedPreferences. '
                        'Cloud sync is not enabled yet.',
                      ),
                    ),
                    _tileDivider(darkMode),

                    // Global dark mode switch.
                    SwitchListTile(
                      value: darkMode,
                      activeColor: green,
                      secondary: Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEAEFF5),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(
                          Icons.dark_mode_outlined,
                          color: Color(0xFF52657A),
                        ),
                      ),
                      title: Text(
                        'Dark appearance',
                        style: TextStyle(
                          color: mainText,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      subtitle: Text(
                        'Apply dark mode throughout Exam Core',
                        style: TextStyle(
                          color: mutedText,
                          fontSize: 12,
                        ),
                      ),
                      onChanged: toggleDarkMode,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () => showInfo(
                    'Sign out',
                    'Authentication is not connected yet, '
                    'so sign out is currently unavailable.',
                  ),
                  icon: const Icon(Icons.logout_rounded),
                  label: const Text('Sign out'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: pink,
                    side: BorderSide(
                      color: pink.withOpacity(.45),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 14),

              Center(
                child: Text(
                  'EXAM CORE  •  KEEP LEARNING',
                  style: TextStyle(
                    color: mutedText,
                    fontSize: 10,
                    letterSpacing: 1.6,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileHero() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF105C35),
            Color(0xFF16834A),
            Color(0xFF20A66A),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: green.withOpacity(.18),
            blurRadius: 20,
            offset: const Offset(0, 9),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -22,
            top: -24,
            child: Icon(
              Icons.auto_awesome_rounded,
              size: 112,
              color: Colors.white.withOpacity(.08),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.2),
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      radius: 34,
                      backgroundColor: Colors.white,
                      child: Text(
                        username.trim().isNotEmpty &&
                                username != 'Enter Name'
                            ? username.trim()[0].toUpperCase()
                            : 'S',
                        style: const TextStyle(
                          color: green,
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          username,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          email,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 9),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.17),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            profession,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),
              const Text(
                'YOUR NEXT CHAPTER STARTS TODAY',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 10,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Learn a little. Improve a lot.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(
    String title,
    String subtitle,
    Color mainText,
    Color mutedText, {
    Widget? trailing,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: mainText,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 11,
                  color: mutedText,
                ),
              ),
            ],
          ),
        ),
        if (trailing != null) trailing,
      ],
    );
  }

  Widget _statCard(
    IconData icon,
    String value,
    String label,
    Color accent,
    Color card,
    Color mainText,
    Color mutedText,
  ) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: accent.withOpacity(.12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: accent.withOpacity(.12),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(icon, color: accent, size: 21),
          ),
          const SizedBox(height: 13),
          Text(
            value,
            style: TextStyle(
              color: mainText,
              fontWeight: FontWeight.w900,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: TextStyle(
              color: mutedText,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _badge(
    IconData icon,
    String label,
    Color bg,
    Color accent,
    Color mainText,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 11,
        horizontal: 5,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Icon(icon, color: accent, size: 23),
          const SizedBox(height: 6),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: mainText,
              fontSize: 10,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _settingsTile(
    IconData icon,
    String title,
    String subtitle,
    Color accent,
    Color mainText, {
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      onTap: onTap,
      leading: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: accent.withOpacity(.12),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Icon(icon, color: accent),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: mainText,
          fontWeight: FontWeight.w800,
          fontSize: 14,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: darkMode
              ? Colors.white60
              : const Color(0xFF87928A),
          fontSize: 11,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right_rounded,
        color: darkMode
            ? Colors.white54
            : const Color(0xFF9AA59D),
      ),
    );
  }

  Widget _tileDivider(bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(left: 72),
      child: Divider(
        height: 1,
        color: isDark
            ? Colors.white10
            : const Color(0xFFEEF2EF),
      ),
    );
  }
}
