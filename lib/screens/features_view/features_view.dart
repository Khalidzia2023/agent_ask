// import 'package:flutter/material.dart';
// import 'dart:math' as math;
//
// import '../app_featrues/content_writer/content_writer.dart';
//
// class AiFeatureHub extends StatelessWidget {
//   const AiFeatureHub({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF06070A),
//       appBar: _buildGlassAppBar(),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Hero Section
//             _buildHeroSection(),
//             const SizedBox(height: 24),
//
//             // Feature Categories
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: _buildSectionHeader(
//                 title: "Explore AI Capabilities",
//                 subtitle: "Choose your intelligent companion",
//               ),
//             ),
//             const SizedBox(height: 20),
//
//             // Main Featured Cards
//             _buildFeaturedCardsGrid(context),
//             const SizedBox(height: 32),
//
//             // Quick Actions Section
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: _buildSectionHeader(
//                 title: "Quick Actions",
//                 subtitle: "Get things done faster",
//               ),
//             ),
//             const SizedBox(height: 16),
//             _buildQuickActionsRow(context),
//             const SizedBox(height: 32),
//
//             // Pro Tip Banner
//             _buildProTipBanner(context),
//             const SizedBox(height: 24),
//
//             // Recent Activity
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: _buildSectionHeader(
//                 title: "Recent Activity",
//                 subtitle: "Your latest AI interactions",
//               ),
//             ),
//             const SizedBox(height: 16),
//             _buildRecentActivityList(context),
//             const SizedBox(height: 80),
//           ],
//         ),
//       ),
//     );
//   }
//
//   PreferredSizeWidget _buildGlassAppBar() {
//     return AppBar(
//       backgroundColor: Colors.transparent,
//       elevation: 0,
//       flexibleSpace: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               const Color(0xFF06070A).withOpacity(0.95),
//               const Color(0xFF06070A).withOpacity(0.0),
//             ],
//           ),
//         ),
//       ),
//       title: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//         decoration: BoxDecoration(
//           color: Colors.white.withOpacity(0.05),
//           borderRadius: BorderRadius.circular(20),
//           border: Border.all(color: Colors.white.withOpacity(0.1)),
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               width: 8,
//               height: 8,
//               decoration: BoxDecoration(
//                 color: Colors.greenAccent,
//                 shape: BoxShape.circle,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.greenAccent.withOpacity(0.5),
//                     blurRadius: 8,
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(width: 8),
//             const Text(
//               "AI Feature Hub",
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//                 letterSpacing: -0.3,
//               ),
//             ),
//           ],
//         ),
//       ),
//       centerTitle: true,
//       actions: [
//         Container(
//           margin: const EdgeInsets.only(right: 16),
//           child: IconButton(
//             style: IconButton.styleFrom(
//               backgroundColor: Colors.white.withOpacity(0.05),
//               foregroundColor: Colors.white70,
//             ),
//             icon: const Icon(Icons.notifications_none),
//             onPressed: () {
//               // Show notifications
//             },
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildHeroSection() {
//     return Container(
//       margin: const EdgeInsets.all(20),
//       padding: const EdgeInsets.all(24),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             const Color(0xFF1A1F3A),
//             const Color(0xFF0F1119),
//           ],
//         ),
//         borderRadius: BorderRadius.circular(28),
//         border: Border.all(
//           color: Colors.white.withOpacity(0.08),
//           width: 1.5,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.blueAccent.withOpacity(0.1),
//             blurRadius: 30,
//             offset: const Offset(0, 10),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                   decoration: BoxDecoration(
//                     color: Colors.greenAccent.withOpacity(0.15),
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(color: Colors.greenAccent.withOpacity(0.3)),
//                   ),
//                   child: const Text(
//                     "POWERED BY GPT-4",
//                     style: TextStyle(
//                       color: Colors.greenAccent,
//                       fontSize: 10,
//                       fontWeight: FontWeight.w700,
//                       letterSpacing: 1,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 const Text(
//                   "Transform your ideas\ninto reality with AI",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 22,
//                     fontWeight: FontWeight.w700,
//                     height: 1.3,
//                     letterSpacing: -0.5,
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 const Text(
//                   "6 powerful AI tools at your fingertips",
//                   style: TextStyle(
//                     color: Colors.white54,
//                     fontSize: 13,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//                   decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(0.05),
//                     borderRadius: BorderRadius.circular(14),
//                   ),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       const Icon(Icons.bolt, color: Colors.amber, size: 16),
//                       const SizedBox(width: 6),
//                       Text(
//                         "125+ queries processed",
//                         style: TextStyle(
//                           color: Colors.white70,
//                           fontSize: 12,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 16),
//           Container(
//             width: 100,
//             height: 100,
//             decoration: BoxDecoration(
//               gradient: RadialGradient(
//                 colors: [
//                   Colors.blueAccent.withOpacity(0.3),
//                   Colors.transparent,
//                 ],
//               ),
//             ),
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 ...List.generate(3, (index) {
//                   return Positioned(
//                     child: TweenAnimationBuilder(
//                       tween: Tween<double>(begin: 0, end: 1),
//                       duration: Duration(milliseconds: 2000 + (index * 500)),
//                       builder: (context, value, child) {
//                         return Transform.scale(
//                           scale: value,
//                           child: Container(
//                             width: 60 - (index * 15),
//                             height: 60 - (index * 15),
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               border: Border.all(
//                                 color: Colors.white.withOpacity(0.1 - (index * 0.03)),
//                                 width: 1,
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   );
//                 }),
//                 const Icon(
//                   Icons.auto_awesome,
//                   size: 32,
//                   color: Colors.white,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSectionHeader({required String title, required String subtitle}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 20,
//             fontWeight: FontWeight.w700,
//             letterSpacing: -0.5,
//           ),
//         ),
//         const SizedBox(height: 6),
//         Text(
//           subtitle,
//           style: TextStyle(
//             color: Colors.white54,
//             fontSize: 13,
//             letterSpacing: -0.3,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildFeaturedCardsGrid(BuildContext context) {
//     final features = [
//       FeatureItem(
//         title: "AI Chat",
//         subtitle: "Smart conversations",
//         description: "Natural language processing",
//         icon: Icons.chat_bubble_outline,
//         gradient: const LinearGradient(
//           colors: [Color(0xFF2193B0), Color(0xFF6DD5ED)],
//         ),
//         stats: "2.3k chats",
//         color: Colors.blue,
//         onTap: () => _showComingSoon(context, "AI Chat"),
//       ),
//       FeatureItem(
//         title: "Content Writer",
//         subtitle: "Professional content",
//         description: "Blogs, emails, social posts",
//         icon: Icons.edit_note,
//         gradient: const LinearGradient(
//           colors: [Color(0xFF6B11FF), Color(0xFFA020F0)],
//         ),
//         stats: "1.2k articles",
//         color: Colors.purple,
//         onTap: () => _navigateToContentWriter(context),
//       ),
//       FeatureItem(
//         title: "Smart Summarizer",
//         subtitle: "TL;DR instantly",
//         description: "Videos, docs, podcasts",
//         icon: Icons.summarize,
//         gradient: const LinearGradient(
//           colors: [Color(0xFFF09819), Color(0xFFFF512F)],
//         ),
//         stats: "892 summaries",
//         color: Colors.orange,
//         onTap: () => _showComingSoon(context, "Smart Summarizer"),
//       ),
//       FeatureItem(
//         title: "AI Search",
//         subtitle: "Intelligent answers",
//         description: "Web + knowledge graph",
//         icon: Icons.search_rounded,
//         gradient: const LinearGradient(
//           colors: [Color(0xFF11998E), Color(0xFF38EF7D)],
//         ),
//         stats: "4.5k searches",
//         color: Colors.green,
//         onTap: () => _showComingSoon(context, "AI Search"),
//       ),
//       FeatureItem(
//         title: "Code Assistant",
//         subtitle: "Debug & generate",
//         description: "20+ languages supported",
//         icon: Icons.code_rounded,
//         gradient: const LinearGradient(
//           colors: [Color(0xFF1D976C), Color(0xFF93F9B9)],
//         ),
//         stats: "567 snippets",
//         color: Colors.teal,
//         onTap: () => _showComingSoon(context, "Code Assistant"),
//       ),
//       FeatureItem(
//         title: "Translator",
//         subtitle: "100+ languages",
//         description: "Real-time translation",
//         icon: Icons.translate,
//         gradient: const LinearGradient(
//           colors: [Color(0xFFE65C00), Color(0xFFF9D423)],
//         ),
//         stats: "342 translations",
//         color: Colors.redAccent,
//         onTap: () => _showComingSoon(context, "Translator"),
//       ),
//     ];
//
//     return GridView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 14,
//         mainAxisSpacing: 14,
//         childAspectRatio: 0.85,
//       ),
//       itemCount: features.length,
//       itemBuilder: (context, index) {
//         return _buildFeatureCard(context, features[index]);
//       },
//     );
//   }
//
//   Widget _buildFeatureCard(BuildContext context, FeatureItem feature) {
//     return GestureDetector(
//       onTap: feature.onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(24),
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               const Color(0xFF1A1F2E),
//               const Color(0xFF0F1119),
//             ],
//           ),
//           border: Border.all(
//             color: Colors.white.withOpacity(0.08),
//             width: 1,
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.3),
//               blurRadius: 20,
//               offset: const Offset(0, 8),
//             ),
//           ],
//         ),
//         child: Material(
//           color: Colors.transparent,
//           child: InkWell(
//             onTap: feature.onTap,
//             borderRadius: BorderRadius.circular(24),
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Icon with gradient background
//                   Container(
//                     width: 48,
//                     height: 48,
//                     decoration: BoxDecoration(
//                       gradient: feature.gradient,
//                       borderRadius: BorderRadius.circular(16),
//                       boxShadow: [
//                         BoxShadow(
//                           color: feature.color.withOpacity(0.3),
//                           blurRadius: 12,
//                           offset: const Offset(0, 4),
//                         ),
//                       ],
//                     ),
//                     child: Icon(
//                       feature.icon,
//                       color: Colors.white,
//                       size: 24,
//                     ),
//                   ),
//                   const SizedBox(height: 14),
//                   // Title
//                   Text(
//                     feature.title,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.w700,
//                       letterSpacing: -0.3,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   // Subtitle
//                   Text(
//                     feature.subtitle,
//                     style: TextStyle(
//                       color: Colors.white.withOpacity(0.6),
//                       fontSize: 11,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   // Description
//                   Text(
//                     feature.description,
//                     style: TextStyle(
//                       color: Colors.white.withOpacity(0.4),
//                       fontSize: 11,
//                       height: 1.3,
//                     ),
//                     maxLines: 2,
//                   ),
//                   const Spacer(),
//                   // Stats and arrow
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                         decoration: BoxDecoration(
//                           color: feature.color.withOpacity(0.1),
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Text(
//                           feature.stats,
//                           style: TextStyle(
//                             color: feature.color,
//                             fontSize: 10,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                       Container(
//                         padding: const EdgeInsets.all(6),
//                         decoration: BoxDecoration(
//                           color: Colors.white.withOpacity(0.05),
//                           shape: BoxShape.circle,
//                         ),
//                         child: const Icon(
//                           Icons.arrow_forward_rounded,
//                           size: 14,
//                           color: Colors.white54,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildQuickActionsRow(BuildContext context) {
//     final actions = [
//       {"icon": Icons.mic, "label": "Voice", "color": Colors.blueAccent, "feature": "Voice Input"},
//       {"icon": Icons.image, "label": "Image", "color": Colors.purpleAccent, "feature": "Image Analysis"},
//       {"icon": Icons.link, "label": "Link", "color": Colors.greenAccent, "feature": "Link Summary"},
//       {"icon": Icons.file_copy, "label": "File", "color": Colors.orangeAccent, "feature": "File Processing"},
//     ];
//
//     return SizedBox(
//       height: 100,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         itemCount: actions.length,
//         itemBuilder: (context, index) {
//           final action = actions[index];
//           return GestureDetector(
//             onTap: () => _showComingSoon(context, action["feature"] as String),
//             child: Container(
//               width: 80,
//               margin: const EdgeInsets.only(right: 12),
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0.03),
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border.all(color: Colors.white.withOpacity(0.05)),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [
//                           (action["color"] as Color).withOpacity(0.2),
//                           (action["color"] as Color).withOpacity(0.05),
//                         ],
//                       ),
//                       shape: BoxShape.circle,
//                     ),
//                     child: Icon(
//                       action["icon"] as IconData,
//                       color: action["color"] as Color,
//                       size: 24,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     action["label"] as String,
//                     style: TextStyle(
//                       color: Colors.white70,
//                       fontSize: 12,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildProTipBanner(BuildContext context) {
//     return GestureDetector(
//       onTap: () => _showComingSoon(context, "Productivity Tips"),
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 20),
//         padding: const EdgeInsets.all(18),
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               const Color(0xFF2D1B4E),
//               const Color(0xFF1A1F3A),
//             ],
//           ),
//           borderRadius: BorderRadius.circular(20),
//           border: Border.all(
//             color: Colors.amber.withOpacity(0.3),
//             width: 1.5,
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.amber.withOpacity(0.1),
//               blurRadius: 15,
//               offset: const Offset(0, 5),
//             ),
//           ],
//         ),
//         child: Row(
//           children: [
//             Container(
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: Colors.amber.withOpacity(0.15),
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: const Icon(
//                 Icons.auto_awesome,
//                 color: Colors.amber,
//                 size: 24,
//               ),
//             ),
//             const SizedBox(width: 14),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "✨ Pro Productivity Tip",
//                     style: TextStyle(
//                       color: Colors.amber,
//                       fontWeight: FontWeight.w700,
//                       fontSize: 13,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   const Text(
//                     "Combine AI Chat + Summarizer for 2x faster research",
//                     style: TextStyle(
//                       color: Colors.white70,
//                       fontSize: 13,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0.05),
//                 shape: BoxShape.circle,
//               ),
//               child: const Icon(
//                 Icons.chevron_right,
//                 color: Colors.white54,
//                 size: 20,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildRecentActivityList(BuildContext context) {
//     final activities = [
//       {"title": "Summarized 3 research papers", "time": "2 hours ago", "icon": Icons.summarize, "feature": "Smart Summarizer"},
//       {"title": "Generated blog post outline", "time": "Yesterday", "icon": Icons.edit_note, "feature": "Content Writer"},
//       {"title": "Translated document to Spanish", "time": "Yesterday", "icon": Icons.translate, "feature": "Translator"},
//     ];
//
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       itemCount: activities.length,
//       itemBuilder: (context, index) {
//         final activity = activities[index];
//         return GestureDetector(
//           onTap: () {
//             if (activity["feature"] == "Content Writer") {
//               _navigateToContentWriter(context);
//             } else {
//               _showComingSoon(context, activity["feature"] as String);
//             }
//           },
//           child: Container(
//             margin: const EdgeInsets.only(bottom: 12),
//             padding: const EdgeInsets.all(14),
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.02),
//               borderRadius: BorderRadius.circular(16),
//               border: Border.all(color: Colors.white.withOpacity(0.05)),
//             ),
//             child: Row(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(0.05),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Icon(
//                     activity["icon"] as IconData,
//                     color: Colors.white54,
//                     size: 20,
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         activity["title"] as String,
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         activity["time"] as String,
//                         style: TextStyle(
//                           color: Colors.white38,
//                           fontSize: 11,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Icon(Icons.play_circle_outline, color: Colors.white38, size: 18),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   // Navigation Methods
//   void _navigateToContentWriter(BuildContext context) {
//     Navigator.push(
//       context,
//       PageRouteBuilder(
//         pageBuilder: (context, animation, secondaryAnimation) =>  ContentWriterScreen(),
//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           const begin = Offset(1.0, 0.0);
//           const end = Offset.zero;
//           const curve = Curves.easeInOutCubic;
//           var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//           var offsetAnimation = animation.drive(tween);
//           return SlideTransition(position: offsetAnimation, child: child);
//         },
//         transitionDuration: const Duration(milliseconds: 400),
//       ),
//     );
//   }
//
//   void _showComingSoon(BuildContext context, String featureName) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Row(
//           children: [
//             const Icon(Icons.construction, color: Colors.amber, size: 20),
//             const SizedBox(width: 12),
//             Expanded(
//               child: Text(
//                 "$featureName coming soon! 🚀",
//                 style: const TextStyle(fontSize: 14),
//               ),
//             ),
//           ],
//         ),
//         backgroundColor: const Color(0xFF1A1F2E),
//         behavior: SnackBarBehavior.floating,
//         duration: const Duration(seconds: 2),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//           side: BorderSide(color: Colors.amber.withOpacity(0.3)),
//         ),
//       ),
//     );
//   }
//
//   void _showNotificationComingSoon(BuildContext context) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text("🔔 Notifications feature coming soon!"),
//         backgroundColor: Color(0xFF1A1F2E),
//         behavior: SnackBarBehavior.floating,
//         duration: Duration(seconds: 2),
//       ),
//     );
//   }
// }
//
// // Updated FeatureItem class with onTap callback
// class FeatureItem {
//   final String title;
//   final String subtitle;
//   final String description;
//   final IconData icon;
//   final Gradient gradient;
//   final String stats;
//   final Color color;
//   final VoidCallback onTap;
//
//   FeatureItem({
//     required this.title,
//     required this.subtitle,
//     required this.description,
//     required this.icon,
//     required this.gradient,
//     required this.stats,
//     required this.color,
//     required this.onTap,
//   });
// }

/// added assignments & quiz portion
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../app_featrues/content_writer/content_writer.dart';

class AiFeatureHub extends StatelessWidget {
  const AiFeatureHub({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF06070A),
      appBar: _buildGlassAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Section
            _buildHeroSection(),
            const SizedBox(height: 24),

            // Feature Categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildSectionHeader(
                title: "Explore AI Capabilities",
                subtitle: "Choose your intelligent companion",
              ),
            ),
            const SizedBox(height: 20),

            // Main Featured Cards
            _buildFeaturedCardsGrid(context),
            const SizedBox(height: 32),

            // Quick Actions Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildSectionHeader(
                title: "Quick Actions",
                subtitle: "Get things done faster",
              ),
            ),
            const SizedBox(height: 16),
            _buildQuickActionsRow(context),
            const SizedBox(height: 32),

            // Pro Tip Banner
            _buildProTipBanner(context),
            const SizedBox(height: 24),

            // Recent Activity
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildSectionHeader(
                title: "Recent Activity",
                subtitle: "Your latest AI interactions",
              ),
            ),
            const SizedBox(height: 16),
            _buildRecentActivityList(context),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildGlassAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF06070A).withOpacity(0.95),
              const Color(0xFF06070A).withOpacity(0.0),
            ],
          ),
        ),
      ),
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.greenAccent.withOpacity(0.5),
                    blurRadius: 8,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              "AI Feature Hub",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.3,
              ),
            ),
          ],
        ),
      ),
      centerTitle: true,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 16),
          child: IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white.withOpacity(0.05),
              foregroundColor: Colors.white70,
            ),
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              // _showNotificationComingSoon(context);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildHeroSection() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF1A1F3A),
            const Color(0xFF0F1119),
          ],
        ),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: Colors.white.withOpacity(0.08),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withOpacity(0.1),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.greenAccent.withOpacity(0.3)),
                  ),
                  child: const Text(
                    "POWERED BY GPT-4",
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Transform your ideas\ninto reality with AI",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    height: 1.3,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "8 powerful AI tools at your fingertips",
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.bolt, color: Colors.amber, size: 16),
                      const SizedBox(width: 6),
                      Text(
                        "125+ queries processed",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Colors.blueAccent.withOpacity(0.3),
                  Colors.transparent,
                ],
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                ...List.generate(3, (index) {
                  return Positioned(
                    child: TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: 1),
                      duration: Duration(milliseconds: 2000 + (index * 500)),
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: value,
                          child: Container(
                            width: 60 - (index * 15),
                            height: 60 - (index * 15),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white.withOpacity(0.1 - (index * 0.03)),
                                width: 1,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
                const Icon(
                  Icons.auto_awesome,
                  size: 32,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader({required String title, required String subtitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          subtitle,
          style: TextStyle(
            color: Colors.white54,
            fontSize: 13,
            letterSpacing: -0.3,
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturedCardsGrid(BuildContext context) {
    final features = [
      FeatureItem(
        title: "AI Chat",
        subtitle: "Smart conversations",
        description: "Natural language processing",
        icon: Icons.chat_bubble_outline,
        gradient: const LinearGradient(
          colors: [Color(0xFF2193B0), Color(0xFF6DD5ED)],
        ),
        stats: "2.3k chats",
        color: Colors.blue,
        onTap: () => _showComingSoon(context, "AI Chat"),
      ),
      FeatureItem(
        title: "Content Writer",
        subtitle: "Professional content",
        description: "Blogs, emails, social posts",
        icon: Icons.edit_note,
        gradient: const LinearGradient(
          colors: [Color(0xFF6B11FF), Color(0xFFA020F0)],
        ),
        stats: "1.2k articles",
        color: Colors.purple,
        onTap: () => _navigateToContentWriter(context),
      ),
      // NEW FEATURE 1: Assignment Helper
      FeatureItem(
        title: "Assignment Helper",
        subtitle: "Academic excellence",
        description: "Research papers, essays, problem sets, and homework assistance",
        icon: Icons.assignment_turned_in,
        gradient: const LinearGradient(
          colors: [Color(0xFF00B4DB), Color(0xFF0083B0)],
        ),
        stats: "856 assignments",
        color: Colors.cyan,
        onTap: () => _showComingSoonWithExtended(context, "Assignment Helper",
            "Upload files, paste text, or describe your assignment. AI will help with research, structure, citations, and problem-solving."),
      ),
      // NEW FEATURE 2: Quiz Generator
      FeatureItem(
        title: "Quiz Generator",
        subtitle: "Smart assessment",
        description: "MCQs, short questions, numericals from any material",
        icon: Icons.quiz,
        gradient: const LinearGradient(
          colors: [Color(0xFFF12711), Color(0xFFF5AF19)],
        ),
        stats: "423 quizzes",
        color: Colors.deepOrange,
        onTap: () => _showQuizGeneratorDialog(context),
      ),
      FeatureItem(
        title: "Smart Summarizer",
        subtitle: "TL;DR instantly",
        description: "Videos, docs, podcasts",
        icon: Icons.summarize,
        gradient: const LinearGradient(
          colors: [Color(0xFFF09819), Color(0xFFFF512F)],
        ),
        stats: "892 summaries",
        color: Colors.orange,
        onTap: () => _showComingSoon(context, "Smart Summarizer"),
      ),
      FeatureItem(
        title: "AI Search",
        subtitle: "Intelligent answers",
        description: "Web + knowledge graph",
        icon: Icons.search_rounded,
        gradient: const LinearGradient(
          colors: [Color(0xFF11998E), Color(0xFF38EF7D)],
        ),
        stats: "4.5k searches",
        color: Colors.green,
        onTap: () => _showComingSoon(context, "AI Search"),
      ),
      FeatureItem(
        title: "Code Assistant",
        subtitle: "Debug & generate",
        description: "20+ languages supported",
        icon: Icons.code_rounded,
        gradient: const LinearGradient(
          colors: [Color(0xFF1D976C), Color(0xFF93F9B9)],
        ),
        stats: "567 snippets",
        color: Colors.teal,
        onTap: () => _showComingSoon(context, "Code Assistant"),
      ),
      FeatureItem(
        title: "Translator",
        subtitle: "100+ languages",
        description: "Real-time translation",
        icon: Icons.translate,
        gradient: const LinearGradient(
          colors: [Color(0xFFE65C00), Color(0xFFF9D423)],
        ),
        stats: "342 translations",
        color: Colors.redAccent,
        onTap: () => _showComingSoon(context, "Translator"),
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: 0.85,
      ),
      itemCount: features.length,
      itemBuilder: (context, index) {
        return _buildFeatureCard(context, features[index]);
      },
    );
  }

  Widget _buildFeatureCard(BuildContext context, FeatureItem feature) {
    return GestureDetector(
      onTap: feature.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF1A1F2E),
              const Color(0xFF0F1119),
            ],
          ),
          border: Border.all(
            color: Colors.white.withOpacity(0.08),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: feature.onTap,
            borderRadius: BorderRadius.circular(24),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icon with gradient background
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      gradient: feature.gradient,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: feature.color.withOpacity(0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(
                      feature.icon,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(height: 14),
                  // Title
                  Text(
                    feature.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.3,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Subtitle
                  Text(
                    feature.subtitle,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Description
                  Text(
                    feature.description,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.4),
                      fontSize: 11,
                      height: 1.3,
                    ),
                    maxLines: 2,
                  ),
                  const Spacer(),
                  // Stats and arrow
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: feature.color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          feature.stats,
                          style: TextStyle(
                            color: feature.color,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.05),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_forward_rounded,
                          size: 14,
                          color: Colors.white54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActionsRow(BuildContext context) {
    final actions = [
      {"icon": Icons.mic, "label": "Voice", "color": Colors.blueAccent, "feature": "Voice Input"},
      {"icon": Icons.image, "label": "Image", "color": Colors.purpleAccent, "feature": "Image Analysis"},
      {"icon": Icons.link, "label": "Link", "color": Colors.greenAccent, "feature": "Link Summary"},
      {"icon": Icons.file_copy, "label": "File", "color": Colors.orangeAccent, "feature": "File Processing"},
      {"icon": Icons.school, "label": "Homework", "color": Colors.cyanAccent, "feature": "Assignment Helper"},
      {"icon": Icons.quiz, "label": "Quiz", "color": Colors.redAccent, "feature": "Quiz Generator"},
    ];

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: actions.length,
        itemBuilder: (context, index) {
          final action = actions[index];
          return GestureDetector(
            onTap: () {
              if (action["feature"] == "Assignment Helper") {
                _showComingSoonWithExtended(context, "Assignment Helper",
                    "Upload files, paste text, or describe your assignment. AI will help with research, structure, citations, and problem-solving.");
              } else if (action["feature"] == "Quiz Generator") {
                _showQuizGeneratorDialog(context);
              } else {
                _showComingSoon(context, action["feature"] as String);
              }
            },
            child: Container(
              width: 80,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.03),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withOpacity(0.05)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          (action["color"] as Color).withOpacity(0.2),
                          (action["color"] as Color).withOpacity(0.05),
                        ],
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      action["icon"] as IconData,
                      color: action["color"] as Color,
                      size: 24,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    action["label"] as String,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProTipBanner(BuildContext context) {
    return GestureDetector(
      onTap: () => _showComingSoon(context, "Productivity Tips"),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF2D1B4E),
              const Color(0xFF1A1F3A),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.amber.withOpacity(0.3),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.amber.withOpacity(0.1),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.15),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.auto_awesome,
                color: Colors.amber,
                size: 24,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "✨ Pro Productivity Tip",
                    style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Use Assignment Helper + Quiz Generator to study smarter!",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.chevron_right,
                color: Colors.white54,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentActivityList(BuildContext context) {
    final activities = [
      {"title": "Generated practice quiz for Physics", "time": "1 hour ago", "icon": Icons.quiz, "feature": "Quiz Generator"},
      {"title": "Summarized 3 research papers", "time": "2 hours ago", "icon": Icons.summarize, "feature": "Smart Summarizer"},
      {"title": "Generated blog post outline", "time": "Yesterday", "icon": Icons.edit_note, "feature": "Content Writer"},
      {"title": "Assignment help: Calculus problems", "time": "Yesterday", "icon": Icons.assignment_turned_in, "feature": "Assignment Helper"},
      {"title": "Translated document to Spanish", "time": "Yesterday", "icon": Icons.translate, "feature": "Translator"},
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: activities.length,
      itemBuilder: (context, index) {
        final activity = activities[index];
        return GestureDetector(
          onTap: () {
            if (activity["feature"] == "Content Writer") {
              _navigateToContentWriter(context);
            } else if (activity["feature"] == "Assignment Helper") {
              _showComingSoonWithExtended(context, "Assignment Helper",
                  "Upload files, paste text, or describe your assignment. AI will help with research, structure, citations, and problem-solving.");
            } else if (activity["feature"] == "Quiz Generator") {
              _showQuizGeneratorDialog(context);
            } else {
              _showComingSoon(context, activity["feature"] as String);
            }
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.02),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withOpacity(0.05)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    activity["icon"] as IconData,
                    color: Colors.white54,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        activity["title"] as String,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        activity["time"] as String,
                        style: TextStyle(
                          color: Colors.white38,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.play_circle_outline, color: Colors.white38, size: 18),
              ],
            ),
          ),
        );
      },
    );
  }

  // Enhanced dialog for Assignment Helper
  void _showComingSoonWithExtended(BuildContext context, String featureName, String description) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Color(0xFF1A1F2E),
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: featureName == "Assignment Helper"
                          ? [Colors.cyan, Colors.blue]
                          : [Colors.deepOrange, Colors.red],
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    featureName == "Assignment Helper"
                        ? Icons.assignment_turned_in
                        : Icons.quiz,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    featureName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white54),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              description,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            // Input options preview
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white.withOpacity(0.1)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.upload_file, color: Colors.cyan, size: 20),
                      const SizedBox(width: 12),
                      const Text(
                        "Upload documents (PDF, DOC, PPT, Images)",
                        style: TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.text_fields, color: Colors.cyan, size: 20),
                      const SizedBox(width: 12),
                      const Text(
                        "Paste text or type your topic",
                        style: TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.link, color: Colors.cyan, size: 20),
                      const SizedBox(width: 12),
                      const Text(
                        "Share links to slides or resources",
                        style: TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: featureName == "Assignment Helper"
                      ? Colors.cyan
                      : Colors.deepOrange,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  _showComingSoon(context, "$featureName - Full features coming soon! 🚀");
                },
                child: const Text(
                  "Get Started",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  // Quiz Generator specific dialog with question type options
  void _showQuizGeneratorDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Color(0xFF1A1F2E),
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFF12711), Color(0xFFF5AF19)],
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(Icons.quiz, color: Colors.white),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Text(
                    "AI Quiz Generator",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white54),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "Upload your study materials (PDF, PPT, DOC, Images) or paste text, and AI will generate:",
              style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.5),
            ),
            const SizedBox(height: 20),
            // Question types
            _buildQuestionTypeTile(
              icon: Icons.radio_button_checked,
              title: "Multiple Choice Questions (MCQs)",
              color: Colors.blue,
            ),
            const SizedBox(height: 12),
            _buildQuestionTypeTile(
              icon: Icons.short_text,
              title: "Short Questions & Answers",
              color: Colors.green,
            ),
            const SizedBox(height: 12),
            _buildQuestionTypeTile(
              icon: Icons.calculate,
              title: "Numerical & Mathematical Problems",
              color: Colors.orange,
            ),
            const SizedBox(height: 12),
            _buildQuestionTypeTile(
              icon: Icons.checklist,
              title: "Practical Application Questions",
              color: Colors.purple,
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.amber.withOpacity(0.3)),
              ),
              child: const Row(
                children: [
                  Icon(Icons.lightbulb, color: Colors.amber, size: 20),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Perfect for exam preparation! AI creates a complete test paper with answer key",
                      style: TextStyle(color: Colors.amber, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  _showComingSoon(context, "Quiz Generator - Full features coming soon! 🚀\n\nAI will generate:\n• MCQs with 4 options & answers\n• Short questions with model answers\n• Numerical problems with step-by-step solutions\n• Practical questions with real-world scenarios");
                },
                child: const Text(
                  "Generate Quiz Now",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionTypeTile({
    required IconData icon,
    required String title,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 13),
          ),
        ],
      ),
    );
  }

  // Navigation Methods
  void _navigateToContentWriter(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const ContentWriterScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOutCubic;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(position: offsetAnimation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 400),
      ),
    );
  }

  void _showComingSoon(BuildContext context, String featureName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.construction, color: Colors.amber, size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                featureName,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF1A1F2E),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.amber.withOpacity(0.3)),
        ),
      ),
    );
  }

  void _showNotificationComingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("🔔 Notifications feature coming soon!"),
        backgroundColor: Color(0xFF1A1F2E),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
      ),
    );
  }
}

// Updated FeatureItem class with onTap callback
class FeatureItem {
  final String title;
  final String subtitle;
  final String description;
  final IconData icon;
  final Gradient gradient;
  final String stats;
  final Color color;
  final VoidCallback onTap;

  FeatureItem({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
    required this.gradient,
    required this.stats,
    required this.color,
    required this.onTap,
  });
}