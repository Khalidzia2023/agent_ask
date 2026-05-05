import 'dart:ui';
import 'package:flutter/material.dart';

import '../../services/api_service.dart';
import 'agent_result.dart';


class AgentRoomScreen extends StatefulWidget {
  final String agentImage;

  const AgentRoomScreen({
    super.key,
    required this.agentImage,
  });

  @override
  State<AgentRoomScreen> createState() => _AgentRoomScreenState();
}

class _AgentRoomScreenState extends State<AgentRoomScreen> {
  final TextEditingController controller = TextEditingController();

  String selectedIntent = "Career";
  String selectedMode = "Balanced";

  final intents = [
    "Career",
    "Counseling",
    "Patchup",
    "Regret",
    "Vision",
    "Investment",
    "Other"
  ];

  final modes = [
    "Fast",
    "Balanced",
    "Deep Think",
  ];

  bool canGenerate() {
    return controller.text.trim().length > 10;
  }

  String buildAgentPrompt() {
    return """
🧠 INTELLIGENCE BRIEF

🧭 Intent:
$selectedIntent

⚙️ Thinking Mode:
$selectedMode

💭 User Thought:
${controller.text}

📌 Task:
Act as a high-level decision intelligence system.
Break this problem into structured insights:

1. Situation Analysis
2. Hidden Risks / Blind Spots
3. Strategic Options
4. Best Recommended Action
5. Long-term Outcome Prediction
6. Final Clear Guidance (simple human explanation)

⚠️ Tone:
- Be direct but supportive
- No fluff
- Prioritize clarity over complexity
""";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0f1115),

