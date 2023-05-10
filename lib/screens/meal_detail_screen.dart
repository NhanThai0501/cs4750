import 'package:flutter/material.dart';
import 'package:food_recipe_app/meals_database.dart';
import 'package:food_recipe_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavourite;
  final Function isMealFavourite;
  MealDetailScreen(this.toggleFavourite,this.isMealFavourite);
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w500,
          fontFamily: 'Arial',
        ),
      ),
    );
  }

  Widget buildContainer(BuildContext context, Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.cyan),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(30),
      padding: EdgeInsets.all(30),
      height: 500,
      width: 500,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = RECIPE_MEALS.firstWhere(
          (meal) {
        return meal.id == mealId;
      },
    );
    return Scaffold(
        appBar: AppBar(
          title: Text(selectedMeal.title, style: TextStyle(color: Colors.white, fontSize: 18
          ),
          )
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                height: 400,
                width: double.infinity,
                child: Image.asset(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle(context, 'Ingredients'),
              buildContainer(
                context,
                ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      color: Theme.of(context).canvasColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        child: Text(
                          selectedMeal.ingredients[index],
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                        ),
                      ),
                    );
                  },
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              buildSectionTitle(context, 'Steps'),
              buildContainer(
                context,
                ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Theme.of(context).accentColor,
                            child: Text(
                              '${index + 1})',
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          title: Text(selectedMeal.steps[index],style: TextStyle(
                            fontSize: 15,
                          ),),
                        ),
                        const Divider(),
                      ],
                    );
                  },
                  itemCount: selectedMeal.steps.length,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(isMealFavourite(mealId)==true ? Icons.star : Icons.star_border),
          onPressed: () {
            toggleFavourite(mealId);
          },
        ));
  }
}
