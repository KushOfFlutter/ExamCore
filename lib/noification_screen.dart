import 'package:flutter/material.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  // ================= SAMPLE NOTIFICATIONS =================

  List<Map<String, dynamic>> notifications = [
    {
      "title": "New Physics Quiz Added",
      "message": "Try the latest Physics questions now.",
      "isRead": false,
      "time": "2 min ago",
    },
    {
      "title": "Daily Challenge Available",
      "message": "Complete today's JAMB challenge and earn points.",
      "isRead": false,
      "time": "1 hour ago",
    },
    {
      "title": "Study Tip",
      "message": "Practice consistently for better results.",
      "isRead": true,
      "time": "Yesterday",
    },
  ];

  // ================= MARK AS READ =================

  void markAsRead(int index) {
    setState(() {
      notifications[index]["isRead"] = true;
    });
  }

  // ================= DELETE NOTIFICATION =================

  void deleteNotification(int index) {
    setState(() {
      notifications.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Notifications"),
        backgroundColor: Colors.green,
      ),

      body: notifications.isEmpty
          ? const Center(
              child: Text(
                "No notifications yet",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: notifications.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {

                final item = notifications[index];

                return GestureDetector(
                  onTap: () {
                    markAsRead(index);

                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(item["title"]),
                        content: Text(item["message"]),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Close"),
                          )
                        ],
                      ),
                    );
                  },

                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),

                    padding: const EdgeInsets.all(15),

                    decoration: BoxDecoration(
                      color: item["isRead"]
                          ? Colors.grey.shade100
                          : Colors.green.shade50,

                      borderRadius: BorderRadius.circular(15),

                      border: Border.all(
                        color: item["isRead"]
                            ? Colors.grey.shade300
                            : Colors.green,
                      ),
                    ),

                    child: Row(
                      children: [

                        // ICON
                        CircleAvatar(
                          backgroundColor: Colors.green,
                          child: const Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(width: 15),

                        // TEXT
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [

                              Text(
                                item["title"],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: item["isRead"]
                                      ? FontWeight.normal
                                      : FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 5),

                              Text(
                                item["message"],
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),

                              const SizedBox(height: 5),

                              Text(
                                item["time"],
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // DELETE BUTTON
                        IconButton(
                          icon: const Icon(Icons.delete,
                              color: Colors.red),
                          onPressed: () {
                            deleteNotification(index);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}