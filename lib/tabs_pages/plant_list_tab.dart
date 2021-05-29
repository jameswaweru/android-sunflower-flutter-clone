import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlantListTab extends StatefulWidget {
  @override
  _PlantListTabState createState() => _PlantListTabState();
}

class _PlantListTabState extends State<PlantListTab> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10, 
        padding: EdgeInsets.all(25),
          children: [

          ],
    );
  }
}
