import 'package:flutter/material.dart';
import 'Category_screen_style.dart';
import 'dummydata.dart';

class Category_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(25),
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
        children: DUMMY_CATEGORIES.map((e) {
          return Category_screen_style(e.title, e.color, e.id);
        }).toList(),
      ),
    );
  }
}
