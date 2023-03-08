import 'package:flutter/material.dart';
import './Category_datail.dart';
import 'Category_specific_meal.dart';
import 'tabscreen.dart';
import 'filter.dart';
import 'meal.dart';
import 'dummydata.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatefulWidget {
  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'latcos': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _available_meal = DUMMY_MEALS;
  List<Meal> favorites_meals = [];

  void _set_Filters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _available_meal = DUMMY_MEALS.where((element) {
        if (_filters['gluten'] && !element.isGlutenFree) {
          return false;
        }
        if (_filters['vegan'] && !element.isVegan) {
          return false;
        }
        if (_filters['lactose'] && !element.isLactoseFree) {
          return false;
        }
        if (_filters['vegetarian'] && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggle_favorite(String id) {
    final index = favorites_meals.indexWhere((element) => element.id == id);
    if (index >= 0) {
      setState(() {
        favorites_meals.removeAt(index);
      });
    } else {
      setState(() {
        favorites_meals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == id));
      });
    }
  }

  bool isMealFavorite(String id) {
    // return favorites_meals.any((element) => element.id == id);
    for (int a = 0; a < favorites_meals.length; a++) {
      if (favorites_meals[a].id == id) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => TabScreen(favorites_meals),
        '/category-detail': ((context) => Category_detail(_available_meal)),
        Category_specific_Style.routename2: (context) =>
            Category_specific_Style(_toggle_favorite, isMealFavorite),
        FiltersScreen.routename: (context) =>
            FiltersScreen(_set_Filters, _filters),
      },
    );
  }
}
