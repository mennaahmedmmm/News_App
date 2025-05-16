import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SettingsScreen extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  const SettingsScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _showNotifications = false;

  final List<String> newsNotifications = [
    "📰 Breaking: Massive storm expected this weekend.",
    "🏆 Sports: Egypt wins the African Cup!",
    "💼 Business: Stock market hits new high.",
  ];

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Profile Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage('assets/img.png'),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'User Name',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _showNotifications = !_showNotifications;
                          });
                        },
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.grey.shade200,
                          child: Icon(
                            _showNotifications
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            newsNotifications.length.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Notifications
            if (_showNotifications)
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 8, right: 8),
                child: Column(
                  children: newsNotifications
                      .map(
                        (note) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.notifications, color: Colors.redAccent),
                      title: Text(note),
                    ),
                  )
                      .toList(),
                ),
              ),

            const SizedBox(height: 24),

            // Email
            GestureDetector(
              onTap: () => showToast("Edit Email tapped (not functional)"),
              child: ListTile(
                title: const Text("Email"),
                subtitle: const Text("news@daily.com", style: TextStyle(color: Colors.grey)),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ),

            // Password
            GestureDetector(
              onTap: () => showToast("Change Password tapped (not functional)"),
              child: const ListTile(
                title: Text("Password"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),

            const SizedBox(height: 24),

            // Theme Section
            const Text(
              "Theme",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            ListTile(
              title: const Text("Dark Mode"),
              trailing: Switch(
                value: widget.isDarkMode,
                onChanged: (_) => widget.onThemeToggle(),
              ),
            ),

            const SizedBox(height: 24),

            // About Section
            const Text(
              "About",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            ListTile(
              title: const Text("Privacy Policy"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => showToast("Privacy Policy tapped"),
            ),
            ListTile(
              title: const Text("Terms of Service"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => showToast("Terms of Service tapped"),
            ),
          ],
        ),
      ),
    );
  }
}
