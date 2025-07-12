import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/project_utils.dart';

import '../constants/colors.dart';
import 'dart:js' as js;

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.screenWidth,
    required this.project
  });
  final ProjectUtils project;

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
      width: screenWidth,
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
          Container(
            clipBehavior: Clip.antiAlias,
            height: 290,
            width: 260,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: CustomColor.bgLight2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  project.image,
                  height: 140,
                  width: 260,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
                  child: Text(
                    project.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CustomColor.whitePrimary,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: Text(
                    project.subtitile,
                    style: TextStyle(
                      fontSize: 12,
                      color: CustomColor.whiteSecondary,
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  color: CustomColor.bgLight1,
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Available on: ",
                        style: TextStyle(
                          color: CustomColor.yellowSecondary,
                          fontSize: 10,
                        ),
                      ),
                      Spacer(),
                      if(project.androidLink != null)
                      InkWell(
                        onTap: (){
                          js.context.callMethod("open", [project.androidLink]);
                        },
                        child: Image.asset(
                          "assets/images/android_icon.png",
                          width: 17,
                        ),
                      ),

                      if(project.webLink != null)
                        InkWell(
                          onTap: (){
                            js.context.callMethod("open", [project.webLink]);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: Image.asset(
                              "assets/images/desktop_icon.png",
                              width: 17,
                            ),
                          ),
                        ),

                      if(project.iosLink != null)
                        InkWell(
                          onTap: (){
                            js.context.callMethod("open", [project.iosLink]);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: Image.asset(
                              "assets/images/ios_icon.png",
                              width: 17,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
