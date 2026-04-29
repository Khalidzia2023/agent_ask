import 'dart:ui';
import 'package:flutter/material.dart';
import '../../gen/assets.gen.dart';
import 'agent_room.dart';

class AgentsView extends StatefulWidget {
  const AgentsView({super.key});

  @override
  State<AgentsView> createState() => _AgentsViewState();
}

class _AgentsViewState extends State<AgentsView>
    with TickerProviderStateMixin {

  int activeIndex = 0;

  late AnimationController _controller;
  late Animation<double> scaleAnim;
  late Animation<double> fadeAnim;
  late Animation<Offset> slideAnim;

  final List<Speciality> specialities = [
    Speciality(
      title: "Clarity Coach",
      description: "Helps you think clearly when you're stuck or confused.",
      image: Assets.images.agentSandra.path,
    ),
    Speciality(
      title: "Emotional Support",
      description: "Talks with you when you feel stressed or overwhelmed.",
      image: Assets.images.agentSandra.path,
    ),
    Speciality(
      title: "Career Guide",
      description: "Helps with job decisions and future planning.",
      image: Assets.images.agentSandra.path,
    ),
    Speciality(
      title: "Problem Solver",
      description: "Breaks complex situations into simple steps.",
      image: Assets.images.agentSandra.path,
    ),
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    scaleAnim = Tween(begin: 1.0, end: 0.96).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    fadeAnim = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void changeAgent(int index) async {
    if (index == activeIndex) return;

    await _controller.reverse();
    setState(() => activeIndex = index);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final active = specialities[activeIndex];

    return Scaffold(
      backgroundColor: const Color(0xfff4f4f6),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            /// 🔥 MAIN CONTAINER
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: scaleAnim.value,
                      child: child,
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.10),
                              blurRadius: 60,
                              spreadRadius: 10,
                              offset: const Offset(0, 30),
                            ),
                            BoxShadow(
                              color: Colors.black.withOpacity(0.06),
                              blurRadius: 30,
                              offset: const Offset(0, 15),
                            ),
                          ],
                        ),

                        /// 🔥 CONTENT ANIMATION
                        child: FadeTransition(
                          opacity: fadeAnim,
                          child: SlideTransition(
                            position: slideAnim,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                /// AVATAR
                                AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 400),
                                  transitionBuilder: (child, animation) {
                                    return ScaleTransition(
                                      scale: Tween(begin: 0.8, end: 1.0)
                                          .animate(animation),
                                      child: FadeTransition(
                                          opacity: animation, child: child),
                                    );
                                  },
                                  child: CircleAvatar(
                                    key: ValueKey(activeIndex),
                                    radius: 50,
                                    backgroundImage:
                                    AssetImage(active.image),
                                  ),
                                ),

                                const SizedBox(height: 20),

                                /// NAME
                                const Text(
                                  "Agent Sandra",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),

                                const SizedBox(height: 6),

                                const Text(
                                  "AI Life Advisor",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                  ),
                                ),

                                const SizedBox(height: 24),

                                /// TITLE
                                Text(
                                  active.title,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                const SizedBox(height: 10),

                                /// DESCRIPTION
                                Text(
                                  active.description,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                  ),
                                ),

                                const SizedBox(height: 30),

                                /// CTA
                                GestureDetector(
                                  onTap: () {
                                    startAgentBuildingFlow(context, active);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24, vertical: 12),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Text(
                                      "Start Conversation",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// 🔥 BOTTOM SELECTOR
            SizedBox(
              height: 110,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: specialities.length,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemBuilder: (context, index) {
                  final item = specialities[index];
                  final isActive = index == activeIndex;

                  return GestureDetector(
                    onTap: () => changeAgent(index),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isActive
                                    ? Colors.black
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: isActive ? 30 : 26,
                              backgroundImage: AssetImage(item.image),
                            ),
                          ),
                          const SizedBox(height: 6),
                          SizedBox(
                            width: 70,
                            child: Text(
                              item.title.split(" ")[0],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: isActive
                                    ? Colors.black
                                    : Colors.black45,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Future<void> startAgentBuildingFlow(
      BuildContext context,
      Speciality agent,
      ) async {
    final steps = [
      "Understanding your intent…",
      "Building your personal AI memory…",
      "Aligning response personality…",
      "Finalizing your agent space…",
    ];

    int index = 0;

    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      pageBuilder: (_, __, ___) {
        return StatefulBuilder(
          builder: (context, setState) {
            Future.delayed(const Duration(milliseconds: 900), () {
              if (index < steps.length - 1) {
                index++;
                setState(() {});
              } else {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AgentRoomScreen(
                      agentImage: specialities[activeIndex].image,
                    ),
                  ),
                );
                // Navigator.push(
                //   context,
                //   PageRouteBuilder(
                //     pageBuilder: (_, __, ___) => const AgentRoomScreen(),
                //     transitionsBuilder: (_, animation, __, child) {
                //       return FadeTransition(
                //         opacity: animation,
                //         child: child,
                //       );
                //     },
                //   ),
                // );
              }
            });

            return Material(
              color: Colors.transparent,
              child: Stack(
                children: [
                  /// BACKDROP
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                    child: Container(
                      color: Colors.black.withOpacity(0.35),
                    ),
                  ),

                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        /// 🔥 PULSING AGENT CORE
                        Stack(
                          alignment: Alignment.center,
                          children: [

                            /// outer pulse rings
                            TweenAnimationBuilder<double>(
                              tween: Tween(begin: 0.8, end: 1.4),
                              duration: const Duration(milliseconds: 1200),
                              curve: Curves.easeInOut,
                              builder: (_, value, child) {
                                return Container(
                                  width: 140 * value,
                                  height: 140 * value,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.15),
                                      width: 2,
                                    ),
                                  ),
                                );
                              },
                              onEnd: () {},
                            ),

                            TweenAnimationBuilder<double>(
                              tween: Tween(begin: 0.9, end: 1.6),
                              duration: const Duration(milliseconds: 1500),
                              curve: Curves.easeInOut,
                              builder: (_, value, child) {
                                return Container(
                                  width: 120 * value,
                                  height: 120 * value,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.08),
                                      width: 2,
                                    ),
                                  ),
                                );
                              },
                            ),

                            /// AGENT IMAGE CORE
                            CircleAvatar(
                              radius: 45,
                              backgroundImage: AssetImage(agent.image),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        /// NAME
                        const Text(
                          "Agent Sandra",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 6),

                        const Text(
                          "Constructing your AI space",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white70,
                          ),
                        ),

                        const SizedBox(height: 20),

                        /// 🔥 DOT WAVE LOADER (NO SPINNER)
                        _DotWaveLoader(),

                        const SizedBox(height: 18),

                        /// STEP TEXT
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: Text(
                            steps[index],
                            key: ValueKey(index),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

}

/// MODEL
class Speciality {
  final String title;
  final String description;
  final String image;

  Speciality({
    required this.title,
    required this.description,
    required this.image,
  });
}





/// dot wave

class _DotWaveLoader extends StatefulWidget {
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