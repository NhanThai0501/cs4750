/*
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String,bool> filters;
  FilterScreen({required this.saveFilters,required this.filters});
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.filters['gluten'] as bool;
    _lactoseFree = widget.filters['lactose'] as bool;
    _vegetarian = widget.filters['vegetarian'] as bool;
    _vegan = widget.filters['vegan'] as bool;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Filters',
            style: TextStyle(fontFamily: 'Raleway' ,
                fontSize: 30.0,
                fontWeight: FontWeight.bold), ),
          actions: [
            IconButton(
                onPressed: () {
                  widget.saveFilters({
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegetarian': _vegetarian,
                    'vegan': _vegan,
                  });
                },
                icon: Icon(Icons.done))
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                'Sort your type of meals',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  SwitchListTile(
                    title: const Text('Gluten-Free', style: TextStyle(fontFamily: 'Raleway', fontSize: 25),),
                    value: _glutenFree,
                    subtitle: const Text('Gluten-Free meals only'),
                    onChanged: (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Vegetarian', style: TextStyle(fontFamily: 'Raleway', fontSize: 25),),
                    value: _vegetarian,
                    subtitle: const Text('Vegetarian meals only'),
                    onChanged: (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Lactose-Free', style: TextStyle(fontFamily: 'Raleway', fontSize: 25),),
                    value: _lactoseFree,
                    subtitle: const Text('Lactose-Free meals only'),
                    onChanged: (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Vegan', style: TextStyle(fontFamily: 'Raleway', fontSize: 25),),
                    value: _vegan,
                    subtitle: const Text('Only include Vegan meals'),
                    onChanged: (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}*/
