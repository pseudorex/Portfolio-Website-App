import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/widgets/achievements_page_desktop.dart';
import 'package:my_portfolio/widgets/achievements_page_mobile.dart';
import 'package:my_portfolio/widgets/contact_section.dart';
import 'package:my_portfolio/widgets/drawer_mobile.dart';
import 'package:my_portfolio/widgets/footer_screen.dart';
import 'package:my_portfolio/widgets/header_desktop.dart';
import 'package:my_portfolio/widgets/header_mobile.dart';
import 'package:my_portfolio/widgets/main_desktop.dart';
import 'package:my_portfolio/widgets/main_mobile.dart';
import 'package:my_portfolio/widgets/projects_section.dart';
import 'package:my_portfolio/widgets/skills_desktop.dart';
import 'package:my_portfolio/widgets/skills_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navBarKeys = List.generate(5, (index) => GlobalKey());

  void scrollToSection(int index) {
    final context = navBarKeys[index].currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return LayoutBuilder(
      builder: (context, constraint) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColor.scaffoldBg,
          endDrawer: DrawerMobile(
            onNavItemTap: (int navIndex) {
              scrollToSection(navIndex);
              Navigator.of(context).pop(); // Close drawer
            },
          ),
          floatingActionButton: constraint.maxWidth < 600
              ? FloatingActionButton(
            onPressed: () {
              scaffoldKey.currentState?.openEndDrawer();
            },
            backgroundColor: CustomColor.scaffoldBg,
            child: const Icon(Icons.menu, color: Colors.white),
            mini: true,
          )
              : null,
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          body: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                // SECTION: Home (Header)
                Container(
                  key: navBarKeys[0],
                  child: constraint.maxWidth >= 600
                      ? HeaderDesktop(onTapMenuOpt: scrollToSection)
                      : HeaderMobile(
                    onMenuTap: () {
                      scaffoldKey.currentState?.openEndDrawer();
                    },
                    onLogoTap: () => scrollToSection(0),
                  ),
                ),

                // SECTION: Main
                constraint.maxWidth >= 600
                    ? MainDesktop(onGetInTouchTap: () => scrollToSection(4))
                    : MainMobile(onGetInTouchTap: () => scrollToSection(4)),

                // SECTION: Skills
                Container(
                  key: navBarKeys[1],
                  width: screenWidth,
                  color: CustomColor.bgLight1,
                  padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "What I can do",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.whitePrimary,
                        ),
                      ),
                      const SizedBox(height: 50),
                      constraint.maxWidth >= 800
                          ? const SkillsDesktop()
                          : const SkillsMobile(),
                    ],
                  ),
                ),

                // SECTION: Projects
                Container(
                  key: navBarKeys[2],
                  width: double.infinity,
                  child: const ProjectsSection(),
                ),

                // SECTION: Achievements
                Container(
                  key: navBarKeys[3],
                  child: constraint.maxWidth >= 600
                      ? const AchievementsPage()
                      : const AchievementsPageMobile(),
                ),

                // SECTION: Contact
                Container(
                  key: navBarKeys[4],
                  child: const ContactSection(),
                ),

                const SizedBox(height: 60),
                const Divider(
                  color: Colors.white24,
                  thickness: 0.5,
                  indent: 100,
                  endIndent: 100,
                ),
                const FooterScreen(),
              ],
            ),
          ),
        );
      },
    );
  }
}
