import 'package:flutter/material.dart';
import 'package:food_recipe_app/meals_database.dart';
import 'package:food_recipe_app/models/meal.dart';
import 'package:food_recipe_app/screens/filters_screen.dart';
import 'package:food_recipe_app/screens/meal_detail_screen.dart';
import 'package:food_recipe_app/screens/tabs_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filter = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  List<Meal> _availableMeals = RECIPE_MEALS;
  List<Meal> _favMeals = [];

 /* void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filter = filterData;
      _availableMeals = RECIPE_MEALS.where((meal) {
        if (_filter['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filter['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filter['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filter['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }*/

  void _toggleFavourite(String mealId) {
    final existingIndex = _favMeals.indexWhere((meal) {
      return meal.id == mealId;
    });

    if (existingIndex >= 0) {
      setState(() {
        _favMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favMeals.add(RECIPE_MEALS.firstWhere((meal) {
          return meal.id == mealId;
        }));
      });
    }
  }

  bool isMealFavorite(String id) {
    return _favMeals.any((meal) {
      return meal.id==id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Recipes',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.white60,
        canvasColor: const Color.fromRGBO(225, 225, 225, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: const TextStyle(
            color: Color.fromRGBO(100, 51, 51, 1),
          ),
          bodyText2: const TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
      ),
      //home: const CategoriesScreen(),
      //initialRoute: ,
      routes: {
        '/': (context) => TabsScreen(favMeals: _favMeals ),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(availableMeals: _availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(_toggleFavourite,isMealFavorite),
 /*       FilterScreen.routeName: (context) =>
            FilterScreen(filters: _filter, saveFilters: _setFilters),*/
      },
    );
  }
}