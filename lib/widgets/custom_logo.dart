import 'package:flip_3d_profile_card/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomLogo extends StatelessWidget {
  final String logoURL;
  final double height;
  final double width;
  final VoidCallback onPress;

  const CustomLogo({
    Key? key,
    required this.logoURL,
    this.height = 40.0,
    this.width = 40.0,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 40,
        margin: const EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        decoration: const BoxDecoration(
          color: primaryColorLight,
          boxShadow: [
            BoxShadow(
              color: primaryColorDark,
              blurRadius: 10.0,
              spreadRadius: 5.0,
            ),
          ],
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(kDefaultExThinPadding),
          child: SvgPicture.asset(
            logoURL,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