      /// ================= APP BAR =================
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Agent Console"),
      ),
      body: Stack(
        children: [

          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// ================= HERO AGENT CARD =================
                _heroAgent(),

                const SizedBox(height: 24),

                /// ================= INPUT FOCUS BLOCK =================
                _inputBlock(),
                _promptPreviewCard(),

                const SizedBox(height: 18),

                /// ================= QUICK TOOLS =================
                _quickTools(),

                const SizedBox(height: 22),

                /// ================= AI CONTEXT =================
                _contextBlock(),

                const SizedBox(height: 22),

                /// ================= MODE SELECTOR =================
                _modeBlock(),
              ],
            ),
          ),

          /// ================= CTA =================
          _bottomCTA(context),
        ],
      ),
    );
  }
  Widget _heroAgent() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.10),
            Colors.white.withOpacity(0.02),
          ],
        ),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Row(
        children: [

          CircleAvatar(
            radius: 34,
            backgroundImage: AssetImage(widget.agentImage),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [

                Text(
                  "Agent Sandra",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                SizedBox(height: 6),

                Text(
                  "Decision Intelligence System • Adaptive reasoning engine",
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          LiveBadge(),
        ],
      ),
    );
  }

  Widget _inputBlock() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 18,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "Your thought",
            style: TextStyle(color: Colors.white38, fontSize: 11),
          ),

          const SizedBox(height: 8),

          TextField(
            controller: controller,
            maxLines: 5,
            style: const TextStyle(color: Colors.white, fontSize: 15),
            decoration: const InputDecoration(
              hintText: "Ask anything... life, decisions, confusion, strategy",
              hintStyle: TextStyle(color: Colors.white30),
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }

  Widget _quickTools() {
    return Row(
      children: [
        _chip(Icons.mic, "Voice"),
        const SizedBox(width: 10),
        _chip(Icons.upload_file, "File"),
        const SizedBox(width: 10),
        _chip(Icons.image, "Image"),
      ],
    );
  }

  Widget _chip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white70, size: 16),
          const SizedBox(width: 6),
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _contextBlock() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Intent", style: TextStyle(color: Colors.white38, fontSize: 10)),
              const SizedBox(height: 4),
              _pill(selectedIntent, _cycleIntent),
            ],
          ),

          const Icon(Icons.arrow_forward_ios, size: 12, color: Colors.white24),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text("Mode", style: TextStyle(color: Colors.white38, fontSize: 10)),
              const SizedBox(height: 4),
              _pill(selectedMode, _cycleMode)
            ],
          ),
        ],
      ),
    );
  }

  void _cycleMode() {
    final index = modes.indexOf(selectedMode);
    setState(() {
      selectedMode = modes[(index + 1) % modes.length];
    });
  }

  void _cycleIntent() {
    _showIntentModePopup();
  }

  void _showIntentModePopup() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Intent Mode",
      barrierColor: Colors.black.withOpacity(0.6),
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (_, __, ___) {
        String tempIntent = selectedIntent;
        String tempMode = selectedMode;

        return StatefulBuilder(
          builder: (context, setModalState) {
            bool canApply = tempIntent.isNotEmpty && tempMode.isNotEmpty;

            return Material(
              color: Colors.transparent,
              child: Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                  padding: const EdgeInsets.all(16),
                  height: MediaQuery.of(context).size.height * 0.78,
                  decoration: BoxDecoration(
                    color: const Color(0xff14161c),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.white12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 30,
                        offset: const Offset(0, 10),
                      )
                    ],
                  ),
                  child: Column(
                    children: [

                      /// ================= HEADER =================
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          const Text(
                            "Configure Agent",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(
                              Icons.close,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      /// ================= CONTENT =================
                      Expanded(
                        child: Row(
                          children: [

                            /// LEFT - INTENT
                            Expanded(
                              child: _popupColumn(
                                title: "Intent",
                                items: intents,
                                selected: tempIntent,
                                onTap: (val) {
                                  setModalState(() => tempIntent = val);
                                },
                              ),
                            ),

                            const VerticalDivider(color: Colors.white12),

                            /// RIGHT - MODE
                            Expanded(
                              child: _popupColumn(
                                title: "Mode",
                                items: modes,
                                selected: tempMode,
                                onTap: (val) {
                                  setModalState(() => tempMode = val);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 12),

                      /// ================= APPLY BUTTON =================
                      GestureDetector(
                        onTap: canApply
                            ? () {
                          setState(() {
                            selectedIntent = tempIntent;
                            selectedMode = tempMode;
                          });

                          Navigator.pop(context);
                        }
                            : null,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: 52,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: canApply
                                ? Colors.white
                                : Colors.white10,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Center(
                            child: Text(
                              "Apply Selection",
                              style: TextStyle(
                                color: canApply ? Colors.black : Colors.white38,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
  Widget _popupColumn({
    required String title,
    required List<String> items,
    required String selected,
    required Function(String) onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 12),

        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              final isSelected = item == selected;

              return GestureDetector(
                onTap: () => onTap(item),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Colors.white
                        : Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected ? Colors.white : Colors.white10,
                    ),
                  ),
                  child: Text(
                    item,
                    style: TextStyle(
                      color: isSelected ? Colors.black : Colors.white70,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _pill(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
  Widget _modeBlock() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text(
          "Thinking Mode",
          style: TextStyle(color: Colors.white70, fontSize: 12),
        ),

        const SizedBox(height: 10),

        Row(
          children: modes.map((m) {
            final selected = m == selectedMode;

            return Expanded(
              child: GestureDetector(
                onTap: () => setState(() => selectedMode = m),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: selected ? Colors.white : Colors.white10,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      m,
                      style: TextStyle(
                        color: selected ? Colors.black : Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
  Widget _bottomCTA(BuildContext context) {
    return Positioned(
      left: 18,
      right: 18,
      bottom: 20,
      child: GestureDetector(
        // onTap: () => _showProcessing(context, widget.agentImage),
        onTap: canGenerate()
            ? () {
          final prompt = buildAgentPrompt();
          _showProcessing(context, widget.agentImage, prompt);
        }
            : null,
        // onTap: () {
        //   final prompt = buildAgentPrompt();
        //
        //   _showProcessing(context, widget.agentImage, prompt);
        // },
        child: Container(
          height: 58,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.white, Colors.white70],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Center(
            child: Text(
              "Generate Intelligence",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // void _showProcessing(BuildContext context, String agentImage, String prompt) {
  //   showGeneralDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     barrierColor: Colors.black.withOpacity(0.6),
  //     pageBuilder: (_, __, ___) {
  //       return Material(
  //         color: Colors.transparent,
  //         child: Stack(
  //           children: [
  //             BackdropFilter(
  //               filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
  //               child: Container(
  //                 color: Colors.black.withOpacity(0.35),
  //               ),
  //             ),
  //
  //             Center(
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //
  //                   Stack(
  //                     alignment: Alignment.center,
  //                     children: [
  //
  //                       TweenAnimationBuilder<double>(
  //                         tween: Tween(begin: 0.8, end: 1.4),
  //                         duration: const Duration(milliseconds: 1200),
  //                         curve: Curves.easeInOut,
  //                         builder: (_, value, child) {
  //                           return Container(
  //                             width: 140 * value,
  //                             height: 140 * value,
  //                             decoration: BoxDecoration(
  //                               shape: BoxShape.circle,
  //                               border: Border.all(
  //                                 color: Colors.white.withOpacity(0.15),
  //                                 width: 2,
  //                               ),
  //                             ),
  //                           );
  //                         },
  //                       ),
  //
  //                       TweenAnimationBuilder<double>(
  //                         tween: Tween(begin: 0.9, end: 1.6),
  //                         duration: const Duration(milliseconds: 1500),
  //                         curve: Curves.easeInOut,
  //                         builder: (_, value, child) {
  //                           return Container(
  //                             width: 120 * value,
  //                             height: 120 * value,
  //                             decoration: BoxDecoration(
  //                               shape: BoxShape.circle,
  //                               border: Border.all(
  //                                 color: Colors.white.withOpacity(0.08),
  //                                 width: 2,
  //                               ),
  //                             ),
  //                           );
  //                         },
  //                       ),
  //
  //                       CircleAvatar(
  //                         radius: 45,
  //                         backgroundImage: AssetImage(agentImage),
  //                       ),
  //                     ],
  //                   ),
  //
  //                   const SizedBox(height: 20),
  //
  //                   const Text(
  //                     "Agent Sandra",
  //                     style: TextStyle(
  //                       fontSize: 20,
  //                       fontWeight: FontWeight.w700,
  //                       color: Colors.white,
  //                     ),
  //                   ),
  //
  //                   const SizedBox(height: 6),
  //
  //                   const Text(
  //                     "Constructing your AI space",
  //                     style: TextStyle(
  //                       fontSize: 13,
  //                       color: Colors.white70,
  //                     ),
  //                   ),
  //
  //                   const SizedBox(height: 20),
  //
  //                   const _DotWaveLoader(),
  //
  //                   const SizedBox(height: 18),
  //
  //                   const Text(
  //                     'Your agent is working on your request....',
  //                     textAlign: TextAlign.center,
  //                     style: TextStyle(
  //                       fontSize: 14,
  //                       color: Colors.white,
  //                       fontWeight: FontWeight.w500,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  //
  //   Future.delayed(const Duration(seconds: 2), () {
  //     Navigator.pop(context); // close loader first
  //
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => AgentAdviceResultScreen(
  //           prompt: prompt, // 🔥 structured intelligence prompt
  //           intent: selectedIntent,
  //           mode: selectedMode,
  //           agentImage: widget.agentImage,
  //         ),
  //       ),
  //     );
  //   });
  // }
  void _showProcessing(BuildContext context, String agentImage, String prompt) async {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.6),
      pageBuilder: (_, __, ___) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    try {
      final service = OpenAIService();

      final response = await service.sendMessage(prompt);

      Navigator.pop(context); // close loader

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AgentAdviceResultScreen(
            prompt: response, // 👈 IMPORTANT: pass AI response
            intent: selectedIntent,
            mode: selectedMode,
            agentImage: widget.agentImage,
          ),
        ),
      );
    } catch (e) {
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  Widget _promptPreviewCard() {
    return Container(
      margin: const EdgeInsets.only(top: 18),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [

          Text(
            "AI Understanding Preview",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),

          SizedBox(height: 10),

          Text(
            "Your input will be transformed into a structured intelligence brief:\n\n"
                "• Situation breakdown\n"
                "• Risk analysis\n"
                "• Strategic options\n"
                "• Best action plan\n"
                "• Final decision guidance",
            style: TextStyle(
              color: Colors.white70,
              height: 1.5,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

}

/// ================= DOT WAVE =================
// class LiveBadge extends StatefulWidget {
//   const LiveBadge({super.key});
//
//   @override
//   State<LiveBadge> createState() => _LiveBadgeState();
// }
//
// class _LiveBadgeState extends State<LiveBadge>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _glow;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1200),
//     )..repeat(reverse: true);
//
//     _glow = Tween<double>(begin: 0.2, end: 0.8).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   Color _liveColor(double t) {
//     return Color.lerp(
//       Colors.red.withOpacity(0.9),
//       Colors.black.withOpacity(0.9),
//       t,
//     )!;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _glow,
//       builder: (_, child) {
//         final color = _liveColor(_glow.value);
//
//         return Container(
//           padding: const EdgeInsets.all(2), // 👈 ring thickness space
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(12),
//             boxShadow: [
//               BoxShadow(
//                 color: color.withOpacity(_glow.value * 0.6),
//                 blurRadius: 10,
//                 spreadRadius: 1.5,
//               ),
//             ],
//           ),
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.08),
//               borderRadius: BorderRadius.circular(10),
//               border: Border.all(
//                 color: color.withOpacity(0.6),
//                 width: 1,
//               ),
//             ),
//             child: Text(
//               "LIVE",
//               style: TextStyle(
//                 color: Colors.white.withOpacity(0.85),
//                 fontSize: 10,
//                 fontWeight: FontWeight.w600,
//                 letterSpacing: 1,
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
///
class LiveBadge extends StatefulWidget {
  const LiveBadge({super.key});

  @override
  State<LiveBadge> createState() => _LiveBadgeState();
}

class _LiveBadgeState extends State<LiveBadge>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        final t = _controller.value;

        return CustomPaint(
          painter: _LiveBorderPainter(progress: t),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.red, // 🔴 solid live badge
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              "LIVE",
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
              ),
            ),
          ),
        );
      },
    );
  }
}


class _LiveBorderPainter extends CustomPainter {
  final double progress;

  _LiveBorderPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final radius = Radius.circular(12);

    final rrect = RRect.fromRectAndRadius(rect, radius);

    final basePaint = Paint()
      ..color = Colors.white.withOpacity(0.08)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    // base calm border
    canvas.drawRRect(rrect, basePaint);

    // glowing moving dot
    final path = Path()..addRRect(rrect);
    final metrics = path.computeMetrics().first;
    final length = metrics.length;

    final position = metrics.getTangentForOffset(length * progress);

    if (position != null) {
      final dotPaint = Paint()
        ..color = Colors.yellowAccent
        ..style = PaintingStyle.fill;

      canvas.drawCircle(position.position, 3.2, dotPaint);

      // small glow
      canvas.drawCircle(
        position.position,
        6,
        Paint()
          ..color = Colors.yellowAccent.withOpacity(0.25)
          ..style = PaintingStyle.fill,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _LiveBorderPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}


/// ================= DOT WAVE =================

class _DotWaveLoader extends StatefulWidget {
  const _DotWaveLoader();

  @override
  State<_DotWaveLoader> createState() => _DotWaveLoaderState();
}

class _DotWaveLoaderState extends State<_DotWaveLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget dot(double delay) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        double t = (controller.value + delay) % 1.0;
        double scale = 0.6 + (0.4 * (1 - (t - 0.5).abs() * 2));

        return Transform.scale(
          scale: scale,
          child: Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.symmetric(horizontal: 3),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        dot(0.0),
        dot(0.2),
        dot(0.4),
      ],
    );
  }
}