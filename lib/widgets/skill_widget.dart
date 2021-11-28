import 'package:flip_3d_profile_card/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SkillWidget extends StatelessWidget {
  final String skillName;
  final String logo;
  final Color logoColor;
  final double percent;

  const SkillWidget({
    Key? key,
    required this.skillName,
    required this.logo,
    this.logoColor = Colors.white,
    this.percent = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double width = constraints.maxWidth;
      return Container(
        margin: const EdgeInsets.only(top: kDefaultPadding),
        child: Row(
          children: [
            SvgPicture.asset(
              logo,
              width: 32.0,
              height: 32.0,
              color: logoColor,
            ),
            const SizedBox(
              width: kDefaultPadding,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    skillName.toUpperCase(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 5.0,
                        width: width * 0.8,
                        color: Colors.white.withOpacity(0.2),
                      ),
                      Container(
                        height: 5.0,
                        width: (percent / 100) * width * 0.8,
                        color: Colors.greenAccent,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
