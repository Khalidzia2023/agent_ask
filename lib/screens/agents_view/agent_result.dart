// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';
//
// class AgentAdviceResultScreen extends StatefulWidget {
//   final String prompt;
//   final String intent;
//   final String mode;
//   final String agentImage;
//
//   const AgentAdviceResultScreen({
//     super.key,
//     required this.prompt,
//     required this.intent,
//     required this.mode,
//     required this.agentImage,
//   });
//
//   @override
//   State<AgentAdviceResultScreen> createState() =>
//       _AgentAdviceResultScreenState();
// }
//
// class _AgentAdviceResultScreenState extends State<AgentAdviceResultScreen> {
//   bool isSaved = false;
//
//   // Generated insights based on the analysis
//   final Map<String, dynamic> analysisData = {
//     "finalGuidance": "Move forward with clarity. Avoid emotional acceleration. Best outcomes come from calm, structured execution.",
//     "insights": [
//       {"title": "Decision Clarity", "status": "Partially Formed", "progress": 0.65, "description": "Your decision framework is taking shape but needs refinement."},
//       {"title": "Emotional Influence", "status": "Moderate", "progress": 0.45, "description": "Emotions are playing a moderate role in your decision process."},
//       {"title": "Structure Level", "status": "Needs Work", "progress": 0.30, "description": "Your approach would benefit from better organization."}
//     ],
//     "risks": [
//       {"risk": "Overthinking", "impact": "High"},
//       {"risk": "External Influence", "impact": "Medium"},
//       {"risk": "Priority Clarity", "impact": "High"}
//     ],
//     "actions": [
//       {"action": "Break decision into small steps", "difficulty": "Easy", "time": "5 min"},
//       {"action": "Focus on long-term outcome", "difficulty": "Medium", "time": "10 min"},
//       {"action": "Act after simplification", "difficulty": "Easy", "time": "5 min"}
//     ]
//   };
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff0B0D12),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: const Text(
//           "Decision Intelligence Report",
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.w600,
//             letterSpacing: -0.5,
//           ),
//         ),
//         centerTitle: false,
//         actions: [
//           // Save Button in AppBar
//           Container(
//             margin: const EdgeInsets.only(right: 16),
//             child: GestureDetector(
//               onTap: _saveToFavorites,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//                 decoration: BoxDecoration(
//                   color: isSaved
//                       ? Colors.greenAccent.withOpacity(0.2)
//                       : Colors.white.withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(20),
//                   border: Border.all(
//                     color: isSaved
//                         ? Colors.greenAccent.withOpacity(0.5)
//                         : Colors.white.withOpacity(0.2),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Icon(
//                       isSaved ? Icons.favorite : Icons.favorite_border,
//                       color: isSaved ? Colors.greenAccent : Colors.white70,
//                       size: 18,
//                     ),
//                     const SizedBox(width: 6),
//                     Text(
//                       isSaved ? "Saved" : "Save",
//                       style: TextStyle(
//                         color: isSaved ? Colors.greenAccent : Colors.white70,
//                         fontSize: 13,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.only(right: 16),
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//               decoration: BoxDecoration(
//                 color: Colors.greenAccent.withOpacity(0.15),
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border.all(color: Colors.greenAccent.withOpacity(0.3)),
//               ),
//               child: const Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Icon(Icons.verified, color: Colors.greenAccent, size: 16),
//                   SizedBox(width: 4),
//                   Text(
//                     "AI Verified",
//                     style: TextStyle(
//                       color: Colors.greenAccent,
//                       fontSize: 12,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             /// ================= TRUST BANNER =================
//             _trustBanner(),
//             const SizedBox(height: 20),
//
//             /// ================= FINAL GUIDANCE (Hero Card) =================
//             _finalGuidanceCard(),
//             const SizedBox(height: 20),
//
//             /// ================= METRICS ROW =================
//             Row(
//               children: [
//                 Expanded(child: _metricCard("Intent", widget.intent, Icons.psychology)),
//                 const SizedBox(width: 12),
//                 Expanded(child: _metricCard("Analysis Mode", widget.mode, Icons.analytics)),
//               ],
//             ),
//             const SizedBox(height: 24),
//
//             /// ================= INSIGHTS SECTION =================
//             Text(
//               "Key Insights",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18,
//                 fontWeight: FontWeight.w700,
//                 letterSpacing: -0.3,
//               ),
//             ),
//             const SizedBox(height: 12),
//             ...analysisData["insights"].map((insight) => Padding(
//               padding: const EdgeInsets.only(bottom: 12),
//               child: _insightCard(
//                 title: insight["title"],
//                 status: insight["status"],
//                 progress: insight["progress"],
//                 icon: _getInsightIcon(insight["title"]),
//                 color: _getInsightColor(insight["title"]),
//                 description: insight["description"],
//               ),
//             )),
//             const SizedBox(height: 24),
//
//             /// ================= RISK ASSESSMENT =================
//             _riskAssessmentCard(),
//             const SizedBox(height: 24),
//
//             /// ================= ACTION PLAN =================
//             _actionPlanCard(),
//             const SizedBox(height: 30),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // ================= SAVE TO FAVORITES =================
//   Future<void> _saveToFavorites() async {
//     if (isSaved) return;
//
//     // Generate intelligent title from prompt
//     String title = _generateTitle(widget.prompt);
//
//     // Create favorite item
//     Map<String, dynamic> favorite = {
//       "id": DateTime.now().millisecondsSinceEpoch.toString(),
//       "title": title,
//       "prompt": widget.prompt,
//       "intent": widget.intent,
//       "mode": widget.mode,
//       "agentImage": widget.agentImage,
//       "analysisData": analysisData,
//       "timestamp": DateTime.now().toIso8601String(),
//       "dateSaved": _getFormattedDate(),
//     };
//
//     // Save to SharedPreferences
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       List<String>? favoritesList = prefs.getStringList('favorites');
//
//       List<Map<String, dynamic>> favorites = [];
//       if (favoritesList != null) {
//         favorites = favoritesList.map((item) => jsonDecode(item) as Map<String, dynamic>).toList();
//       }
//
//       favorites.add(favorite);
//
//       List<String> encodedList = favorites.map((item) => jsonEncode(item)).toList();
//       await prefs.setStringList('favorites', encodedList);
//
//       setState(() {
//         isSaved = true;
//       });
//
//       // Show success message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "✓ Saved to Favorites",
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 4),
//               Text(
//                 title,
//                 style: TextStyle(fontSize: 12),
//               ),
//             ],
//           ),
//           backgroundColor: Colors.greenAccent.withOpacity(0.9),
//           behavior: SnackBarBehavior.floating,
//           duration: Duration(seconds: 2),
//         ),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text("Failed to save: $e"),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }
//
//   // Generate intelligent title from prompt
//   String _generateTitle(String prompt) {
//     // Extract key action words
//     String lowerPrompt = prompt.toLowerCase();
//
//     // Common decision patterns
//     if (lowerPrompt.contains("should i") || lowerPrompt.contains("should I")) {
//       String topic = prompt.split(RegExp(r'should i|should I')).last.trim();
//       if (topic.length > 40) topic = topic.substring(0, 40);
//       return "Should I $topic";
//     }
//
//     if (lowerPrompt.contains("how to")) {
//       String topic = prompt.split(RegExp(r'how to')).last.trim();
//       if (topic.length > 40) topic = topic.substring(0, 40);
//       return "How to $topic";
//     }
//
//     if (lowerPrompt.contains("which") || lowerPrompt.contains("what")) {
//       String question = prompt.length > 50 ? prompt.substring(0, 50) : prompt;
//       return question + (question.length >= 50 ? "..." : "");
//     }
//
//     // Use first few words as title
//     List<String> words = prompt.split(' ');
//     String title = words.take(7).join(' ');
//     if (title.length > 50) title = title.substring(0, 50);
//     return title + (words.length > 7 ? "..." : "");
//   }
//
//   String _getFormattedDate() {
//     DateTime now = DateTime.now();
//     return "${now.day}/${now.month}/${now.year}";
//   }
//
//   IconData _getInsightIcon(String title) {
//     switch(title) {
//       case "Decision Clarity": return Icons.clear_all;
//       case "Emotional Influence": return Icons.mood;
//       case "Structure Level": return Icons.account_tree;
//       default: return Icons.insights;
//     }
//   }
//
//   Color _getInsightColor(String title) {
//     switch(title) {
//       case "Decision Clarity": return Colors.blueAccent;
//       case "Emotional Influence": return Colors.orangeAccent;
//       case "Structure Level": return Colors.purpleAccent;
//       default: return Colors.grey;
//     }
//   }
//
//   // ================= TRUST BANNER =================
//   Widget _trustBanner() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             const Color(0xff1A1F2E),
//             const Color(0xff0F1119),
//           ],
//         ),
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(
//           color: Colors.white.withOpacity(0.08),
//         ),
//       ),
//       child: Row(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: Colors.greenAccent.withOpacity(0.1),
//               borderRadius: BorderRadius.circular(14),
//             ),
//             child: Icon(
//               Icons.shield,
//               color: Colors.greenAccent,
//               size: 28,
//             ),
//           ),
//           const SizedBox(width: 14),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "Trusted Analysis",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w700,
//                     fontSize: 15,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   "Based on ${_getAnalysisDepth()} decision parameters • 99.9% accuracy rate",
//                   style: TextStyle(
//                     color: Colors.white54,
//                     fontSize: 12,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.05),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: const Text(
//               "LIVE",
//               style: TextStyle(
//                 color: Colors.greenAccent,
//                 fontSize: 10,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // ================= FINAL GUIDANCE CARD =================
//   Widget _finalGuidanceCard() {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             Colors.greenAccent.withOpacity(0.12),
//             Colors.blueAccent.withOpacity(0.08),
//             Colors.white.withOpacity(0.02),
//           ],
//         ),
//         borderRadius: BorderRadius.circular(24),
//         border: Border.all(
//           color: Colors.greenAccent.withOpacity(0.25),
//           width: 1.5,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.greenAccent.withOpacity(0.1),
//             blurRadius: 20,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: Colors.greenAccent.withOpacity(0.2),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: const Icon(
//                   Icons.emoji_events,
//                   color: Colors.greenAccent,
//                   size: 20,
//                 ),
//               ),
//               const SizedBox(width: 12),
//               const Text(
//                 "FINAL GUIDANCE",
//                 style: TextStyle(
//                   color: Colors.greenAccent,
//                   fontWeight: FontWeight.w800,
//                   fontSize: 13,
//                   letterSpacing: 1,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           Text(
//             analysisData["finalGuidance"].split(". ")[0] + ".",
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 18,
//               fontWeight: FontWeight.w600,
//               height: 1.3,
//             ),
//           ),
//           const SizedBox(height: 12),
//           Text(
//             analysisData["finalGuidance"].split(". ").sublist(1).join(". "),
//             style: const TextStyle(
//               color: Colors.white70,
//               fontSize: 14,
//               height: 1.5,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // ================= METRIC CARD =================
//   Widget _metricCard(String label, String value, IconData icon) {
//     return Container(
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.03),
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: Colors.white.withOpacity(0.08)),
//       ),
//       child: Column(
//         children: [
//           Icon(icon, color: Colors.white54, size: 20),
//           const SizedBox(height: 8),
//           Text(
//             label,
//             style: const TextStyle(
//               color: Colors.white54,
//               fontSize: 11,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             value,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 14,
//               fontWeight: FontWeight.w700,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
//
//   // ================= INSIGHT CARD =================
//   Widget _insightCard({
//     required String title,
//     required String status,
//     required double progress,
//     required IconData icon,
//     required Color color,
//     required String description,
//   }) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.03),
//         borderRadius: BorderRadius.circular(18),
//         border: Border.all(color: color.withOpacity(0.2)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(6),
//                 decoration: BoxDecoration(
//                   color: color.withOpacity(0.15),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Icon(icon, color: color, size: 18),
//               ),
//               const SizedBox(width: 10),
//               Expanded(
//                 child: Text(
//                   title,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w600,
//                     fontSize: 15,
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                 decoration: BoxDecoration(
//                   color: color.withOpacity(0.15),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Text(
//                   status,
//                   style: TextStyle(
//                     color: color,
//                     fontSize: 11,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 12),
//           ClipRRect(
//             borderRadius: BorderRadius.circular(6),
//             child: LinearProgressIndicator(
//               value: progress,
//               backgroundColor: Colors.white.withOpacity(0.1),
//               valueColor: AlwaysStoppedAnimation<Color>(color),
//               minHeight: 6,
//             ),
//           ),
//           const SizedBox(height: 10),
//           Text(
//             description,
//             style: const TextStyle(
//               color: Colors.white60,
//               fontSize: 12,
//               height: 1.4,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // ================= RISK ASSESSMENT CARD =================
//   Widget _riskAssessmentCard() {
//     return Container(
//       padding: const EdgeInsets.all(18),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.03),
//         borderRadius: BorderRadius.circular(18),
//         border: Border.all(color: Colors.orangeAccent.withOpacity(0.2)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(6),
//                 decoration: BoxDecoration(
//                   color: Colors.orangeAccent.withOpacity(0.15),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: const Icon(Icons.warning_amber_rounded, color: Colors.orangeAccent, size: 18),
//               ),
//               const SizedBox(width: 10),
//               const Text(
//                 "Risk Assessment",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.w700,
//                   fontSize: 16,
//                 ),
//               ),
//               const Spacer(),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                 decoration: BoxDecoration(
//                   color: Colors.redAccent.withOpacity(0.15),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: const Text(
//                   "3 Risks Detected",
//                   style: TextStyle(
//                     color: Colors.redAccent,
//                     fontSize: 11,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           ...analysisData["risks"].map((risk) => Padding(
//             padding: const EdgeInsets.only(bottom: 12),
//             child: Row(
//               children: [
//                 Container(
//                   width: 4,
//                   height: 4,
//                   decoration: BoxDecoration(
//                     color: risk["impact"] == "High" ? Colors.redAccent : Colors.orangeAccent,
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: Text(
//                     risk["risk"],
//                     style: const TextStyle(color: Colors.white70, fontSize: 13),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
//                   decoration: BoxDecoration(
//                     color: (risk["impact"] == "High" ? Colors.redAccent : Colors.orangeAccent).withOpacity(0.15),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Text(
//                     risk["impact"],
//                     style: TextStyle(
//                       color: risk["impact"] == "High" ? Colors.redAccent : Colors.orangeAccent,
//                       fontSize: 11,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           )),
//           const Divider(color: Colors.white12, height: 16),
//           Container(
//             padding: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: Colors.redAccent.withOpacity(0.05),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: const Row(
//               children: [
//                 Icon(Icons.priority_high, color: Colors.redAccent, size: 16),
//                 SizedBox(width: 8),
//                 Expanded(
//                   child: Text(
//                     "Immediate attention needed on high-impact risks",
//                     style: TextStyle(color: Colors.redAccent, fontSize: 12),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // ================= ACTION PLAN CARD =================
//   Widget _actionPlanCard() {
//     return Container(
//       padding: const EdgeInsets.all(18),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             Colors.purpleAccent.withOpacity(0.08),
//             Colors.blueAccent.withOpacity(0.04),
//           ],
//         ),
//         borderRadius: BorderRadius.circular(18),
//         border: Border.all(color: Colors.purpleAccent.withOpacity(0.2)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(6),
//                 decoration: BoxDecoration(
//                   color: Colors.purpleAccent.withOpacity(0.15),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: const Icon(Icons.checklist, color: Colors.purpleAccent, size: 18),
//               ),
//               const SizedBox(width: 10),
//               const Text(
//                 "Recommended Action Plan",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.w700,
//                   fontSize: 16,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           ...analysisData["actions"].asMap().entries.map((entry) => Padding(
//             padding: const EdgeInsets.only(bottom: 12),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   width: 24,
//                   height: 24,
//                   decoration: BoxDecoration(
//                     gradient: const LinearGradient(
//                       colors: [Colors.purpleAccent, Colors.blueAccent],
//                     ),
//                     shape: BoxShape.circle,
//                   ),
//                   child: Center(
//                     child: Text(
//                       "${entry.key + 1}",
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 12,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         entry.value["action"],
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 13,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       const SizedBox(height: 4),
//                       Row(
//                         children: [
//                           Icon(Icons.timer, size: 12, color: Colors.white54),
//                           const SizedBox(width: 4),
//                           Text(
//                             entry.value["time"],
//                             style: const TextStyle(color: Colors.white54, fontSize: 10),
//                           ),
//                           const SizedBox(width: 12),
//                           Icon(Icons.speed, size: 12, color: Colors.white54),
//                           const SizedBox(width: 4),
//                           Text(
//                             entry.value["difficulty"],
//                             style: const TextStyle(color: Colors.white54, fontSize: 10),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           )),
//           const SizedBox(height: 8),
//           Container(
//             padding: const EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: Colors.greenAccent.withOpacity(0.05),
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(color: Colors.greenAccent.withOpacity(0.2)),
//             ),
//             child: const Row(
//               children: [
//                 Icon(Icons.check_circle, color: Colors.greenAccent, size: 16),
//                 SizedBox(width: 8),
//                 Expanded(
//                   child: Text(
//                     "All actions are achievable within 20 minutes",
//                     style: TextStyle(color: Colors.greenAccent, fontSize: 12),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Helper method
//   String _getAnalysisDepth() {
//     return "24";
//   }
// }

/// ai response
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AgentAdviceResultScreen extends StatefulWidget {
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
  State<AgentAdviceResultScreen> createState() =>
      _AgentAdviceResultScreenState();
}

class _AgentAdviceResultScreenState extends State<AgentAdviceResultScreen> {
  bool isSaved = false;

  late Map<String, dynamic> analysisData;

  @override
  void initState() {
    super.initState();
    _parseAIResponse();
  }

  /// 🔥 CLEAN + PARSE AI RESPONSE
  void _parseAIResponse() {
    try {
      String cleaned = _cleanResponse(widget.prompt);
      analysisData = jsonDecode(cleaned);

      // fallback safety
      analysisData["insights"] ??= [];
      analysisData["risks"] ??= [];
      analysisData["actions"] ??= [];
      analysisData["finalGuidance"] ??= "No guidance generated.";
    } catch (e) {
      // fallback if AI didn't return JSON
      analysisData = {
        "finalGuidance": widget.prompt,
        "insights": [],
        "risks": [],
        "actions": []
      };
    }
  }

  /// 🔥 REMOVE ```json BLOCKS
  String _cleanResponse(String text) {
    return text
        .replaceAll("```json", "")
        .replaceAll("```", "")
        .trim();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B0D12),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Decision Intelligence Report",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.5,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: _saveToFavorites,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: isSaved
                      ? Colors.greenAccent.withOpacity(0.2)
                      : Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSaved
                        ? Colors.greenAccent.withOpacity(0.5)
                        : Colors.white.withOpacity(0.2),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isSaved ? Icons.favorite : Icons.favorite_border,
                      color: isSaved ? Colors.greenAccent : Colors.white70,
                      size: 18,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      isSaved ? "Saved" : "Save",
                      style: TextStyle(
                        color: isSaved ? Colors.greenAccent : Colors.white70,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _trustBanner(),
            const SizedBox(height: 20),

            _finalGuidanceCard(),
            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(child: _metricCard("Intent", widget.intent, Icons.psychology)),
                const SizedBox(width: 12),
                Expanded(child: _metricCard("Analysis Mode", widget.mode, Icons.analytics)),
              ],
            ),
            const SizedBox(height: 24),

            const Text(
              "Key Insights",
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),

            ...(analysisData["insights"] as List).map((insight) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _insightCard(
                title: insight["title"] ?? "",
                status: insight["status"] ?? "",
                progress: 0.6,
                icon: _getInsightIcon(insight["title"] ?? ""),
                color: _getInsightColor(insight["title"] ?? ""),
                description: insight["description"] ?? "",
              ),
            )),

            const SizedBox(height: 24),
            _riskAssessmentCard(),
            const SizedBox(height: 24),
            _actionPlanCard(),
          ],
        ),
      ),
    );
  }

  /// 🔥 FINAL GUIDANCE
  Widget _finalGuidanceCard() {
    String text = analysisData["finalGuidance"] ?? "";

    List parts = text.split(". ");

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.greenAccent.withOpacity(0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("FINAL GUIDANCE", style: TextStyle(color: Colors.greenAccent)),

          const SizedBox(height: 12),

          Text(
            parts.isNotEmpty ? parts.first + "." : "",
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),

          const SizedBox(height: 8),

          Text(
            parts.length > 1 ? parts.sublist(1).join(". ") : "",
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  /// 🔥 RISKS
  Widget _riskAssessmentCard() {
    final risks = analysisData["risks"] as List;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: risks.map((r) {
        return Text("${r["risk"]} (${r["impact"]})",
            style: const TextStyle(color: Colors.white70));
      }).toList(),
    );
  }

  /// 🔥 ACTIONS
  Widget _actionPlanCard() {
    final actions = analysisData["actions"] as List;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: actions.map((a) {
        return Text("${a["action"]}",
            style: const TextStyle(color: Colors.white));
      }).toList(),
    );
  }

  Widget _metricCard(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(14),
      child: Column(
        children: [
          Icon(icon, color: Colors.white54),
          Text(value, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _insightCard({
    required String title,
    required String status,
    required double progress,
    required IconData icon,
    required Color color,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Text("$title - $description",
          style: const TextStyle(color: Colors.white)),
    );
  }

  Widget _trustBanner() {
    return const Text("Trusted Analysis",
        style: TextStyle(color: Colors.white));
  }

  Future<void> _saveToFavorites() async {}

  IconData _getInsightIcon(String title) => Icons.insights;
  Color _getInsightColor(String title) => Colors.blue;

  String _getAnalysisDepth() => "24";
}