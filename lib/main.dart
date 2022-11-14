import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/meal_detail_screen.dart';

import './screens/category_meals_screen.dart';
// import './screens/meal_detail_screen.dart';
import './screens/catagories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primaryColor: Colors.pink,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.amber,
        ),
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              // bodyText1: TextStyle(
              //   color: Color.fromRGBO(20, 51, 51, 1),
              // ),
              // bodyText2: TextStyle(
              //   color: Color.fromRGBO(20, 51, 51, 1),
              // ),
              bodySmall: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyMedium: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              titleSmall: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: CatagoriesScreen(),
      routes: {
        '/': (ctx) => CatagoriesScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      }, //routes are for the navigation of pages
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CatagoriesScreen());
      },
    );
  }
}
