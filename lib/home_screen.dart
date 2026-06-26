import 'package:flutter/material.dart';
import 'package:flutter_pract/profile_screen.dart';
import 'noification_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,

        centerTitle: true,

        title: const Text(
          "Exam Core (JAMB PRACTICE)",

          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        // ================= MENU BUTTON =================

        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),

            onPressed: () {

              showModalBottomSheet(

                context: context,

                backgroundColor: Colors.white,

                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25),
                  ),
                ),

                builder: (context) {

                  return Container(

                    height:
                    MediaQuery.of(context).size.height * 0.5,

                    padding: const EdgeInsets.all(20),

                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        Center(
                          child: Container(
                            width: 50,
                            height: 5,

                            decoration: BoxDecoration(
                              color: Colors.grey.shade400,

                              borderRadius:
                              BorderRadius.circular(20),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        const Text(
                          "Menu",

                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),

                        const SizedBox(height: 30),

                        // ================= MENU ITEMS =================

                        menuTile(
                          Icons.person,
                          "Profile",
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ProfileScreen()));
                              },
                        ),

                        menuTile(
                          Icons.lightbulb,
                          "Tips",
                              () {},
                        ),

                        menuTile(
                          Icons.support_agent,
                          "Support",
                              () {},
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),

        actions: [
  IconButton(
    icon: const Icon(Icons.notifications),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const NotificationScreen(),
        ),
      );
    },
  ),
],
      ),

      body: SafeArea(

        child: SingleChildScrollView(

          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              // ================= TOP CONTAINER =================

              Container(

                height: 200,
                width: double.infinity,

                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(

                  color: Colors.green,

                  borderRadius: BorderRadius.circular(20),

                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/study.png',
                    ),

                    fit: BoxFit.cover,
                    opacity: 0.3,
                  ),
                ),

                child: const Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  mainAxisAlignment:
                  MainAxisAlignment.center,

                  children: [

                    Text(
                      "Kush said,Practice Today,\nAce Tomorrow!",

                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 15),

                    Text(
                      "Consistency is the key to success.",

                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // ================= SUBJECT TITLE =================

              const Text(
                "Subjects",

                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),

              const SizedBox(height: 20),

              // ================= SUBJECT GRID =================

              GridView.count(

                shrinkWrap: true,

                physics:
                const NeverScrollableScrollPhysics(),

                crossAxisCount: 2,

                crossAxisSpacing: 15,
                mainAxisSpacing: 15,

                childAspectRatio: 1.3,

                children: [

                  subjectCard(
                    "Physics",
                    Icons.science,
                    Colors.blue,
                  ),

                  subjectCard(
                    "Chemistry",
                    Icons.biotech,
                    Colors.orange,
                  ),

                  subjectCard(
                    "Mathematics",
                    Icons.calculate,
                    Colors.purple,
                  ),

                  subjectCard(
                    "Biology",
                    Icons.eco,
                    Colors.teal,
                  ),

                  subjectCard(
                    "English",
                    Icons.menu_book,
                    Colors.red,
                  ),

                  subjectCard(
                    "Achievements",
                    Icons.emoji_events,
                    Colors.amber,
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // ================= PROGRESS CARD =================

              Container(

                width: double.infinity,

                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(

                  color: Colors.green,

                  borderRadius: BorderRadius.circular(20),
                ),

                child: Row(

                  children: [

                    const Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 40,
                    ),

                    const SizedBox(width: 20),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,

                        children: const [

                          Text(
                            "Keep Practicing!",

                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 8),

                          Text(
                            "You are improving every day.",

                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // ================= JAMB IMAGE =================

              Container(

                height: 100,
                width: double.infinity,

                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(20),

                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/jamb.png',
                    ),

                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  // ================= SUBJECT CARD =================

  Widget subjectCard(
      String title,
      IconData icon,
      Color color,
      ) {

    return Container(

      decoration: BoxDecoration(

        color: color,

        borderRadius: BorderRadius.circular(20),

        boxShadow: [

          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          Icon(
            icon,
            color: Colors.white,
            size: 40,
          ),

          const SizedBox(height: 10),

          Text(
            title,

            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // ================= MENU TILE =================

  Widget menuTile(
      IconData icon,
      String title,
      VoidCallback onTap,
      ) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),

      child: ListTile(

        onTap: onTap,

        leading: CircleAvatar(
          backgroundColor:
          Colors.green.withOpacity(0.1),

          child: Icon(
            icon,
            color: Colors.green,
          ),
        ),

        title: Text(
          title,

          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),

        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
        ),
      ),
    );
  }
}