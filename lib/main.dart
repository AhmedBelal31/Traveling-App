import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:travel_app/models/trip_model.dart';
import 'package:travel_app/screens/filters_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/category_trips_screen.dart';
import 'screens/layout.dart';
import 'screens/trip_details_screen.dart';
import 'theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'summer': false,
    'winter': false,
    'family': false,
  };

  List<Trip> availableTrips = tripsData;

  List<Trip> favoriteTrips = [];

  void _changeFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      availableTrips = tripsData.where((trip) {
        if (_filters['summer'] == true && trip.isInSummer != true) {
          return false;
        }
        if (_filters['winter'] == true && trip.isInWinter != true) {
          return false;
        }
        if (_filters['family'] == true && trip.isForFamilies != true) {
          return false;
        } else
          return true;
      }).toList();
    });
    //print(availableTrips.length);
  }

  void _manageFavorite(String tripId) {
    final existingIndex = favoriteTrips.indexWhere((trip) => trip.id == tripId);
    if (existingIndex >= 0) {
      setState(() {
        favoriteTrips.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoriteTrips.add(
          tripsData.firstWhere((trip) => trip.id == tripId),
        );
      });
    }
  }

  bool isFovarite(String id) {
    return favoriteTrips.any((trip) => trip.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel',
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en", "US"), // English
        Locale("ar", "AE"), // Arabic
      ],
      locale: const Locale("ar", "AE"),

      theme: getThemeData(),
      debugShowCheckedModeBanner: false,

      //home: const CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => LayoutScreen(favoritesTrips: favoriteTrips),
        CategoryTrips.screenRoute: (context) =>
            CategoryTrips(availableTrips: availableTrips),
        TripDetailsScreen.screenRoute: (context) => TripDetailsScreen(
            manageFavorite: _manageFavorite, isFavorite: isFovarite),
        FiltersScreen.screenRoute: (context) => FiltersScreen(
            currentFilters: _filters, saveFilters: _changeFilters),
      },
    );
  }
}
