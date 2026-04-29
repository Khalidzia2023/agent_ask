import 'package:flutter/material.dart';

class AgentAdviceResultScreen extends StatelessWidget {
  final String prompt;
  final String intent;
  final String mode;
  final String agentImage;

  const AgentAdviceResultScreen({
    super.key,
    required this.prompt,
    required this.intent,
    required this.mode,
    required this.agentImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B0D12),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "AI Agent Report",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// ================= HERO =================
            _hero(),

            const SizedBox(height: 16),

            /// ================= PROMPT =================
            _glassCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _label("Your Query"),
                  const SizedBox(height: 8),
                  Text(
                    prompt,
                    style: const TextStyle(
                      color: Colors.white,
                      height: 1.5,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),

            /// ================= META =================
            Row(
              children: [
                Expanded(child: _metaChip("Intent", intent, Icons.track_changes)),
                const SizedBox(width: 10),
                Expanded(child: _metaChip("Mode", mode, Icons.psychology_alt)),
              ],
            ),

            const SizedBox(height: 18),

            /// ================= INSIGHTS =================
            _sectionTitle("AI Insights"),
            const SizedBox(height: 10),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children:  [
                _chip("Clarity moderate", Icons.visibility),
                _chip("Emotional bias detected", Icons.favorite_border),
                _chip("Time-sensitive decision", Icons.timer),
                _chip("External influence risk", Icons.warning_amber),
              ],
            ),

            const SizedBox(height: 18),

            /// ================= ANALYSIS =================
            _glassCard(
              accent: Colors.orange,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  _sectionHeader("Risk Analysis"),
                  SizedBox(height: 10),
                  _bullet("Delayed execution may reduce outcome quality"),
                  _bullet("Overthinking is blocking clarity"),
                  _bullet("External opinions may distort judgment"),
                ],
              ),
            ),

            const SizedBox(height: 14),

            _glassCard(
              accent: Colors.blueAccent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  _sectionHeader("Recommended Strategy"),
                  SizedBox(height: 10),
                  _bullet("Break decision into small actionable steps"),
                  _bullet("Prioritize long-term alignment over urgency"),
                  _bullet("Avoid emotional decision loops"),
                  _bullet("Execute with minimal delay after clarity"),
                ],
              ),
            ),

            const SizedBox(height: 14),

            /// ================= FINAL =================
            _glassCard(
              accent: Colors.greenAccent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  _sectionHeader("Final Guidance"),
                  SizedBox(height: 10),
                  Text(
                    "Move forward with structured clarity. "
                        "Avoid emotional acceleration. "
                        "Your strongest outcome comes from calm execution after simplification.",
                    style: TextStyle(
                      color: Colors.white70,
                      height: 1.6,
                      fontSize: 13.5,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // =========================================================
  // HERO
  // =========================================================
  Widget _hero() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.06),
            Colors.white.withOpacity(0.02),
          ],
        ),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white12),
      ),
      child: Row(
        children: [

          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.greenAccent),
            ),
            child: CircleAvatar(
              radius: 26,
              backgroundImage: AssetImage(agentImage),
            ),
          ),

          const SizedBox(width: 14),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Agent Sandra",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Neural Decision Intelligence System",
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.greenAccent.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.greenAccent.withOpacity(0.4)),
            ),
            child: const Text(
              "LIVE",
              style: TextStyle(
                color: Colors.greenAccent,
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================
  // GLASS CARD
  // =========================================================
  Widget _glassCard({required Widget child, Color? accent}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: accent?.withOpacity(0.3) ?? Colors.white12,
        ),
      ),
      child: child,
    );
  }

  // =========================================================
  // META CHIP
  // =========================================================
  Widget _metaChip(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.white70, size: 18),
          const SizedBox(height: 6),
          Text(title, style: const TextStyle(color: Colors.white54, fontSize: 11)),
          const SizedBox(height: 4),
          Text(value,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              )),
        ],
      ),
    );
  }

  // =========================================================
  // LABEL
  // =========================================================
  Widget _label(String text) {
    return Text(
      text.toUpperCase(),
      style: const TextStyle(
        color: Colors.white54,
        fontSize: 11,
        letterSpacing: 1.2,
      ),
    );
  }

  // =========================================================
  // SECTION TITLE
  // =========================================================
  Widget _sectionTitle(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  // =========================================================
  // SECTION HEADER
  // =========================================================
  static  Widget _sectionHeader(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  // =========================================================
  // CHIP
  // =========================================================
  static  Widget _chip(String text, IconData icon) {
    return Chip(
      backgroundColor: Color(0xff1A1D25),
      label: Text(
        text,
        style: TextStyle(color: Colors.white70, fontSize: 12),
      ),
      avatar: Icon(icon, size: 16, color: Colors.white70),
    );
  }

  // =========================================================
  // BULLET
  // =========================================================
  static  Widget _bullet(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("• ", style: TextStyle(color: Colors.white70)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white70,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}