import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // 🔁 EDIT: Firestore import
import 'package:my_portfolio/constants/sns_links.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';
import 'custom_text_field.dart';

class ContactSection extends StatefulWidget { // 🔁 EDIT: Changed to StatefulWidget
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  // 🔁 EDIT: TextEditingControllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    // 🔁 EDIT: Dispose controllers
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  // 🔁 EDIT: Function to submit data to Firestore
  Future<void> _submitForm() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final message = _messageController.text.trim();

    if (name.isEmpty || email.isEmpty || message.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('contacts').add({
        'name': name,
        'email': email,
        'message': message,
        'timestamp': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Message sent successfully!')),
      );

      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 20, 25, 10),
      color: CustomColor.scaffoldBg,
      child: Column(
        children: [
          Text(
            "Get In Touch",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: CustomColor.whiteSecondary,
            ),
          ),
          SizedBox(height: 30),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700, maxHeight: 100),
            child: LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth >= 600) {
                return buildNameEmailDesktop(); // 🔁 EDIT: Now uses controllers
              } else {
                return buildNameEmailMobile();   // 🔁 EDIT: Now uses controllers
              }
            }),
          ),
          SizedBox(height: 15),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700),
            child: CustomTextField(
              hintText: 'Your Message',
              maxLines: 15,
              controller: _messageController, // 🔁 EDIT
            ),
          ),
          SizedBox(height: 20),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700),
            child: SizedBox(
              width: double.maxFinite,
              height: 40,
              child: ElevatedButton(
                onPressed: _submitForm, // 🔁 EDIT
                child: Text("Get in touch"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 300),
            child: Divider(),
          ),
          SizedBox(height: 15),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                onTap: () => _launchURL(SNS_Links.leetcode),
                child: Image.asset(
                  "assets/images/leetcode.png",
                  width: 25,
                ),
              ),
              InkWell(
                onTap: () => _launchURL('https://github.com/pseudorex'),
                child: Image.asset(
                  "assets/images/github.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () => _launchURL('https://www.linkedin.com/in/asmitgpt'),
                child: Image.asset(
                  "assets/images/linkedin.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () => _launchURL('https://www.instagram.com/axmit._.rex/'),
                child: Image.asset(
                  "assets/images/instagram.png",
                  width: 28,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row buildNameEmailDesktop() {
    return Row(
      children: [
        Flexible(
          child: CustomTextField(
            hintText: 'Your Name',
            controller: _nameController, // 🔁 EDIT
          ),
        ),
        SizedBox(width: 15),
        Flexible(
          child: CustomTextField(
            hintText: 'Your Email',
            controller: _emailController, // 🔁 EDIT
          ),
        ),
      ],
    );
  }

  Column buildNameEmailMobile() {
    return Column(
      children: [
        Flexible(
          child: CustomTextField(
            hintText: 'Your Name',
            controller: _nameController, // 🔁 EDIT
          ),
        ),
        SizedBox(height: 15),
        Flexible(
          child: CustomTextField(
            hintText: 'Your Email',
            controller: _emailController, // 🔁 EDIT
          ),
        ),
      ],
    );
  }
}

void _launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}
