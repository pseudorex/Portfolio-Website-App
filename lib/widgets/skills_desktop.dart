import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/skills_items.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 450),
            child: Wrap(
              spacing: 5,
              runSpacing: 5,
              children: [
                for (int i = 0; i < platformItems.length; i++)
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                      color: CustomColor.bgLight2,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      leading: Image.asset(
                        platformItems[i]["img"],
                        width: 26,
                      ),
                      title: Text(platformItems[i]["title"]),
                    ),
                  ),
              ],
            ),
          ),
        ),
        SizedBox(width: 50),
        Flexible(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth:500,
            ),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for(int i = 0; i < skillItems.length; i++)
                  Chip(
                    label: Text(skillItems[i]["title"]),
                    avatar: Image.asset(skillItems[i]["img"]),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    backgroundColor: CustomColor.bgLight2,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
