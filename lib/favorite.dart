import 'package:flutter/material.dart';
import 'meal.dart';
import 'Category_detail_Style.dart';

class favorite extends StatelessWidget {
  List<Meal> favorites_meals;
  favorite(this.favorites_meals);
  @override
  Widget build(BuildContext context) {
    if (favorites_meals.isEmpty) {
      return Center(child: Text("No Favorite"));
    } else {
      return ListView.builder(
        itemCount: favorites_meals.length,
        itemBuilder: ((context, index) {
          return Category_detail_Style(
            favorites_meals[index].title,
            favorites_meals[index].imageUrl,
            favorites_meals[index].complexity,
            favorites_meals[index].affordability,
            favorites_meals[index].duration,
            favorites_meals[index].id,
            null,
          );
        }),
      );
    }
  }
}
