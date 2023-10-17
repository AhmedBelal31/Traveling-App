import 'package:flutter/material.dart';

import '../models/categories_model.dart';
import '../screens/category_trips_screen.dart';

class CategoryItem extends StatelessWidget {
  //const CategoryItem({Key? key}) : super(key: key);

  Category categoryItem;

  CategoryItem({
    super.key,
    required this.categoryItem,
  });

  void onPress(BuildContext context) {
    Navigator.pushNamed(context, CategoryTrips.screenRoute, arguments: {
      'title': categoryItem.title,
      'Id': categoryItem.id,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.blueGrey,
      borderRadius: BorderRadius.circular(15.0),
      onTap: () => onPress(context),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.network(
              categoryItem.imageUrl,
              fit: BoxFit.cover,
              height: 250,
            ),
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.black.withOpacity(.6)),
          ),
          Text(categoryItem.title,
              style: Theme.of(context).textTheme.headlineLarge)
        ],
      ),
    );
  }
}
