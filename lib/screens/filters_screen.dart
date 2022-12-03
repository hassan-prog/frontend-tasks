import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.saveFilters, this.currentFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _lactoseFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _glutenFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    super.initState();
  }

  // Widget _buildSwitchListTile(String title, String description,
  //     bool currentValue, Function updateValue) {
  //   return SwitchListTile(
  //     value: currentValue,
  //     title: Text(
  //       title,
  //     ),
  //     subtitle: Text(description),
  //     onChanged: updateValue,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegetarian': _vegetarian,
                'vegan': _vegan,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meals selection.',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                setState(() {
                  _lactoseFree = false;
                  _glutenFree = false;
                  _vegan = false;
                  _vegetarian = false;
                });
              },
              child: Text(
                'Reset filters',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                // _buildSwitchListTile(
                //   'Gluten-free',
                //   'Only include gluten-free meals.',
                //   _glutenFree,
                //   (newValue) {
                //     setState(() {
                //       _glutenFree = newValue;
                //     });
                //   },
                // ),
                // _buildSwitchListTile(
                //   'Lactose-free',
                //   'Only include lactose-free meals.',
                //   _lactoseFree,
                //   (newValue) {
                //     setState(() {
                //       _lactoseFree = newValue;
                //     });
                //   },
                // ),
                // _buildSwitchListTile(
                //   'Vegetarian',
                //   'Only include vegetarian meals.',
                //   _vegetarian,
                //   (newValue) {
                //     setState(() {
                //       _vegetarian = newValue;
                //     });
                //   },
                // ),
                // _buildSwitchListTile(
                //   'Vegan',
                //   'Only include vegan meals.',
                //   _vegan,
                //   (newValue) {
                //     setState(() {
                //       _vegan = newValue;
                //     });
                //   },
                // ),
                SwitchListTile(
                  value: _glutenFree,
                  title: Text(
                    'Gluten-free',
                  ),
                  subtitle: Text('Only include gluten-free meals.'),
                  onChanged: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                  activeColor: Theme.of(context).colorScheme.secondary,
                ),
                SwitchListTile(
                  value: _lactoseFree,
                  title: Text(
                    'Lactose-free',
                  ),
                  subtitle: Text('Only include lactose-free meals.'),
                  onChanged: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                  activeColor: Theme.of(context).colorScheme.secondary,
                ),
                SwitchListTile(
                  value: _vegetarian,
                  title: Text(
                    'Vegetarian',
                  ),
                  subtitle: Text('Only include vegetarian meals.'),
                  onChanged: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                  activeColor: Theme.of(context).colorScheme.secondary,
                ),
                SwitchListTile(
                  value: _vegan,
                  title: Text(
                    'Vegan',
                  ),
                  subtitle: Text('Only include vegan meals.'),
                  onChanged: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                  activeColor: Theme.of(context).colorScheme.secondary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
