import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  AppBar apbar = AppBar(
    title: Text('Filters'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: apbar,
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            /*height: MediaQuery.of(context).size.height -
                apbar.preferredSize.height -
                MediaQuery.of(context).padding.top,*/
            padding: EdgeInsets.all(20),
            child: Align(
                alignment: Alignment.topCenter,
                child: Text('Adjust your meals')),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Gluten Free',
                  'Only include gluten-free melas',
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only include vegetarian melas',
                  _vegetarian,
                  (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Lactose Free',
                  'Only include lactose-free melas',
                  _lactoseFree,
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include vegan melas',
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
