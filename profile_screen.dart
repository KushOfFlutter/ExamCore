import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // ================= USER DATA =================
  String username = "Enter Name";
  String email = "Enter Email";
  String profession = "JAMB Aspirant";

  bool darkMode = false;

  // ================= CONTROLLERS =================
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController professionController = TextEditingController();

  // ================= INIT =================
  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  // ================= LOAD PROFILE =================
  Future<void> loadProfile() async {
    final prefs = await SharedPreferences.getInstance();

    if (!mounted) return;

    setState(() {
      username = prefs.getString("username") ?? "Enter Name";
      email = prefs.getString("email") ?? "Enter Email";
      profession = prefs.getString("profession") ?? "JAMB Aspirant";
      darkMode = prefs.getBool("darkMode") ?? false;
    });
  }

  // ================= SAVE PROFILE =================
  Future<void> saveProfile() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("username", username);
    await prefs.setString("email", email);
    await prefs.setString("profession", profession);
    await prefs.setBool("darkMode", darkMode);
  }

  // ================= EDIT PROFILE =================
  void editProfile() {
    nameController.text = username;
    emailController.text = email;
    professionController.text = profession;

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text("Edit Profile"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Full Name",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: professionController,
                  decoration: const InputDecoration(
                    labelText: "Profession",
                    prefixIcon: Icon(Icons.work),
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () async {
                final newName = nameController.text.trim();
                final newEmail = emailController.text.trim();
                final newProfession = professionController.text.trim();

                if (newName.isEmpty || newEmail.isEmpty) return;

                setState(() {
                  username = newName;
                  email = newEmail;
                  profession = newProfession;
                });

                await saveProfile();

                if (!mounted) return;
                Navigator.pop(dialogContext);
              },
              child: const Text(
                "Save",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  // ================= DISPOSE =================
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    professionController.dispose();
    super.dispose();
  }

  // ================= UI =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: editProfile,
                    icon: const Icon(Icons.edit, color: Colors.green),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // PROFILE CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person,
                          size: 60, color: Colors.green),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      username,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      email,
                      style: const TextStyle(color: Colors.white70),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        profession,
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Settings",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              settingsTile(Icons.person, "Edit Profile", editProfile),
              settingsTile(Icons.notifications, "Notifications", () {}),
              settingsTile(Icons.lock, "Privacy", () {}),
              settingsTile(Icons.help, "Help & Support", () {}),

              const SizedBox(height: 10),

              // DARK MODE
              SwitchListTile(
                value: darkMode,
                activeThumbColor: Colors.green,
                onChanged: (value) async {
                  setState(() {
                    darkMode = value;
                  });

                  final prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setBool("darkMode", value);
                },
                title: const Text("Dark Mode"),
                secondary:
                    const Icon(Icons.dark_mode, color: Colors.green),
              ),

              const SizedBox(height: 20),

              // LOGOUT
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.logout, color: Colors.white),
                  label: const Text(
                    "Logout",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= SETTINGS TILE =================
  Widget settingsTile(
    IconData icon,
    String title,
    VoidCallback onTap,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.green),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}