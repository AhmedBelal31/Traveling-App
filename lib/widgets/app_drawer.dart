import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';
import '../theme/theme.dart';

Widget AppDrawer(BuildContext context) {
  return Drawer(
    child: Column(
      children: [
        // SizedBox(height: 50),
        Container(
          alignment: Alignment.center,
          color: primaryColor,
          width: double.infinity,
          height: 100,
          padding: const EdgeInsets.only(top: 40),
          child: Text('دليلك السياحي ',
              style: Theme.of(context).textTheme.headlineLarge),
        ),
        const SizedBox(height: 20),
        buildListTile(
          icon: Icons.card_travel,
          titleText: ' الرحلات',
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        buildListTile(
          icon: Icons.filter_list,
          titleText: 'الفلتره',
          onTap: () {
            Navigator.of(context).pushReplacementNamed(
              FiltersScreen.screenRoute,
            );
          },
        ),
      ],
    ),
  );
}

ListTile buildListTile({
  required String titleText,
  required Function() onTap,
  required IconData icon,
}) {
  return ListTile(
    leading: Icon(
      icon,
      color: accentColor,
      size: 30,
    ),
    title: Text(
      titleText,
      style: const TextStyle(
        fontSize: 24,
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontFamily: 'ElMessiri',
      ),
    ),
    onTap: onTap,
  );
}
