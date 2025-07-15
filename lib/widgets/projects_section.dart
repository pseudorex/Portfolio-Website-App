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
