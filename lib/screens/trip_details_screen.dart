import 'package:flutter/material.dart';
import '../models/trip_model.dart';
import '../widgets/trip_details_widgets.dart';

class TripDetailsScreen extends StatelessWidget {
  //const TripDetailsScreen({Key? key}) : super(key: key);
  static const screenRoute = 'trip_details';

  final Function manageFavorite;

  final Function isFavorite;

  TripDetailsScreen({required this.manageFavorite, required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)!.settings.arguments as String;

    final selectedTrip = tripsData.firstWhere((element) {
      return element.id == tripId;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedTrip.title),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () {
        //  // Navigator.of(context).pop(tripId);
        // },
        onPressed: () => manageFavorite(tripId),
        child: Icon(isFavorite(tripId) ? Icons.star : Icons.star_border),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Image.network(
              selectedTrip.imageUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            containerTitle(context, text: 'ألانشطة'),
            customListViewDecoration(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildListViewCardItem(context,
                    text: selectedTrip.activities[index]),
                itemCount: selectedTrip.activities.length,
              ),
            ),
            containerTitle(context, text: 'البرنامج اليومي'),
            customListViewDecoration(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildListViewProgramItem(
                  context,
                  circleAvatarText: 'يوم ${index + 1} ',
                  text: selectedTrip.program[index],
                ),
                itemCount: selectedTrip.program.length,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
