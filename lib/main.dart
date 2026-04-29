import 'package:agent_ask/screens/agents_view/agents_view.dart';
import 'package:agent_ask/screens/bnav_bar/bnavbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AgentAskApp());
}


class AgentAskApp extends StatefulWidget {
  const AgentAskApp({super.key});

  @override
  State<AgentAskApp> createState() => _AgentAskAppState();
}

class _AgentAskAppState extends State<AgentAskApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomNavBar(),
    );
  }
}
