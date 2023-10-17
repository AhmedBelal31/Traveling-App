import 'package:flutter/material.dart';
import 'package:travel_app/screens/filters_screen.dart';
import '../models/trip_model.dart';
import '../widgets/app_drawer.dart';
import 'categories_screen.dart';
import 'favorites_screen.dart';

class LayoutScreen extends StatefulWidget {
  //const LayoutScreen({Key? key}) : super(key: key);

  List<Trip> favoritesTrips;

  LayoutScreen({required this.favoritesTrips});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  // int _index = 0;

  // List _titles = ['تصنيفات الرحلات', 'الرحلات المفضلة '];

  // List<Widget> _screens = [
  //   CategoriesScreen(),
  //   FavoritesScreen(favoritesScreen:widget.favoritesTrips),
  // ];
  //

  int _selectedScreenIndex = 0;
  late List<Map<String, dynamic>> _screens;

  @override
  void initState() {
    _screens = [
      {
        'Screen': const CategoriesScreen(),
        'Title': 'تصنيفات الرحلات',
      },
      {
        'Screen': FavoritesScreen(favoritesTrips: widget.favoritesTrips),
        'Title': 'الرحلات المفضلة',
      },
    ];
    super.initState();
  }

  void _selectScreen(index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('دليل سياحي  '),
        title: Text(_screens[_selectedScreenIndex]['Title']),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _selectScreen,
        currentIndex: _selectedScreenIndex,
        selectedLabelStyle: const TextStyle(
          fontFamily: 'ElMessiri',
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'ElMessiri',
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'التصنيفات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: ' الرحلات المفضله',
          ),
        ],
      ),
      drawer: AppDrawer(context),
      body: _screens[_selectedScreenIndex]['Screen'],
    );
  }
}
