//The screen after pressing a category name

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';

import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/categories-meals'; //to avoid name misstype

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeals;
  var loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!loadedInitData) {
      final routeArgs = ModalRoute.of(context)?.settings.arguments
          as Map<String, String>; //arguments from category_item class
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title']!;
      displayedMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList(); //returns a list of category meals
      loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeItem(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle!,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            affordability: displayedMeals[index].affordability,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            removeItem: _removeItem,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
