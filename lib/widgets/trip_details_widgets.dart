import 'package:flutter/material.dart';
import '../theme/theme.dart';

Widget containerTitle(BuildContext context, {required String text}) => Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );

Widget customListViewDecoration({required Widget child}) => Container(
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: child,
    );

Widget buildListViewCardItem(context, {required String text}) => Card(
      elevation: 0.4,
      color: const Color(0xFFE5EAF5),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );

Widget buildListViewProgramItem(context,
        {required circleAvatarText, required String text}) =>
    Row(
      children: [
        CircleAvatar(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          radius: 20,
          // child: Text('يوم ${index + 1} '),
          child: Text(circleAvatarText),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
            child: buildListViewCardItem(
          context,
          // text: selectedTrip.program[index],
          text: text,
        )),
      ],
    );

// Widget buildListViewProgramItem(context,
//     {required circleAvatarText, required String text}) =>
//     ListTile(
//       leading: CircleAvatar(
//         backgroundColor: Colors.amber,
//         foregroundColor: Colors.blue,
//         radius: 20,
//         // child: Text('يوم ${index + 1} '),
//         child: Text(circleAvatarText),
//       ),
//       title:        buildListViewCardItem(
//         context,
//         // text: selectedTrip.program[index],
//         text: text,
//       ),
//
//     );
//
