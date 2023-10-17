import 'package:flutter/material.dart';
import '../models/trip_model.dart';
import '../widgets/category_trip_card.dart';

class FavoritesScreen extends StatelessWidget {
  //const FavoritesScreen({Key? key}) : super(key: key);

  final List<Trip> favoritesTrips;

  FavoritesScreen({required this.favoritesTrips});

  @override
  Widget build(BuildContext context) {
    if (favoritesTrips.isEmpty) {
      return const Center(child: Text('ليس لديك اي رحله في قائمه المفضلة '));
    } else {
      return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => CategoryTripCard(
          //removeItem: _removeItem,
          id: favoritesTrips[index].id,
          title: favoritesTrips[index].title,
          imageUrl: favoritesTrips[index].imageUrl,
          duration: favoritesTrips[index].duration.toString(),
          tripType: favoritesTrips[index].tripType,
          season: favoritesTrips[index].season,
        ),
        itemCount: favoritesTrips.length,
      );
    }
  }
}
