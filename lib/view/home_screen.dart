import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:portfolio_website/viewmodel/image_animation_controller.dart';
import 'package:portfolio_website/viewmodel/type_writer_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio_website/widgets/project_card.dart';
import 'package:portfolio_website/widgets/skill_card.dart';
import 'package:portfolio_website/widgets/whatsapp_button.dart';
import 'package:portfolio_website/widgets/theme_toggle.dart';
import 'package:portfolio_website/viewmodel/theme_controller.dart';
import 'package:portfolio_website/viewmodel/responsive_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final typewriterController = Get.put(TypewriterController());
    final imageAnimCtrl = Get.put(ImageAnimationController());
    final themeController = Get.find<ThemeController>();
    final responsive = Get.put(ResponsiveController());

    // ScrollController for smooth scrolling
    final ScrollController scrollController = ScrollController();

    // Global keys for sections
    final GlobalKey projectsKey = GlobalKey();
    final GlobalKey contactKey = GlobalKey();

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Update screen size when layout changes
          WidgetsBinding.instance.addPostFrameCallback((_) {
            responsive.updateScreenSize();
          });

          return Obx(() => Scaffold(
                backgroundColor: themeController.backgroundColor,
                body: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: responsive.horizontalPadding,
                    child: Column(
                      children: [
                        // Theme Toggle at top right
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ThemeToggle(),
                          ],
                        ),
                        SizedBox(height: responsive.headerHeight),

                        // Hero Section - Responsive Layout
                        responsive.shouldUseColumnLayout
                            ? Column(
                                children: [
                                  _buildHeroContent(
                                      responsive,
                                      themeController,
                                      typewriterController,
                                      contactKey,
                                      projectsKey),
                                  SizedBox(height: responsive.sectionSpacing),
                                  _buildProfileImage(imageAnimCtrl, responsive),
                                ],
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: _buildHeroContent(
                                        responsive,
                                        themeController,
                                        typewriterController,
                                        contactKey,
                                        projectsKey),
                                  ),
                                  SizedBox(
                                      width: responsive.gapBetweenElements),
                                  _buildProfileImage(imageAnimCtrl, responsive),
                                ],
                              ),

                        SizedBox(height: responsive.elementSpacing),

                        // Social Media Links
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: IconButton(
                                icon: SvgPicture.asset(
                                  'assets/images/icons/github.svg',
                                  width: responsive.isMobile ? 20 : 24,
                                  height: responsive.isMobile ? 20 : 24,
                                  colorFilter: ColorFilter.mode(
                                      Colors.white, BlendMode.srcIn),
                                ),
                                onPressed: () async {
                                  final url = Uri.parse(
                                      'https://github.com/hammad4474');
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url,
                                        mode: LaunchMode.externalApplication);
                                  }
                                },
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF0077B5),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: IconButton(
                                icon: SvgPicture.asset(
                                  'assets/images/icons/linkedin.svg',
                                  width: responsive.isMobile ? 20 : 24,
                                  height: responsive.isMobile ? 20 : 24,
                                  colorFilter: ColorFilter.mode(
                                      Colors.white, BlendMode.srcIn),
                                ),
                                onPressed: () async {
                                  final url = Uri.parse(
                                      'https://www.linkedin.com/in/hammad-naeem-bb7537252/');
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url,
                                        mode: LaunchMode.externalApplication);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: responsive.sectionSpacing),

                        // Projects Section
                        Row(
                          key: projectsKey,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Text('Projects',
                                  style: TextStyle(
                                    fontSize: responsive.sectionTitleFontSize,
                                    fontWeight: FontWeight.bold,
                                    color: themeController.textColor,
                                  )),
                            ),
                            Text('.',
                                style: TextStyle(
                                  fontSize: responsive.sectionTitleFontSize,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff6726f2),
                                )),
                          ],
                        ),
                        SizedBox(height: responsive.sectionSpacing),

                        // Projects Grid
                        _buildProjectsGrid(responsive),

                        SizedBox(height: responsive.sectionSpacing),

                        // Skills Section
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Text('Skills',
                                  style: TextStyle(
                                    fontSize: responsive.sectionTitleFontSize,
                                    fontWeight: FontWeight.bold,
                                    color: themeController.textColor,
                                  )),
                            ),
                            Text('.',
                                style: TextStyle(
                                  fontSize: responsive.sectionTitleFontSize,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff6726f2),
                                )),
                          ],
                        ),
                        SizedBox(height: responsive.sectionSpacing),

                        // Skills Section
                        _buildSkillsSection(responsive),

                        SizedBox(height: responsive.sectionSpacing),

                        // My Story Section
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Text('My Story',
                                  style: TextStyle(
                                    fontSize: responsive.sectionTitleFontSize,
                                    color: themeController.textColor,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            Text('.',
                                style: TextStyle(
                                  fontSize: responsive.sectionTitleFontSize,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff6726f2),
                                )),
                          ],
                        ),
                        SizedBox(height: responsive.sectionSpacing),

                        // Story Content
                        _buildStorySection(responsive, themeController),

                        SizedBox(height: responsive.sectionSpacing),

                        // Let's Work Together Section
                        Container(
                          key: contactKey,
                          width: double.infinity,
                          padding:
                              EdgeInsets.all(responsive.isMobile ? 20 : 40),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Interested in Working Together?',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: responsive.isMobile ? 24 : 32,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff6726f2),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 15),
                              Text(
                                'Let\'s bring your app ideas to life! I\'m always excited to work on new projects and help turn your vision into reality.',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: responsive.bodyFontSize,
                                  color: themeController.subtitleColor,
                                  height: 1.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 30),

                              // WhatsApp Button
                              WhatsAppButton(),
                            ],
                          ),
                        ),
                        SizedBox(height: responsive.sectionSpacing),

                        // Footer Section
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 30),
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: themeController.borderColor,
                                width: 1,
                              ),
                            ),
                          ),
                          child: responsive.isMobile
                              ? Column(
                                  children: [
                                    Text(
                                      '©2025 All Rights Reserved.',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        color: themeController.subtitleColor,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    RichText(
                                      text: TextSpan(
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                          color: themeController.subtitleColor,
                                        ),
                                        children: [
                                          TextSpan(text: 'Made with '),
                                          TextSpan(
                                            text: '💜',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          TextSpan(text: ' by Hammad Naeem'),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '©2025 All Rights Reserved.',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        color: themeController.subtitleColor,
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                          color: themeController.subtitleColor,
                                        ),
                                        children: [
                                          TextSpan(text: 'Made with '),
                                          TextSpan(
                                            text: '💜',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          TextSpan(text: ' by Hammad Naeem'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }

  Widget _buildHeroContent(
      ResponsiveController responsive,
      ThemeController themeController,
      TypewriterController typewriterController,
      GlobalKey contactKey,
      GlobalKey projectsKey) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Obx(() => AnimatedTextKit(
                    key: ValueKey(typewriterController.key.value),
                    animatedTexts: [
                      TypewriterAnimatedText(
                        ' Hey, I am Hammad ',
                        textStyle: TextStyle(
                          fontSize: responsive.bodyFontSize,
                          fontWeight: FontWeight.w400,
                          color: themeController.subtitleColor,
                        ),
                        speed: Duration(milliseconds: 100),
                      ),
                    ],
                    totalRepeatCount: 1,
                    onFinished: () {
                      Future.delayed(Duration(milliseconds: 500), () {
                        typewriterController.restartAnimation();
                      });
                    },
                  )),
            ),
            SizedBox(width: 8),
            Icon(
              Icons.waving_hand,
              size: responsive.isMobile ? 16 : 20,
              color: Color(0xff6726f2),
            ),
          ],
        ),
        SizedBox(height: responsive.elementSpacing),
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: responsive.titleFontSize,
              height: 0.9,
              color: themeController.textColor,
            ),
            children: [
              TextSpan(
                text: 'Flutter \n',
                style: TextStyle(
                  color: Color(0xff6726f2),
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'Developer',
                style: TextStyle(
                  color: themeController.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: responsive.elementSpacing),
        Text(
          responsive.isMobile
              ? "I'm a Flutter Developer based in Pakistan, I'll help you build beautiful mobile applications your users will love."
              : "I'm a Flutter Developer based in Pakistan, I'll help you\nbuild beautiful mobile applications your users will love.",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: responsive.subtitleFontSize,
            fontWeight: FontWeight.w400,
            color: themeController.subtitleColor,
            height: 1.35,
          ),
        ),
        SizedBox(height: responsive.elementSpacing),
        responsive.isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildButton(
                    'Get In Touch',
                    () => _scrollToSection(contactKey),
                    isPrimary: true,
                    responsive: responsive,
                  ),
                  SizedBox(height: 10),
                  _buildButton(
                    'Browse My Work',
                    () => _scrollToSection(projectsKey),
                    isPrimary: false,
                    responsive: responsive,
                    themeController: themeController,
                  ),
                ],
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: _buildButton(
                      'Get In Touch',
                      () => _scrollToSection(contactKey),
                      isPrimary: true,
                      responsive: responsive,
                    ),
                  ),
                  SizedBox(width: responsive.isMobile ? 8 : Get.width * 0.01),
                  Flexible(
                    child: _buildButton(
                      'Browse My Work',
                      () => _scrollToSection(projectsKey),
                      isPrimary: false,
                      responsive: responsive,
                      themeController: themeController,
                    ),
                  ),
                ],
              ),
      ],
    );
  }

  Widget _buildProfileImage(
      ImageAnimationController imageAnimCtrl, ResponsiveController responsive) {
    return AnimatedBuilder(
      animation: imageAnimCtrl.animationController,
      builder: (context, child) {
        final double dx =
            10 * (imageAnimCtrl.animationController.value * 2 - 1);
        final double dy =
            10 * (1 - (imageAnimCtrl.animationController.value * 2 - 1).abs());
        return Transform.translate(
          offset: Offset(dx, dy),
          child: child,
        );
      },
      child: Container(
        width: responsive.profileImageSize,
        height: responsive.profileImageSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Color(0xFFB9AFFF),
            width: 2,
          ),
        ),
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/image.png'),
          radius: responsive.profileImageSize / 2.5,
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }

  Widget _buildProjectsGrid(ResponsiveController responsive) {
    final List<Map<String, String>> projects = [
      {
        'image': 'assets/images/eye-doctor-pro.png',
        'title': 'Eye Doctor Pro',
        'link': 'https://github.com/hammad4474/eyedoctor_pro',
        'description':
            'Deep learning app with AI chatbot for pink eye detection and diagnosis using advanced image recognition.',
      },
      {
        'image': 'assets/images/2Let.png',
        'title': '2let App',
        'link':
            'https://play.google.com/store/apps/details?id=com.tolet.app&hl=en',
        'description':
            'Property marketplace on Play Store where tenants and owners can buy, sell, and rent properties seamlessly.',
      },
      {
        'image': 'assets/images/weather_app.png',
        'title': 'Weather App',
        'link': 'https://github.com/hammad4474/weather_app',
        'description':
            'Global weather application showing real-time weather conditions and forecasts for different countries worldwide.',
      },
      {
        'image': 'assets/images/alarm-clock.png',
        'title': 'Smart Alarm Clock',
        'link': 'https://github.com/hammad4474/alarm_clock_clean',
        'description':
            'Intelligent alarm clock app with customizable alarms, snooze features, and beautiful display interface.',
      },
      {
        'image': 'assets/images/car-rentel.png',
        'title': 'Car Rental App',
        'link': 'https://github.com/hammad4474/car_rental_app',
        'description':
            'Car rental platform with Google Maps integration where users can browse and rent different vehicles.',
      },
      {
        'image': 'assets/images/fitness.png',
        'title': 'MyFitApp',
        'link': 'https://github.com/hammad4474/myfitapp',
        'description':
            'Smart fitness application with personalized workout plans, progress tracking, and health monitoring features.',
      },
    ];

    if (responsive.isMobile) {
      return Column(
        children: projects
            .map((project) => Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: ProjectCard(
                    imagePath: project['image']!,
                    title: project['title']!,
                    projectLink: project['link']!,
                    description: project['description']!,
                  ),
                ))
            .toList(),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // First Row of Projects
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: ProjectCard(
                imagePath: projects[0]['image']!,
                title: projects[0]['title']!,
                projectLink: projects[0]['link']!,
                description: projects[0]['description']!,
              )),
              SizedBox(width: responsive.gapBetweenElements),
              Expanded(
                  child: ProjectCard(
                imagePath: projects[1]['image']!,
                title: projects[1]['title']!,
                projectLink: projects[1]['link']!,
                description: projects[1]['description']!,
              )),
              SizedBox(width: responsive.gapBetweenElements),
              Expanded(
                  child: ProjectCard(
                imagePath: projects[2]['image']!,
                title: projects[2]['title']!,
                projectLink: projects[2]['link']!,
                description: projects[2]['description']!,
              )),
            ],
          ),
          SizedBox(height: responsive.sectionSpacing),
          // Second Row of Projects
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: ProjectCard(
                imagePath: projects[3]['image']!,
                title: projects[3]['title']!,
                projectLink: projects[3]['link']!,
                description: projects[3]['description']!,
              )),
              SizedBox(width: responsive.gapBetweenElements),
              Expanded(
                  child: ProjectCard(
                imagePath: projects[4]['image']!,
                title: projects[4]['title']!,
                projectLink: projects[4]['link']!,
                description: projects[4]['description']!,
              )),
              SizedBox(width: responsive.gapBetweenElements),
              Expanded(
                  child: ProjectCard(
                imagePath: projects[5]['image']!,
                title: projects[5]['title']!,
                projectLink: projects[5]['link']!,
                description: projects[5]['description']!,
              )),
            ],
          ),
        ],
      );
    }
  }

  Widget _buildSkillsSection(ResponsiveController responsive) {
    final List<Map<String, String>> skills = [
      {'icon': 'assets/images/icons/flutter.svg', 'name': 'Flutter'},
      {'icon': 'assets/images/icons/dart.svg', 'name': 'Dart'},
      {'icon': 'assets/images/icons/vercel.svg', 'name': 'Vercel'},
      {'icon': 'assets/images/icons/firebase.svg', 'name': 'Firebase'},
      {'icon': 'assets/images/icons/restapi.svg', 'name': 'REST API'},
      {'icon': 'assets/images/icons/html.svg', 'name': 'HTML'},
      {'icon': 'assets/images/icons/css.svg', 'name': 'CSS'},
      {'icon': 'assets/images/icons/nodejs.svg', 'name': 'Node.js'},
      {'icon': 'assets/images/icons/mongodb.svg', 'name': 'MongoDB'},
      {'icon': 'assets/images/icons/android.svg', 'name': 'Android'},
      {'icon': 'assets/images/icons/ios.svg', 'name': 'iOS'},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: skills
            .map((skill) => Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: SkillCard(
                    iconPath: skill['icon']!,
                    skillName: skill['name']!,
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget _buildStorySection(
      ResponsiveController responsive, ThemeController themeController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // First Paragraph
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: responsive.bodyFontSize,
              height: 1.6,
              color: themeController.subtitleColor,
            ),
            children: [
              TextSpan(
                text: 'My journey as a ',
              ),
              TextSpan(
                text: 'Flutter developer',
                style: TextStyle(
                  color: Color(0xff6726f2),
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: ' started ',
              ),
              TextSpan(
                text: '2 years ago',
                style: TextStyle(
                  color: Color(0xff6726f2),
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text:
                    ' when I discovered my passion for creating beautiful and functional mobile applications.',
              ),
            ],
          ),
        ),

        SizedBox(height: 20),

        // Second Paragraph
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: responsive.bodyFontSize,
              height: 1.6,
              color: themeController.subtitleColor,
            ),
            children: [
              TextSpan(
                text: 'I\'m deeply ',
              ),
              TextSpan(
                text: 'passionate about developing apps',
                style: TextStyle(
                  color: Color(0xff6726f2),
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text:
                    ' that solve real-world problems and provide exceptional user experiences. Every line of code I write is driven by the desire to create something meaningful and impactful.',
              ),
            ],
          ),
        ),

        SizedBox(height: 20),

        // Third Paragraph
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: responsive.bodyFontSize,
              height: 1.6,
              color: themeController.subtitleColor,
            ),
            children: [
              TextSpan(
                text: 'Throughout my journey, I\'ve had the privilege of ',
              ),
              TextSpan(
                text: 'developing apps for many clients',
                style: TextStyle(
                  color: Color(0xff6726f2),
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: ', including the ',
              ),
              TextSpan(
                text: '2let app',
                style: TextStyle(
                  color: Color(0xff6726f2),
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text:
                    ' and many other innovative projects. Each project has taught me valuable lessons and helped me grow as a developer.',
              ),
            ],
          ),
        ),

        SizedBox(height: 20),

        // Fourth Paragraph
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: responsive.bodyFontSize,
              height: 1.6,
              color: themeController.subtitleColor,
            ),
            children: [
              TextSpan(
                text:
                    'What drives me every day is the opportunity to transform ideas into reality through code. I believe that great apps are not just about functionality, but about creating experiences that users love and remember. ',
              ),
              TextSpan(
                text: 'And you know what? I love what I do! 💜',
                style: TextStyle(
                  color: Color(0xff6726f2),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed,
      {required bool isPrimary,
      required ResponsiveController responsive,
      ThemeController? themeController}) {
    if (isPrimary) {
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff6726f2),
          foregroundColor: Colors.white,
          padding: responsive.buttonPadding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: responsive.buttonFontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          side: BorderSide(
            color: themeController!.textColor,
            width: 1.0,
          ),
          backgroundColor: themeController.backgroundColor,
          foregroundColor: themeController.textColor,
          padding: responsive.buttonPadding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ).copyWith(
          overlayColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.hovered)) {
                return themeController.textColor;
              }
              return null;
            },
          ),
          foregroundColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.hovered)) {
                return themeController.backgroundColor;
              }
              return themeController.textColor;
            },
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: responsive.buttonFontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }
}
