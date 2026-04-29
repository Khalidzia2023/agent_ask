import 'package:agent_ask/screens/agents_view/agents_view.dart';
import 'package:flutter/material.dart';

import '../setting_screen/settings_view.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;

  final pages = const [
    HomeScreen(),
    SettingsScreen(),
    AgentsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        child: pages[index],
      ),

      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: Colors.white.withOpacity(0.08)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              blurRadius: 25,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            navItem(Icons.support_agent_rounded, 0),
            navItem(Icons.explore_rounded, 1),
            navItem(Icons.person_rounded, 2),
          ],
        ),
      ),

    );
  }

  Widget navItem(IconData icon, int i) {
    final selected = index == i;

    return GestureDetector(
      onTap: () => setState(() => index = i),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.transparent,
          shape: BoxShape.circle,
          boxShadow: selected
              ? [
            BoxShadow(
              color: Colors.white.withOpacity(0.25),
              blurRadius: 20,
              spreadRadius: 1,
            )
          ]
              : [],
        ),
        child: AnimatedScale(
          duration: const Duration(milliseconds: 200),
          scale: selected ? 1.2 : 1.0,
          child: Icon(
            icon,
            size: 26,
            color: selected ? Colors.black : Colors.white70,
          ),
        ),
      ),
    );
  }


}

/* -------------------- SCREENS -------------------- */

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "HOME",
        style: TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
      ),
    );
  }
}

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "EXPLORE",
        style: TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
      ),
    );
  }
}

