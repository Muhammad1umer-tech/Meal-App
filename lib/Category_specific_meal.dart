import 'package:flutter/material.dart';
import 'dummydata.dart';

class Category_specific_Style extends StatelessWidget {
  final Function _toggle_favorite;
  final Function isMealFavorite;
  Category_specific_Style(this._toggle_favorite, this.isMealFavorite);
  static const routename2 = '/Category_specific_Style';
  Widget heading(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routearg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final title = routearg['title'];
    final image = routearg['image'];
    final id = routearg['id'];
    final listt = DUMMY_MEALS.firstWhere((element) {
      return element.id == id;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(listt.title),
      ),
      body: SingleChildScrollView(
        //if cone error, then wrap with singlechild scroll view
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
            heading(context, "Ingredient"),
            buildContainer(
              ListView.builder(
                itemCount: listt.ingredients.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.amber,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        listt.ingredients[index],
                      ),
                    ),
                  );
                },
              ),
            ),
            //listview has an infinit height;
            heading(context, "Steps"),
            buildContainer(ListView.builder(
              itemCount: listt.steps.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                      ),
                      title: Text(listt.steps[index]),
                    ),
                    Divider(),
                  ],
                );
              },
            ))
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.delete),
      //   onPressed: () => Navigator.of(context).pop(id),
      // ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isMealFavorite(id) ? Icons.star : Icons.star_border),
        onPressed: () => _toggle_favorite(id),
      ),
    );
  }
}
