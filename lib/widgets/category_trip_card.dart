import 'package:flutter/material.dart';

import '../models/trip_model.dart';
import '../screens/trip_details_screen.dart';

class CategoryTripCard extends StatelessWidget {
  //const CategoryTripCard({Key? key}) : super(key: key);

  final String id;

  final String title;

  final String imageUrl;

  final String duration;

  final TripType tripType;

  final Season season;

  //final Function removeItem;

  const CategoryTripCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.tripType,
    required this.season,
    required this.id,
    // required this.removeItem,
  });

  String get seasonText {
    switch (season) {
      case Season.Winter:
        return 'شتاء ';
      case Season.Autumn:
        return 'خريف ';
      case Season.Spring:
        return 'ربيع ';
      case Season.Summer:
        return 'صيف ';
      default:
        return 'غير معروف';
    }
  }

  String get tripTypeText {
    switch (tripType) {
      case TripType.Activities:
        return 'انشطة ';
      case TripType.Exploration:
        return 'استكشاف ';
      case TripType.Recovery:
        return 'نقاهة ';
      case TripType.Therapy:
        return 'معالجة ';
      default:
        return 'UnKnown';
    }
  }

  void gotToTripDetails(BuildContext context) {
    Navigator.pushNamed(
      context,
      TripDetailsScreen.screenRoute,
      arguments: id,
    ).then((trip) {
      if (trip != null) {
        //removeItem(trip);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: () => gotToTripDetails(context),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15.0),
                    topLeft: Radius.circular(15.0),
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 250,
                  ),
                ),
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.0),
                        Colors.black.withOpacity(0.8),
                      ],
                      stops: const [0.1, 1],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Container(
                      child: Text(
                    title,
                    style: Theme.of(context).textTheme.headlineLarge,
                    overflow: TextOverflow.fade,
                  )),
                )
              ],
            ),
            Container(
              height: 55,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    defaultCardInfo(
                      context,
                      icon: Icons.calendar_month,
                      text: '$duration يوم ',
                    ),
                    defaultCardInfo(
                      context,
                      icon: Icons.sunny,
                      text: seasonText,
                    ),
                    defaultCardInfo(
                      context,
                      icon: Icons.family_restroom,
                      text: tripTypeText,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget defaultCardInfo(
  BuildContext context, {
  required String text,
  required IconData icon,
}) =>
    Row(
      children: [
        Icon(icon),
        const SizedBox(
          width: 6,
        ),
        Text(
          text,
          overflow: TextOverflow.fade,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
