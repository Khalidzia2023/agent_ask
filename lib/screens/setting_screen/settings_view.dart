import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.1,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          sectionTitle("Agent Configuration"),

          settingsTile(
            icon: Icons.smart_toy_outlined,
            title: "Default Agent Mode",
            subtitle: "Choose how AI behaves for you",
          ),

          settingsTile(
            icon: Icons.psychology_alt_outlined,
            title: "AI Personality",
            subtitle: "Soft • Balanced • Strong",
          ),

          settingsTile(
            icon: Icons.tune,
            title: "Response Style",
            subtitle: "Short / Detailed / Professional",
          ),

          const SizedBox(height: 18),

          sectionTitle("Appearance"),

          settingsTile(
            icon: Icons.dark_mode_outlined,
            title: "Theme",
            subtitle: "Light Mode (Current System)",
          ),

          settingsTile(
            icon: Icons.text_fields,
            title: "Typography",
            subtitle: "Modern clean font system",
          ),

          settingsTile(
            icon: Icons.animation,
            title: "Animations",
            subtitle: "Smooth transitions enabled",
          ),

          const SizedBox(height: 18),

          sectionTitle("Privacy & Data"),

          settingsTile(
            icon: Icons.lock_outline,
            title: "Privacy Mode",
            subtitle: "Control AI memory usage",
          ),

          settingsTile(
            icon: Icons.history,
            title: "Chat History",
            subtitle: "Manage conversations",
          ),

          settingsTile(
            icon: Icons.cloud_off_outlined,
            title: "Offline Mode",
            subtitle: "Disable cloud AI features",
          ),

          const SizedBox(height: 18),

          sectionTitle("Advanced"),

          settingsTile(
            icon: Icons.developer_mode_outlined,
            title: "Developer Options",
            subtitle: "Debug AI agents",
          ),

          settingsTile(
            icon: Icons.auto_awesome,
            title: "AI Model Switch",
            subtitle: "Change backend intelligence",
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          color: Colors.black54,
          fontSize: 12,
          letterSpacing: 1.8,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget settingsTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                  )
                ],
              ),
              child: Icon(icon, color: Colors.black, size: 20),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: Colors.black38,
            ),
          ],
        ),
      ),
    );
  }
}