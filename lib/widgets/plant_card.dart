import 'dart:convert';

import 'package:android_sunflower/constants/colors.dart';
import 'package:android_sunflower/constants/constants.dart';
import 'package:android_sunflower/models/plant.dart';
import 'package:android_sunflower/pages/gallery_page.dart';
import 'package:android_sunflower/pages/plant_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlantCard extends StatefulWidget {

  Plant plant;
  PlantCard(this.plant);

  @override
  _PlantCardState createState() => _PlantCardState();
}
//replaced by plant_list_card
class _PlantCardState extends State<PlantCard> {

  SharedPreferences? preferences;
  List<Plant> plantedPlants = [];
  String? plantedPlantsString ;
  DateTime? timeNow;
  bool? isPlantAdded ;
  Plant? selectedPlant;



  Future<void> initializePreference() async{
    this.preferences = await SharedPreferences.getInstance();
  }

  checkIFPlantIsAdded(Plant selectedPlant){
    this.initializePreference().whenComplete((){
      //print("pref has been initialized, now checking if plant has been added");
      plantedPlantsString = this.preferences?.getString("plantedPlantsJsonString");
      var plantsObjsJson = jsonDecode(plantedPlantsString!)as List;
      plantedPlants= plantsObjsJson.map((plantJson) => Plant.fromJson(plantJson)).toList();
      for(var i=0;i<plantedPlants.length;i++){
        if(plantedPlants[i].plantId == selectedPlant.plantId){
          isPlantAdded = true;
        }
      }
      print("plant is added results:"+isPlantAdded.toString());
      Navigator.push(
          context,
          PageTransition(
              duration: Duration(milliseconds: 700),
              type: PageTransitionType.fade,
              child: PlantDetails(selectedPlant, this.isPlantAdded)));
    });
  }



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: (){
        checkIFPlantIsAdded(widget.plant);
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.all(10),
        width: width - fixPadding * 4.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)
          ),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: widget.plant.name,
              child: Container(
                // width: width - fixPadding * 4.0,
                height: 100.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.plant.imageUrl),
                      fit: BoxFit.cover),
                ),
              ),
            ),

            Container(
              width: width,
              padding: EdgeInsets.all(fixPadding),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(widget.plant.name , style: TextStyle(color: Colors.black,),textAlign: TextAlign.center,),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
