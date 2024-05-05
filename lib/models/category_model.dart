import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String image;
  Color boxColor;

  CategoryModel(
      {required this.name, required this.image, required this.boxColor});

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(
        CategoryModel(name: 'Salada',
            image: 'assets/icons/plate.svg',
            boxColor: Color(0xff92A3FD)),
    );

    categories.add(
      CategoryModel(name: 'Bolo',
          image: 'assets/icons/pancakes.svg',
          boxColor: Color(0xffC58BF2)),
    );

    categories.add(
      CategoryModel(name: 'Torta',
          image: 'assets/icons/pie.svg',
          boxColor: Color(0xff92A3FD)),
    );

    categories.add(
      CategoryModel(name: 'Laranjas',
          image: 'assets/icons/orange-snacks.svg',
          boxColor: Color(0xffC58BF2)),
    );

    return categories;
  }
}
