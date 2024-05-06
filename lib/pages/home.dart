import 'package:fitness/models/diet_model.dart';
import 'package:fitness/models/popular_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/category_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietsModel> popularDiets = [];

  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiets();
    popularDiets = PopularDietsModel.getPopularDiets();
  }

  // @override
  // void initStates(){
  //   _getCategories();
  // }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
        appBar: appBar(),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            _searchField(),
            const SizedBox(
              height: 40,
            ),
            _sectionCategories(),
            const SizedBox(
              height: 40,
            ),
            _dietSection(),
            const SizedBox(
              height: 40,
            ),
            _popularDiet(),
            const SizedBox(
              height: 40,
            )
          ],
        ));
  }

  Column _popularDiet() {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Popular",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 25,
                ),
                itemCount: popularDiets.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(right: 20, left: 20),
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: popularDiets[index].boxIsSelected ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: popularDiets[index].boxIsSelected ? [
                          BoxShadow(
                              color: const Color(0xff1D1617).withOpacity(0.07),
                              offset: const Offset(0, 10),
                              blurRadius: 40,
                              spreadRadius: 0)
                        ] : []),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          popularDiets[index].icon,
                          width: 65,
                          height: 65,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              popularDiets[index].name,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                            Text(
                                '${popularDiets[index].level} | ${popularDiets[index].duration} | ${popularDiets[index].calorie}',
                                style: const TextStyle(
                                    color: Color(0xff7B6f72),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13)),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            'assets/icons/button.svg',
                            width: 30,
                            height: 30,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          );
  }

  Column _dietSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text("Recomendação\n para Dieta",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600)),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
            height: 240,
            //um listview que permite rolar o scroll, e permite separar os itens
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  width: 210,
                  decoration: BoxDecoration(
                    color: diets[index].boxColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(diets[index].icon),
                      Column(
                        children: [
                          Text(
                            diets[index].name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16),
                          ),
                          Text(
                            '${diets[index].level} | ${diets[index].duration} | ${diets[index].calories}',
                            style: const TextStyle(
                                color: Color(0xff7B6F72),
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Container(
                        height: 45,
                        width: 130,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(colors: [
                              diets[index].viewIsSelected
                                  ? const Color(0xff9DCEFF)
                                  : Colors.transparent,
                              diets[index].viewIsSelected
                                  ? const Color(0xff92A3FD)
                                  : Colors.transparent,
                            ])),
                        child: Center(
                          child: Text(
                            'View',
                            style: TextStyle(
                                color: diets[index].viewIsSelected
                                    ? Colors.white
                                    : const Color(0xffC58BF2),
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              itemCount: diets.length,
              separatorBuilder: (context, index) => const SizedBox(
                width: 25,
              ),
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
            ))
      ],
    );
  }

  Column _sectionCategories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 12.0),
          child: Text('Categorias',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600)),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 120,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(right: 20, left: 20),
            separatorBuilder: (context, index) => const SizedBox(
              width: 25,
            ),
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                decoration: BoxDecoration(
                    color: categories[index].boxColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(categories[index].image),
                        )),
                    Text(
                      categories[index].name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 14),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Container _searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: const Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.8)
      ]),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(15),
            hintText: 'Buscar panquecas',
            hintStyle: const TextStyle(
              color: Color(0xffDDDADA),
              fontSize: 14,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset('assets/icons/Search.svg'),
            ),
            suffixIcon: SizedBox(
              width: 100,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const VerticalDivider(
                      color: Colors.black,
                      indent: 10,
                      endIndent: 10,
                      thickness: 0.1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset('assets/icons/Filter.svg'),
                    ),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text(
        'Café da manhã',
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10)),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/icons/Arrow - Left 2.svg',
            height: 20,
            width: 20,
          ),
        ),
      ),
      //ele usou isso para replicar o icone de seta
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: const Color(0xffF7F8F8),
                borderRadius: BorderRadius.circular(10)),
            alignment: Alignment.center,
            width: 37,
            child: SvgPicture.asset(
              'assets/icons/dots.svg',
              height: 5,
              width: 5,
            ),
          ),
        ),
      ],
    );
  }
}
