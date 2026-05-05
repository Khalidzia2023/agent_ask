import 'package:flutter/material.dart';

class ContentWriterScreen extends StatefulWidget {
  const ContentWriterScreen({super.key});

  @override
  State<ContentWriterScreen> createState() => _ContentWriterScreenState();
}

class _ContentWriterScreenState extends State<ContentWriterScreen> {
  int currentStep = 0;
  final PageController _pageController = PageController();

  // Content Preferences
  ContentType? selectedContentType;
  String topic = '';
  String selectedPlatform = '';
  String targetAudience = '';
  ToneType? selectedTone;
  int wordCount = 500;
  List<String> keywords = [];
  String keywordInput = '';
  String additionalContext = '';
  bool includeSEO = true;
  bool includeEmojis = false;
  String selectedLanguage = 'English';
  String selectedExpertise = 'Intermediate';
  String selectedGoal = 'Inform';
  List<String> selectedFormats = [];

  final List<String> platforms = [
    'Blog/Website', 'LinkedIn', 'Twitter/X', 'Instagram',
    'Facebook', 'Email Newsletter', 'YouTube Script', 'TikTok'
  ];

  final List<String> audiences = [
    'Beginners', 'Professionals', 'Students', 'Executives',
    'General Public', 'Niche Experts', 'Content Creators', 'Developers'
  ];

