import 'package:flutter/material.dart';
import 'meal.dart';
import 'Category_detail_Style.dart';

class favorite extends StatefulWidget {
  List<Meal> favorites_meals;
  favorite(this.favorites_meals);

  @override
  State<favorite> createState() => _favoriteState();
}

class _favoriteState extends State<favorite> {
  @override
  Widget build(BuildContext context) {
    if (widget.favorites_meals.isEmpty) {
      return Center(child: Text("No Favorite"));
    } else {
      return ListView.builder(
        itemCount: widget.favorites_meals.length,
        itemBuilder: ((context, index) {
          return Category_detail_Style(
            widget.favorites_meals[index].title,
            widget.favorites_meals[index].imageUrl,
            widget.favorites_meals[index].complexity,
            widget.favorites_meals[index].affordability,
            widget.favorites_meals[index].duration,
            widget.favorites_meals[index].id,
            null,
          );
        }),
      );
    }
  }
}
