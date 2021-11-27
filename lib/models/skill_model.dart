import 'package:flutter/material.dart';

class SkillModel {
  final String skillName;
  final String logoURL;
  final Color logoColor;
  final double percent;
  SkillModel({
    required this.skillName,
    required this.logoURL,
    required this.logoColor,
    required this.percent,
  });
}

List<SkillModel> skills = [
  SkillModel(
    skillName: "Angular",
    logoURL: "assets/logo/logo-angular.svg",
    logoColor: Colors.redAccent,
    percent: 40,
  ),
  SkillModel(
    skillName: "HTML 5",
    logoURL: "assets/logo/logo-html5.svg",
    logoColor: Colors.blueAccent,
    percent: 80,
  ),
  SkillModel(
    skillName: "JS",
    logoURL: "assets/logo/logo-nodejs.svg",
    logoColor: Colors.yellowAccent,
    percent: 50,
  ),
  SkillModel(
    skillName: "Python",
    logoURL: "assets/logo/logo-python.svg",
    logoColor: Colors.blue,
    percent: 90,
  ),
];
