import 'package:flutter/material.dart';
import 'package:food_recipe_app/models/meal.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favMeals;

  FavouritesScreen(this.favMeals,) ;

  @override
  Widget build(BuildContext context) {
    if(favMeals.isEmpty){
      return const Center(
        child: Text('The list is empty', style: TextStyle(fontSize: 25), ),
      );
    }
    else{
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: favMeals[index].id,
            title: favMeals[index].title,
            imageUrl: favMeals[index].imageUrl,
            duration: favMeals[index].duration,
            complexity: favMeals[index].complexity,
            affordability: favMeals[index].affordability,
          );
        },
        itemCount: favMeals.length,
      );
    }
  }
}