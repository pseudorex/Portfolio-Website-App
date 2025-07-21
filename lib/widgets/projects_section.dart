/*import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/project_card.dart';
import 'package:flutter/foundation.dart' show kIsWeb;


import '../constants/colors.dart';
import '../utils/project_utils.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Container(
      width: screenWidth,
      padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
      child: Column(
        children: [
          Text(
            "Work Projects",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: 1000
            ),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for (int i = 0; i < workProjects.length; i++)
                  ProjectCard(
                    project: workProjects[i],
                    screenWidth: screenWidth,
                  ),
              ],
            ),
          ),
          SizedBox(
            height: 80,
          ),
          //hobby Projects
          Text(
            "Hobby Projects",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: 1000
            ),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for (int i = 0; i < hobbyProjects.length; i++)
                  ProjectCard(
                    project: hobbyProjects[i],
                    screenWidth: screenWidth,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/project_card.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../constants/colors.dart';
import '../utils/project_utils.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return Container(
      width: screenWidth,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
      color: CustomColor.bgLight1.withOpacity(0.05), // subtle background
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Work Projects Title
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: const Duration(milliseconds: 800),
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(0, 20 * (1 - value)),
                  child: child,
                ),
              );
            },
            child: Text(
              "Work Projects",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: CustomColor.whitePrimary,
                letterSpacing: 1.2,
              ),
            ),
          ),

          const SizedBox(height: 10),
          _buildDivider(),

          const SizedBox(height: 30),
          _buildProjectGrid(workProjects, screenWidth),

          const SizedBox(height: 60),

          // Hobby Projects Title
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: const Duration(milliseconds: 800),
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(0, 20 * (1 - value)),
                  child: child,
                ),
              );
            },
            child: Text(
              "Hobby Projects",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: CustomColor.whitePrimary,
                letterSpacing: 1.2,
              ),
            ),
          ),

          const SizedBox(height: 10),
          _buildDivider(),

          const SizedBox(height: 30),
          _buildProjectGrid(hobbyProjects, screenWidth),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 3,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        gradient: LinearGradient(
          colors: [Colors.deepPurpleAccent, Colors.blueAccent],
        ),
      ),
    );
  }

  Widget _buildProjectGrid(List projectList, double screenWidth) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1000),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Wrap(
          spacing: 25,
          runSpacing: 25,
          children: [
            for (int i = 0; i < projectList.length; i++)
              ProjectCard(
                project: projectList[i],
                screenWidth: screenWidth,
              ),
          ],
        ),
      ),
    );
  }
}
