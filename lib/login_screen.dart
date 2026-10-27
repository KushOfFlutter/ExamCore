
import 'package:flutter/material.dart';
import 'main_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'create_account_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  bool obscurePassword = true;
  bool isLoading = false;
  bool rememberMe = true;

  static const Color primaryGreen = Color(0xFF16834A);
  static const Color darkGreen = Color(0xFF105C35);

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.12),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutCubic,
      ),
    );

    _animationController.forward();

    // Load the saved email and Remember Me preference.
    _loadRememberedLogin();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: darkGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }

  // STEP 3: Load the saved email and checkbox preference.
  Future<void> _loadRememberedLogin() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      if (!mounted) return;

      setState(() {
        rememberMe = prefs.getBool('remember_me') ?? true;

        if (rememberMe) {
          emailController.text =
              prefs.getString('remembered_email') ?? '';
        }
      });
    } catch (error) {
      debugPrint('Could not load remembered email: $error');
    }
  }

  // Save the email only. Never save the password.
  Future<void> _saveRememberedLogin() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool('remember_me', rememberMe);

    if (rememberMe) {
      await prefs.setString(
        'remembered_email',
        emailController.text.trim(),
      );
    } else {
      await prefs.remove('remembered_email');
    }
  }

  // Save the checkbox preference when it changes.
  Future<void> _updateRememberMe(bool value) async {
    setState(() {
      rememberMe = value;
    });

    try {
      final prefs = await SharedPreferences.getInstance();

      await prefs.setBool('remember_me', value);

      if (!value) {
        await prefs.remove('remembered_email');
      }
    } catch (error) {
      debugPrint(
        'Could not update Remember Me preference: $error',
      );
    }
  }

  // STEP 4: Log in with Supabase and save the email on success.
  Future<void> _login() async {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => isLoading = true);

    try {
      final email = emailController.text.trim();
      final password = passwordController.text;

      final response =
          await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        // Save or clear the remembered email after successful login.
        // A preference-saving error should not block a valid login.
        try {
          await _saveRememberedLogin();
        } catch (error) {
          debugPrint('Could not save remembered email: $error');
        }

        if (!mounted) return;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const MainScreen(),
          ),
        );
      }
    } on AuthException catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message),
          backgroundColor: Colors.red,
        ),
      );
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Something went wrong: $error'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  InputDecoration _fieldDecoration({
    required String label,
    required IconData icon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: primaryGreen),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: const Color(0xFFF5FAF6),
      labelStyle: const TextStyle(
        color: Color(0xFF68756D),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 19,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(17),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(17),
        borderSide: const BorderSide(
          color: Color(0xFFE3ECE5),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(17),
        borderSide: const BorderSide(
          color: primaryGreen,
          width: 1.5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(17),
        borderSide: const BorderSide(
          color: Colors.redAccent,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(17),
        borderSide: const BorderSide(
          color: Colors.redAccent,
          width: 1.5,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // JAMB background image.
          Image.asset(
            'assets/images/jamb.png',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFE8F7EC),
                      Colors.white,
                      Color(0xFFD2EEDB),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              );
            },
          ),

          // Green-tinted background overlay.
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  darkGreen.withOpacity(0.82),
                  primaryGreen.withOpacity(0.55),
                  darkGreen.withOpacity(0.82),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          SafeArea(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(
                        22,
                        20,
                        22,
                        24,
                      ),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight - 44,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Brand icon.
                            Container(
                              width: 82,
                              height: 82,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(26),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.12),
                                    blurRadius: 24,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.school_rounded,
                                size: 46,
                                color: primaryGreen,
                              ),
                            ),

                            const SizedBox(height: 16),

                            const Text(
                              'ExamCore',
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w900,
                                letterSpacing: -1,
                                color: Colors.white,
                              ),
                            ),

                            const SizedBox(height: 6),

                            const Text(
                              'Learn smarter. Practise better. Succeed.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                letterSpacing: 0.3,
                              ),
                            ),

                            const SizedBox(height: 30),

                            // Login panel.
                            Container(
                              padding: const EdgeInsets.all(23),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.97),
                                borderRadius: BorderRadius.circular(28),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.8),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 30,
                                    offset: const Offset(0, 12),
                                  ),
                                ],
                              ),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Welcome back 👋',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xFF183D29),
                                      ),
                                    ),

                                    const SizedBox(height: 7),

                                    const Text(
                                      'Sign in and continue your learning journey.',
                                      style: TextStyle(
                                        color: Color(0xFF738077),
                                        fontSize: 13,
                                      ),
                                    ),

                                    const SizedBox(height: 25),

                                    // Email field.
                                    TextFormField(
                                      controller: emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      autofillHints: const [
                                        AutofillHints.email,
                                      ],
                                      decoration: _fieldDecoration(
                                        label: 'Email address',
                                        icon: Icons.email_outlined,
                                      ),
                                      validator: (value) {
                                        final email = value?.trim() ?? '';

                                        if (email.isEmpty) {
                                          return 'Please enter your email';
                                        }

                                        if (!RegExp(
                                          r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                                        ).hasMatch(email)) {
                                          return 'Enter a valid email address';
                                        }

                                        return null;
                                      },
                                    ),

                                    const SizedBox(height: 17),

                                    // Password field.
                                    TextFormField(
                                      controller: passwordController,
                                      obscureText: obscurePassword,
                                      textInputAction: TextInputAction.done,
                                      autofillHints: const [
                                        AutofillHints.password,
                                      ],
                                      onFieldSubmitted: (_) => _login(),
                                      decoration: _fieldDecoration(
                                        label: 'Password',
                                        icon: Icons.lock_outline_rounded,
                                        suffixIcon: IconButton(
                                          tooltip: obscurePassword
                                              ? 'Show password'
                                              : 'Hide password',
                                          onPressed: () {
                                            setState(() {
                                              obscurePassword =
                                                  !obscurePassword;
                                            });
                                          },
                                          icon: Icon(
                                            obscurePassword
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: primaryGreen,
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your password';
                                        }

                                        if (value.length < 6) {
                                          return 'Password must be at least 6 characters';
                                        }

                                        return null;
                                      },
                                    ),

                                    const SizedBox(height: 10),

                                    // Remember Me and Forgot Password.
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 28,
                                          height: 40,
                                          child: Checkbox(
                                            value: rememberMe,
                                            activeColor: primaryGreen,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize.shrinkWrap,
                                            onChanged: (value) {
                                              _updateRememberMe(value ?? false);
                                            },
                                          ),
                                        ),

                                        const SizedBox(width: 7),

                                        const Expanded(
                                          child: Text(
                                            'Remember me',
                                            style: TextStyle(
                                              color: Color(0xFF738077),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),

                                        TextButton(
                                          onPressed: () {
                                            _showMessage(
                                              'We will add password recovery next.',
                                            );
                                          },
                                          style: TextButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 4,
                                              vertical: 8,
                                            ),
                                            minimumSize: Size.zero,
                                            tapTargetSize:
                                                MaterialTapTargetSize.shrinkWrap,
                                          ),
                                          child: const Text(
                                            'Forgot password?',
                                            style: TextStyle(
                                              color: primaryGreen,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 12),

                                    // Login button.
                                    SizedBox(
                                      width: double.infinity,
                                      height: 57,
                                      child: ElevatedButton(
                                        onPressed:
                                            isLoading ? null : _login,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: primaryGreen,
                                          foregroundColor: Colors.white,
                                          disabledBackgroundColor:
                                              primaryGreen.withOpacity(0.7),
                                          elevation: 5,
                                          shadowColor:
                                              primaryGreen.withOpacity(0.3),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(17),
                                          ),
                                        ),
                                        child: AnimatedSwitcher(
                                          duration:
                                              const Duration(milliseconds: 250),
                                          child: isLoading
                                              ? const SizedBox(
                                                  key: ValueKey('loading'),
                                                  height: 23,
                                                  width: 23,
                                                  child:
                                                      CircularProgressIndicator(
                                                    strokeWidth: 2.5,
                                                    color: Colors.white,
                                                  ),
                                                )
                                              : const Row(
                                                  key: ValueKey('login'),
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'LOGIN',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        letterSpacing: 1,
                                                      ),
                                                    ),
                                                    SizedBox(width: 10),
                                                    Icon(
                                                      Icons.arrow_forward_rounded,
                                                      size: 21,
                                                    ),
                                                  ],
                                                ),
                                        ),
                                      ),
                                    ),

                                    const SizedBox(height: 19),

                                    // Create Account.
                                    Center(
                                      child: Wrap(
                                        alignment: WrapAlignment.center,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: [
                                          const Text(
                                            'New to ExamCore? ',
                                            style: TextStyle(
                                              color: Color(0xFF738077),
                                            ),
                                          ),

                                          TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (_) =>
                                                      const CreateAccountScreen(),
                                                ),
                                              );
                                            },
                                            style: TextButton.styleFrom(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 4,
                                              ),
                                              minimumSize: Size.zero,
                                              tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                            ),
                                            child: const Text(
                                              'Create account',
                                              style: TextStyle(
                                                color: primaryGreen,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(height: 22),

                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.verified_user_outlined,
                                  color: Colors.white,
                                  size: 16,
                                ),
                                SizedBox(width: 7),
                                Text(
                                  'Your journey to a better JAMB score',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
