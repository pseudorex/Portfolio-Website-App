import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/site_logo.dart';

import '../styles/style.dart';

class HeaderMobile extends StatefulWidget {
  const HeaderMobile({super.key, this.onLogoTap, this.onMenuTap});

  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;

  @override
  State<HeaderMobile> createState() => _HeaderMobileState();
}

class _HeaderMobileState extends State<HeaderMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: HeaderMap,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: SiteLogo(onTap: widget.onLogoTap),
          ),
          Spacer(),
          /*IconButton(onPressed: widget.onMenuTap, icon: Icon(Icons.menu)),
          SizedBox(width: 15),*/
        ],
      ),
    );
  }
}
