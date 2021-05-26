import 'package:android_sunflower/widgets/planted_plants_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyGardenTab extends StatefulWidget {

  List<String> plantedPlants;
  MyGardenTab({required this.plantedPlants});

  @override
  _MyGardenTabState createState() => _MyGardenTabState();
}

class _MyGardenTabState extends State<MyGardenTab> {
  // set an int with value -1 since no card has been selected
  int selectedCard = -1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView.builder(
        itemCount: widget.plantedPlants.length,
          itemBuilder: (context , index)=>
              GardenPlant()
      ),
    );
  }
}