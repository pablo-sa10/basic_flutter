import 'package:flutter/material.dart';

class DietModel {
  String name;
  String icon;
  String level;
  String duration;
  String calories;
  Color boxColor;
  bool viewIsSelected;

  DietModel({
    required this.name,
    required this.icon,
    required this.level,
    required this.duration,
    required this.calories,
    required this.viewIsSelected,
    required this.boxColor,
  });

  static List<DietModel> getDiets() {
    List<DietModel> diet = [];

    diet.add(DietModel(name: "Panquecas com mel",
        icon: "assets/icons/honey-pancakes.svg",
        level: "Fácil",
        duration: "30 min",
        calories: "180 kcal",
        boxColor: Color(0xff9DCEFF),
        viewIsSelected: true));

    diet.add(DietModel(name: "Pão Canai",
        icon: "assets/icons/canai-bread.svg",
        level: "Fácil",
        duration: "20 min",
        calories: "230 kcal",
        boxColor: Color(0xffEEA4CE),
        viewIsSelected: false));

    return diet;
  }
}
