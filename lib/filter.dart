import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'drawerTab.dart';

class filter extends StatefulWidget {
  static const routename3 = '/filter';
  final Function _set_Filters;
  final Map<String, bool> current_filters;
  filter(this._set_Filters, this.current_filters);

  @override
  State<filter> createState() => _filterState();
}

class _filterState extends State<filter> {
  var _glutenfree = false;
  var _Vegetarian = false;
  var _vegan = false;
  var _locatosfree = false;
  @override
  void initState() {
    _glutenfree = widget.current_filters['gluten'];
    _locatosfree = widget.current_filters['lactose'];
    _Vegetarian = widget.current_filters['vegetarian'];
    _vegan = widget.current_filters['vegan'];
    super.initState();
  }

  Widget _buildSwitchTile(
      String title, String Subtitle, bool current, Function func) {
    return SwitchListTile(
        subtitle: Text(title),
        title: Text(Subtitle),
        value: current,
        onChanged: func);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerTab(),
      appBar: AppBar(
        title: Text("Setting"),
        actions: [
          IconButton(
              onPressed: () {
                Map<String, bool> hehe = {
                  'gluten': _glutenfree,
                  'lactose': _locatosfree,
                  'vegan': _vegan,
                  'vegetarian': _Vegetarian,
                };
                widget._set_Filters(hehe);
              },
              icon: const Icon(Icons.save)),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: const Text('Adjust your meal Selection.'),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchTile(
                    "Only Inclue Gluten Free Meal", "Gluten free", _glutenfree,
                    (newvalue) {
                  setState(() {
                    _glutenfree = newvalue;
                  });
                }),
                _buildSwitchTile("Only Inclue Lactose Free Meal",
                    "Lactose free", _locatosfree, (newvalue) {
                  setState(() {
                    _locatosfree = newvalue;
                  });
                }),
                _buildSwitchTile("Only Inclue Vegatarian Free Meal",
                    "Vegatarian free", _Vegetarian, (newvalue) {
                  setState(() {
                    _Vegetarian = newvalue;
                  });
                }),
                _buildSwitchTile(
                    "Only Inclue Vegan Free Meal", "Vegan free", _vegan,
                    (newvalue) {
                  setState(() {
                    _vegan = newvalue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
