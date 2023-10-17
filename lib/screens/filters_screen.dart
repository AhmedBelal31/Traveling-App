import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  //const FiltersScreen({Key? key}) : super(key: key);

  static const screenRoute = 'filters';
  final Function saveFilters;
  final Map<String ,bool> currentFilters ;

  FiltersScreen({required this.saveFilters , required this.currentFilters});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}


var summer = false;
var winter = false;
var family = false;

class _FiltersScreenState extends State<FiltersScreen> {
  @override

  initState(){
    summer =widget.currentFilters['summer']! ;
    winter =widget.currentFilters['winter']! ;
    family =widget.currentFilters['family']! ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الفلترة'),
        actions: [
          IconButton(
            onPressed: () {
             final selectedFilters  = {
                'summer': summer,
                'winter': winter,
                'family': family,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      drawer: AppDrawer(context),
      body: Column(
        children: [
          const SizedBox(height: 50),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                    title: 'الرحلات الصيفية فقط',
                    subtitle: 'اظهار الرحلات في فصل الصيف فقط ',
                    value: summer,
                    onChanged: (newValue) {
                      setState(() {
                        summer = newValue;
                      });
                    }),
                buildSwitchListTile(
                    title: 'الرحلات الشتويه فقط',
                    subtitle: 'اظهار الرحلات في فصل الشتاء فقط ',
                    value: winter,
                    onChanged: (newValue) {
                      setState(() {
                        winter = newValue;
                      });
                    }),
                buildSwitchListTile(
                    title: '  للعائلات',
                    subtitle: 'اظهار الرحلات التي للعائلات فقط ',
                    value: family,
                    onChanged: (newValue) {
                      setState(() {
                        family = newValue;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSwitchListTile({
    required String title,
    required String subtitle,
    required Function(bool) onChanged,
    required bool value,
  }) =>
      SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        //onChanged:(value)=>onChanged(value),
        onChanged: onChanged,
      );
}
