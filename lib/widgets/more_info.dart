import 'package:flip_3d_profile_card/config/constants.dart';
import 'package:flutter/material.dart';

class MoreInfo extends StatelessWidget {
  final String info;
  final IconData icon;

  const MoreInfo({
    Key? key,
    required this.info,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(
          width: kDefaultPadding,
        ),
        Text(
          info,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        )
      ],
    );
  }
}
