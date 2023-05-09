import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import 'package:food_recipe_app/meals_database.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GridView(
      padding: const EdgeInsets.all(22),
      children: [
        ...MEAL_CATEGORIES.map((catData) {
          return CategoryItem(id: catData.id,title: catData.title, color: catData.color);
        }).toList(),
      ],
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 400,
        childAspectRatio: 8 / 2,
        crossAxisSpacing: 30,
        mainAxisSpacing: 35,

      ),
    );
  }
}