import 'package:flutter/material.dart';
import 'Category_detail_Style.dart';
import 'meal.dart';

class Category_detail extends StatefulWidget {
  final List<Meal> Avaible_meal;
  Category_detail(this.Avaible_meal);
  @override
  State<Category_detail> createState() => _Category_detailState();
}

class _Category_detailState extends State<Category_detail> {
  String title;
  List<Meal> Listt;
  @override
  void initState() {
    // will work without context
    print("innit");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("Dependies");
    final routearg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    title = routearg['title'];
    final id = routearg['id'];
    Listt = widget.Avaible_meal.where(
      (meal) => meal.categories.contains(id),
    ).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealid) {
    print("remove");
    setState(() {
      Listt.removeWhere((element) => element.id == mealid);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: Listt.length,
        itemBuilder: ((context, index) {
          return Category_detail_Style(
              Listt[index].title,
              Listt[index].imageUrl,
              Listt[index].complexity,
              Listt[index].affordability,
              Listt[index].duration,
              Listt[index].id,
              _removeMeal);
        }),
      ),
    );
  }
}
