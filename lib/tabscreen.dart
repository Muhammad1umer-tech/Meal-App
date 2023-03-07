import 'package:app/favorite.dart';
import 'package:flutter/material.dart';
import 'Category_screen.dart';
import 'drawerTab.dart';
import 'meal.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favorites_meals;
  TabScreen(this.favorites_meals);
  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> page = [];

  @override
  void initState() {
    //if we dont know the type, like page than int
    page = [
      {'page': Category_screen(), 'title': 'Categories'},
      {'page': favorite(widget.favorites_meals), 'title': 'Favorite'},
    ];
    super.initState();
  }

  int flag = 0;
  void _Selectpage(int index) {
    setState(() {
      flag = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DrawerTab(),
      ),
      appBar: AppBar(title: Text(page[flag]['title'])),
      body: page[flag]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: flag,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        onTap: _Selectpage,
        backgroundColor: Theme.of(context).primaryColor,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorite"),
        ],
      ),
    );
  }
}
