import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'dummydata.dart';
import 'meal.dart';
import 'Category_specific_meal.dart';

class Category_detail_Style extends StatelessWidget {
  final String src;
  final String title;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;
  final String id;
  final Function RemoveItem;

  String get get_Complexity {
    if (complexity == Complexity.Simple) return 'Simple';
    if (complexity == Complexity.Challenging) return 'Challenging';
    if (complexity == Complexity.Hard) return 'Hard';
  }

  String get get_Affordability {
    if (affordability == Affordability.Affordable) return 'Affordable';
    if (affordability == Affordability.Pricey) return 'Pricey';
    if (affordability == Affordability.Luxurious) return 'Luxurious';
  }

  Category_detail_Style(this.title, this.src, this.complexity,
      this.affordability, this.duration, this.id, this.RemoveItem);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 35, top: 5),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              print("object");
              Navigator.of(context)
                  .pushNamed(Category_specific_Style.routename2, arguments: {
                'title': title,
                'image': src,
                'id': id
              }).then((value) {
                if (value != null) {
                  RemoveItem(value);
                }
              });
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Stack(children: [
                    Image.network(
                      src,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 20,
                      right: 10,
                      child: Container(
                        width: 220,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: (BoxDecoration(color: Colors.black54)),
                        child: Text(
                          title,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.schedule),
                            SizedBox(
                              width: 6,
                            ),
                            Text('$duration min'),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.work),
                            SizedBox(
                              width: 6,
                            ),
                            Text(get_Complexity),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.attach_money),
                            SizedBox(
                              width: 6,
                            ),
                            Text(get_Affordability)
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
