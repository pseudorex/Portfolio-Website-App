import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:my_portfolio/constants/nav_items.dart';
import 'package:my_portfolio/constants/skills_items.dart';
import 'package:my_portfolio/styles/style.dart';
import 'package:my_portfolio/utils/project_utils.dart';
import 'package:my_portfolio/widgets/drawer_mobile.dart';
import 'package:my_portfolio/widgets/header_desktop.dart';
import 'package:my_portfolio/widgets/header_mobile.dart';
import 'package:my_portfolio/widgets/main_desktop.dart';
import 'package:my_portfolio/widgets/main_mobile.dart';
import 'package:my_portfolio/widgets/site_logo.dart';
import 'package:my_portfolio/widgets/skills_desktop.dart';
import 'package:my_portfolio/widgets/skills_mobile.dart';

import '../widgets/project_card.dart';
import '../widgets/typing_backspace.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return LayoutBuilder(
      builder: (context, constraint) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColor.scaffoldBg,
          endDrawer: DrawerMobile(),
          // Option 1: Using FloatingActionButton (recommended for mobile)
          floatingActionButton: constraint.maxWidth < 600
              ? FloatingActionButton(
                  onPressed: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                  backgroundColor: CustomColor.scaffoldBg,
                  child: Icon(Icons.menu, color: Colors.white),
                  mini: true, // Makes it smaller
                )
              : null,
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

          body: ListView(
            children: [
              /*// Main
              if (constraint.maxWidth >= 600)
                HeaderDesktop()
              else
                HeaderMobile(
                  onMenuTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                  onLogoTap: () {},
                ),

              if (constraint.maxWidth >= 600) MainDesktop() else MainMobile(),

              // Projects
              Container(
                width: screenWidth,
                color: CustomColor.bgLight1,
                padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
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
                    SizedBox(height: 50),
                    if (constraint.maxWidth >= 800)
                      SkillsDesktop()
                    else
                      SkillsMobile(),

                    //SkillsDesktop(),
                  ],
                ),
              ),

              // Project
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      "",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary,
                      ),
                    ),
                  ],
                ),
              ),*/

              // Footer
              ProjectCard(project: workProjects.first, screenWidth: screenWidth,)
            ],
          ),
        );
      },
    );
  }
}