import 'package:flutter/material.dart';
import '../models/categories_model.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20 ,
                right: 10 ,
                left: 10
              ),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 7/8,
                  mainAxisSpacing: 10 ,
                  crossAxisSpacing:10,
                ),
                itemBuilder: (context, index) => CategoryItem(categoryItem:categoriesData[index]) ,
                itemCount:categoriesData.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
