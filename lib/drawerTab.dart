import 'package:app/Category_screen.dart';
import 'package:app/filter.dart';
import 'package:flutter/material.dart';
import 'filter.dart';

class DrawerTab extends StatelessWidget {
  Widget listTile(String title, IconData icon, Function tabHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'RobotoConsensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: tabHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Colors.amber,
          child: Text(
            'Cooking Up!',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        SizedBox(height: 20),
        listTile('Meals', Icons.restaurant, () {
          return Navigator.of(context).pushReplacementNamed('/');
        }),
        listTile('Setting', Icons.settings, () {
          return Navigator.of(context)
              .pushReplacementNamed(FiltersScreen.routename);
        }),
      ]),
    );
  }
}
