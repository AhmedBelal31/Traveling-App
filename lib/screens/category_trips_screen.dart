import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/trip_model.dart';
import '../widgets/category_trip_card.dart';

class CategoryTrips extends StatefulWidget {
  //const CategoryTrips({Key? key}) : super(key: key);

  static const screenRoute = 'category_trips';

  List<Trip> availableTrips;

  CategoryTrips({required this.availableTrips});

  @override
  State<CategoryTrips> createState() => _CategoryTripsState();
}

class _CategoryTripsState extends State<CategoryTrips> {
  late List<Trip> displayTrips;
  late String categoryTripTitle;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final routeArgument =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    categoryTripTitle = routeArgument['title']!;
    final categoryTripId = routeArgument['Id']!;

    displayTrips = widget.availableTrips.where((element) {
      return element.categories.contains(categoryTripId);
    }).toList();

    super.didChangeDependencies();
  }

  // void _removeItem(String tripId) {
  //   setState(() {
  //     displayTrips.removeWhere((trip) => trip.id == tripId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTripTitle),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => CategoryTripCard(
          //removeItem: _removeItem,
          id: displayTrips[index].id,
          title: displayTrips[index].title,
          imageUrl: displayTrips[index].imageUrl,
          duration: displayTrips[index].duration.toString(),
          tripType: displayTrips[index].tripType,
          season: displayTrips[index].season,
        ),
        itemCount: displayTrips.length,
      ),
    );
  }
}
