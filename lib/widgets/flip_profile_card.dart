import 'package:flip_3d_profile_card/config/constants.dart';
import 'package:flip_3d_profile_card/config/helper.dart';
import 'package:flip_3d_profile_card/models/skill_model.dart';
import 'package:flip_3d_profile_card/widgets/custom_logo.dart';
import 'package:flip_3d_profile_card/widgets/more_info.dart';
import 'package:flip_3d_profile_card/widgets/skill_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FlipProfileCard extends StatefulWidget {
  const FlipProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  State<FlipProfileCard> createState() => _FlipProfileCardState();
}

class _FlipProfileCardState extends State<FlipProfileCard>
    with SingleTickerProviderStateMixin {
  double width = 300;
  double height = 400;

  // add animation
  late AnimationController _animationController;

  // handle event onTap
  bool isSelected = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          if (isSelected) {
            _animationController.forward();
          } else {
            _animationController.reverse();
          }
          return SizedBox(
            height: height,
            width: width,
            child: Stack(
              children: [
                // after
                // translate to width / 2
                Transform.translate(
                  offset: Offset((width / 2) * _animationController.value, 0),
                  child: Container(
                    color: Colors.white.withOpacity(0.8),
                    child: Container(
                      width: width,
                      margin: const EdgeInsets.all(kDefaultExThinPadding),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      color: primaryColor,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'SKILL',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.add_circle_outline_outlined,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          ...skills.map(
                            (e) => SkillWidget(
                              skillName: e.skillName,
                              logo: e.logoURL,
                              logoColor: e.logoColor,
                              percent: e.percent,
                            ),
                          ),
                          const SizedBox(height: kDefaultPadding),
                          Divider(
                            height: 2.0,
                            color: Colors.white.withOpacity(0.2),
                          ),
                          const SizedBox(height: kDefaultPadding),
                          const MoreInfo(
                            icon: Icons.location_on,
                            info: 'Istabul Turkey',
                          ),
                          const SizedBox(
                            height: kDefaultThinPadding,
                          ),
                          const MoreInfo(
                            icon: Icons.email_outlined,
                            info: 'beckkham@email.com',
                          ),
                          const SizedBox(
                            height: kDefaultThinPadding,
                          ),
                          const MoreInfo(
                            icon: Icons.phone,
                            info: '+1 1900 0019',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // before
                // 1. rotate to 180 degress
                // 2. translate to width / 2
                Transform.translate(
                  offset: Offset((width / 2) * _animationController.value, 0),
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(
                        radians(180 * _animationController.value),
                      ),
                    child: isSelected
                        ? Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Container(
                                color: primaryColor,
                              ),
                              Container(
                                height: height * 0.3,
                                color: Colors.blue,
                              ),
                              Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.identity()
                                  ..setEntry(3, 2, 0.001)
                                  ..rotateY(radians(180)),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: height * 0.5,
                                      width: width * 0.4,
                                      child: Image.asset(profileImgURL),
                                    ),
                                    const SizedBox(height: kDefaultPadding),
                                    const Text(
                                      'David Beckham',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 24.0),
                                    ),
                                    const SizedBox(height: kDefaultPadding),
                                    const Text(
                                      'Senior Developer',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    const SizedBox(height: kDefaultFatPadding),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Spacer(),
                                        CustomLogo(
                                          logoURL: facebookLogoURL,
                                          onPress: () {},
                                        ),
                                        CustomLogo(
                                          logoURL: linkedinLogoURL,
                                          onPress: () {},
                                        ),
                                        CustomLogo(
                                          logoURL: instagramLogoURL,
                                          onPress: () {},
                                        ),
                                        CustomLogo(
                                          logoURL: twitterLogoURL,
                                          onPress: () {},
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        : SizedBox(
                            height: height,
                            width: width,
                            child: Image.asset(
                              profileImgURL,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