  final List<String> languages = ['English', 'Spanish', 'French', 'German', 'Japanese', 'Chinese'];
  final List<String> expertise = ['Beginner', 'Intermediate', 'Advanced', 'Expert'];
  final List<String> goals = ['Inform', 'Persuade', 'Entertain', 'Sell', 'Educate', 'Inspire'];
  final List<String> contentFormats = ['Article', 'Listicle', 'How-to Guide', 'Case Study', 'Tutorial', 'Review'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF06070A),
      appBar: _buildAppBar(),
      body: Column(
        children: [
          // Progress Indicator
          _buildProgressIndicator(),

          // Main Content
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  currentStep = index;
                });
              },
              children: [
                _buildContentTypeStep(),
                _buildTopicAndPlatformStep(),
                _buildAudienceAndToneStep(),
                _buildAdvancedPreferencesStep(),
                _buildReviewAndGenerateStep(),
              ],
            ),
          ),

          // Navigation Buttons
          _buildNavigationButtons(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.arrow_back, color: Colors.white70, size: 20),
        ),
      ),
      title: Column(
        children: [
          const Text(
            "Content Creator Studio",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.3,
            ),
          ),
          Text(
            "Step ${currentStep + 1} of 5",
            style: TextStyle(
              color: Colors.white54,
              fontSize: 11,
            ),
          ),
        ],
      ),
      centerTitle: true,
      actions: [
        TextButton(
          onPressed: () => _resetForm(),
          child: Text(
            "Reset",
            style: TextStyle(
              color: Colors.white54,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProgressIndicator() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(5, (index) {
              bool isActive = index <= currentStep;
              return Expanded(
                child: Container(
                  height: 3,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    gradient: isActive
                        ? const LinearGradient(
                      colors: [Color(0xFF6B11FF), Color(0xFFA020F0)],
                    )
                        : null,
                    color: isActive ? null : Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStepLabel(0, "Type", currentStep >= 0),
              _buildStepLabel(1, "Topic", currentStep >= 1),
              _buildStepLabel(2, "Audience", currentStep >= 2),
              _buildStepLabel(3, "Advanced", currentStep >= 3),
              _buildStepLabel(4, "Generate", currentStep >= 4),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStepLabel(int step, String label, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isActive ? Colors.white.withOpacity(0.05) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? Colors.white70 : Colors.white24,
          fontSize: 11,
          fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    );
  }

  // Step 1: Content Type Selection
  Widget _buildContentTypeStep() {
    final contentTypes = [
      ContentType(
        name: "Blog Article",
        icon: Icons.article,
        description: "Long-form, SEO-optimized blog posts",
        color: Colors.blueAccent,
      ),
      ContentType(
        name: "Social Media",
        icon: Icons.share,
        description: "Posts for social platforms",
        color: Colors.purpleAccent,
      ),
      ContentType(
        name: "Email Campaign",
        icon: Icons.email,
        description: "Newsletters & marketing emails",
        color: Colors.greenAccent,
      ),
      ContentType(
        name: "Copywriting",
        icon: Icons.mic,
        description: "Sales copy & ad content",
        color: Colors.orangeAccent,
      ),
      ContentType(
        name: "Technical Docs",
        icon: Icons.code,
        description: "Documentation & technical writing",
        color: Colors.tealAccent,
      ),
      ContentType(
        name: "Script/Voiceover",
        icon: Icons.play_circle,
        description: "Video scripts & voiceovers",
        color: Colors.redAccent,
      ),
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "What type of content do you want to create?",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Select the format that best matches your needs",
            style: TextStyle(
              color: Colors.white54,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 24),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.1,
            ),
            itemCount: contentTypes.length,
            itemBuilder: (context, index) {
              final type = contentTypes[index];
              final isSelected = selectedContentType?.name == type.name;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedContentType = type;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: isSelected
                        ? LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        type.color.withOpacity(0.3),
                        type.color.withOpacity(0.1),
                      ],
                    )
                        : const LinearGradient(
                      colors: [Color(0xFF1A1F2E), Color(0xFF0F1119)],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected
                          ? type.color.withOpacity(0.5)
                          : Colors.white.withOpacity(0.08),
                      width: isSelected ? 2 : 1,
                    ),
                    boxShadow: isSelected
                        ? [
                      BoxShadow(
                        color: type.color.withOpacity(0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ]
                        : [],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: type.color.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(
                            type.icon,
                            color: type.color,
                            size: 32,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          type.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          type.description,
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // Step 2: Topic and Platform
  Widget _buildTopicAndPlatformStep() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "What's your content about?",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Define your topic and where it will be published",
            style: TextStyle(
              color: Colors.white54,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 24),

          // Topic Input
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.03),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.08)),
            ),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              onChanged: (value) => topic = value,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "e.g., 'The Future of AI in Healthcare'",
                hintStyle: TextStyle(color: Colors.white38),
                labelText: "Content Topic *",
                labelStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(16),
                prefixIcon: const Icon(Icons.topic, color: Colors.purpleAccent),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Platform Selection
          Text(
            "Select Platform",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: platforms.map((platform) {
              final isSelected = selectedPlatform == platform;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedPlatform = platform;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Colors.purpleAccent.withOpacity(0.2)
                        : Colors.white.withOpacity(0.03),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: isSelected
                          ? Colors.purpleAccent.withOpacity(0.5)
                          : Colors.white.withOpacity(0.08),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _getPlatformIcon(platform),
                        size: 16,
                        color: isSelected ? Colors.purpleAccent : Colors.white54,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        platform,
                        style: TextStyle(
                          color: isSelected ? Colors.purpleAccent : Colors.white70,
                          fontSize: 13,
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 20),

          // Keywords section
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.03),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.08)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.key, color: Colors.orangeAccent, size: 20),
                    const SizedBox(width: 8),
                    const Text(
                      "Keywords (Optional)",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    ...keywords.map((keyword) => Chip(
                      label: Text(keyword),
                      onDeleted: () {
                        setState(() {
                          keywords.remove(keyword);
                        });
                      },
                      backgroundColor: Colors.purpleAccent.withOpacity(0.2),
                      labelStyle: const TextStyle(color: Colors.white),
                      deleteIcon: const Icon(Icons.close, size: 16, color: Colors.white54),
                    )),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        onChanged: (value) => keywordInput = value,
                        decoration: InputDecoration(
                          hintText: "Add keywords...",
                          hintStyle: TextStyle(color: Colors.white38),
                          border: InputBorder.none,
                          isDense: true,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (keywordInput.isNotEmpty) {
                          setState(() {
                            keywords.add(keywordInput);
                            keywordInput = '';
                          });
                        }
                      },
                      icon: const Icon(Icons.add_circle, color: Colors.purpleAccent),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Step 3: Audience and Tone
  Widget _buildAudienceAndToneStep() {
    final tones = [
      ToneType(name: "Professional", icon: Icons.business, color: Colors.blueAccent),
      ToneType(name: "Casual", icon: Icons.people, color: Colors.greenAccent),
      ToneType(name: "Humorous", icon: Icons.emoji_emotions, color: Colors.orangeAccent),
      ToneType(name: "Inspirational", icon: Icons.auto_awesome, color: Colors.purpleAccent),
      ToneType(name: "Educational", icon: Icons.school, color: Colors.tealAccent),
      ToneType(name: "Persuasive", icon: Icons.trending_up, color: Colors.redAccent),
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Who are you writing for?",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Define your audience and writing style",
            style: TextStyle(
              color: Colors.white54,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 24),

          // Target Audience
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.03),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.08)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Target Audience",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: audiences.map((audience) {
                    final isSelected = targetAudience == audience;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          targetAudience = audience;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.greenAccent.withOpacity(0.2)
                              : Colors.white.withOpacity(0.03),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isSelected
                                ? Colors.greenAccent.withOpacity(0.5)
                                : Colors.white.withOpacity(0.08),
                          ),
                        ),
                        child: Text(
                          audience,
                          style: TextStyle(
                            color: isSelected ? Colors.greenAccent : Colors.white70,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Writing Tone
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.03),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.08)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Writing Tone",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: tones.map((tone) {
                    final isSelected = selectedTone?.name == tone.name;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTone = tone;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          gradient: isSelected
                              ? LinearGradient(
                            colors: [tone.color.withOpacity(0.3), tone.color.withOpacity(0.1)],
                          )
                              : null,
                          color: isSelected ? null : Colors.white.withOpacity(0.03),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: isSelected ? tone.color.withOpacity(0.5) : Colors.white.withOpacity(0.08),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(tone.icon, size: 18, color: isSelected ? tone.color : Colors.white54),
                            const SizedBox(width: 8),
                            Text(
                              tone.name,
                              style: TextStyle(
                                color: isSelected ? tone.color : Colors.white70,
                                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Step 4: Advanced Preferences
  Widget _buildAdvancedPreferencesStep() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Advanced Settings",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Fine-tune your content with these options",
            style: TextStyle(
              color: Colors.white54,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 24),

          // Word Count Slider
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.03),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.08)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Word Count",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.purpleAccent.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "$wordCount words",
                        style: const TextStyle(
                          color: Colors.purpleAccent,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                Slider(
                  value: wordCount.toDouble(),
                  min: 100,
                  max: 3000,
                  divisions: 29,
                  activeColor: Colors.purpleAccent,
                  inactiveColor: Colors.white24,
                  onChanged: (value) {
                    setState(() {
                      wordCount = value.toInt();
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Language and Expertise
          Row(
            children: [
              Expanded(
                child: _buildDropdownField(
                  "Language",
                  selectedLanguage,
                  languages,
                      (value) => setState(() => selectedLanguage = value),
                  Icons.language,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildDropdownField(
                  "Expertise Level",
                  selectedExpertise,
                  expertise,
                      (value) => setState(() => selectedExpertise = value),
                  Icons.school,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Content Goal
          _buildDropdownField(
            "Content Goal",
            selectedGoal,
            goals,
                (value) => setState(() => selectedGoal = value),
            Icons.flag,
          ),
          const SizedBox(height: 16),

          // Content Format
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.03),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.08)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Content Format",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: contentFormats.map((format) {
                    final isSelected = selectedFormats.contains(format);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedFormats.remove(format);
                          } else {
                            selectedFormats.add(format);
                          }
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.blueAccent.withOpacity(0.2)
                              : Colors.white.withOpacity(0.03),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isSelected
                                ? Colors.blueAccent.withOpacity(0.5)
                                : Colors.white.withOpacity(0.08),
                          ),
                        ),
                        child: Text(
                          format,
                          style: TextStyle(
                            color: isSelected ? Colors.blueAccent : Colors.white70,
                            fontSize: 13,
                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Additional Context
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.03),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.08)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Additional Context",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  style: const TextStyle(color: Colors.white),
                  onChanged: (value) => additionalContext = value,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: "Any specific points you want to include? Call to action? Reference materials?",
                    hintStyle: TextStyle(color: Colors.white38),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.05),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Toggle Options
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.03),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.08)),
            ),
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text("SEO Optimization"),
                  subtitle: const Text("Include keywords and meta descriptions"),
                  value: includeSEO,
                  onChanged: (value) => setState(() => includeSEO = value),
                  activeColor: Colors.purpleAccent,
                  secondary: const Icon(Icons.search, color: Colors.orangeAccent),
                ),
                SwitchListTile(
                  title: const Text("Include Emojis"),
                  subtitle: const Text("Add relevant emojis to engage readers"),
                  value: includeEmojis,
                  onChanged: (value) => setState(() => includeEmojis = value),
                  activeColor: Colors.purpleAccent,
                  secondary: const Icon(Icons.emoji_emotions, color: Colors.amber),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Step 5: Review and Generate
  Widget _buildReviewAndGenerateStep() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Review Your Preferences",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Double-check everything before generation",
            style: TextStyle(
              color: Colors.white54,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 24),

          // Summary Cards
          _buildSummaryCard(
            "Content Type",
            selectedContentType?.name ?? "Not selected",
            Icons.article,
            Colors.blueAccent,
          ),
          const SizedBox(height: 12),
          _buildSummaryCard(
            "Topic & Platform",
            "$topic on $selectedPlatform",
            Icons.topic,
            Colors.purpleAccent,
          ),
          const SizedBox(height: 12),
          _buildSummaryCard(
            "Audience & Tone",
            "$targetAudience • ${selectedTone?.name ?? "Not selected"}",
            Icons.people,
            Colors.greenAccent,
          ),
          const SizedBox(height: 12),
          _buildSummaryCard(
            "Content Specs",
            "$wordCount words • $selectedLanguage • $selectedExpertise level",
            Icons.settings,
            Colors.orangeAccent,
          ),
          const SizedBox(height: 12),
          _buildSummaryCard(
            "Additional",
            "SEO: ${includeSEO ? 'Yes' : 'No'} • Emojis: ${includeEmojis ? 'Yes' : 'No'}",
            Icons.info,
            Colors.tealAccent,
          ),

          const SizedBox(height: 24),

          // Generate Button
          Container(
            width: double.infinity,
            height: 56,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF6B11FF), Color(0xFFA020F0)],
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.purpleAccent.withOpacity(0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: _generateContent,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.auto_awesome, color: Colors.white, size: 20),
                  SizedBox(width: 10),
                  Text(
                    "Generate Content Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.check_circle, color: color, size: 20),
        ],
      ),
    );
  }

  Widget _buildDropdownField(
      String label,
      String value,
      List<String> items,
      Function(String) onChanged,
      IconData icon,
      ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        dropdownColor: const Color(0xFF1A1F2E),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white54),
          border: InputBorder.none,
          icon: Icon(icon, color: Colors.purpleAccent),
        ),
        style: const TextStyle(color: Colors.white),
        items: items.map((item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: (value) => onChanged(value!),
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF06070A),
        border: Border(
          top: BorderSide(color: Colors.white.withOpacity(0.05)),
        ),
      ),
      child: Row(
        children: [
          if (currentStep > 0)
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    currentStep--;
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  });
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white70,
                  side: BorderSide(color: Colors.white.withOpacity(0.2)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text("Back"),
              ),
            ),
          if (currentStep > 0) const SizedBox(width: 12),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                if (currentStep < 4) {
                  setState(() {
                    currentStep++;
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purpleAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(currentStep == 4 ? "Review" : "Continue"),
            ),
          ),
        ],
      ),
    );
  }

  void _generateContent() {
    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: Card(
          color: Color(0xFF1A1F2E),
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(color: Colors.purpleAccent),
                SizedBox(height: 16),
                Text(
                  "Generating your content...",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // Simulate content generation (replace with actual API call)
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context); // Close dialog

      // Navigate to result screen with generated content
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ContentResultScreen(
            preferences: {
              'type': selectedContentType?.name,
              'topic': topic,
              'platform': selectedPlatform,
              'audience': targetAudience,
              'tone': selectedTone?.name,
              'wordCount': wordCount,
              'keywords': keywords,
              'additionalContext': additionalContext,
              'includeSEO': includeSEO,
              'includeEmojis': includeEmojis,
              'language': selectedLanguage,
              'expertise': selectedExpertise,
              'goal': selectedGoal,
              'formats': selectedFormats,
            },
          ),
        ),
      );
    });
  }

  void _resetForm() {
    setState(() {
      currentStep = 0;
      selectedContentType = null;
      topic = '';
      selectedPlatform = '';
      targetAudience = '';
      selectedTone = null;
      wordCount = 500;
      keywords = [];
      additionalContext = '';
      includeSEO = true;
      includeEmojis = false;
      selectedLanguage = 'English';
      selectedExpertise = 'Intermediate';
      selectedGoal = 'Inform';
      selectedFormats = [];
      _pageController.jumpToPage(0);
    });
  }

  IconData _getPlatformIcon(String platform) {
    switch(platform) {
      case 'LinkedIn': return Icons.work;
      case 'Twitter/X': return Icons.chat;
      case 'Instagram': return Icons.photo_camera;
      case 'Facebook': return Icons.facebook;
      case 'Email Newsletter': return Icons.email;
      case 'YouTube Script': return Icons.video_library;
      case 'TikTok': return Icons.music_note;
      default: return Icons.web;
    }
  }
}

// Supporting Classes
class ContentType {
  final String name;
  final IconData icon;
  final String description;
  final Color color;

  ContentType({
    required this.name,
    required this.icon,
    required this.description,
    required this.color,
  });
}

class ToneType {
  final String name;
  final IconData icon;
  final Color color;

  ToneType({
    required this.name,
    required this.icon,
    required this.color,
  });
}

// Result Screen (You'll need to create this)
class ContentResultScreen extends StatelessWidget {
  final Map<String, dynamic> preferences;

  const ContentResultScreen({super.key, required this.preferences});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF06070A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Generated Content"),
      ),
      body: Center(
        child: Text(
          "Content will be generated based on:\n${preferences.toString()}",
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}