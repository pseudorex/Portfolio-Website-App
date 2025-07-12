import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/skills_items.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 500,
      ),
      child: Column(
        children: [
           for (int i = 0; i < platformItems.length; i++)
              Container(
                margin: EdgeInsets.only(bottom: 5),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: CustomColor.bgLight2,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  leading: Image.asset(platformItems[i]["img"], width: 26),
                  title: Text(platformItems[i]["title"]),
                ),
              ),
          SizedBox(height: 50),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.center,
            children: [
              for (int i = 0; i < skillItems.length; i++)
                Chip(
                  label: Text(skillItems[i]["title"]),
                  avatar: Image.asset(skillItems[i]["img"]),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  backgroundColor: CustomColor.bgLight2,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
