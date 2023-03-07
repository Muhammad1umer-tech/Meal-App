import 'package:app/Category_datail.dart';
import 'package:flutter/material.dart';

class Category_screen_style extends StatelessWidget {
  static const routename = '/category-detail';
  final String title;
  final String id;
  final Color col;
  Category_screen_style(this.title, this.col, this.id);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (_) {
        //       return Category_detail(title, id);
        //     },
        //   ),
        Navigator.of(context)
            .pushNamed(routename, arguments: {'id': id, 'title': title});
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [col, col.withOpacity(.7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
