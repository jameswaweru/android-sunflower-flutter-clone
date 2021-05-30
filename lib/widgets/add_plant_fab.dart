import 'package:android_sunflower/models/Planted.dart';
import 'package:android_sunflower/models/plant.dart';
import 'package:android_sunflower/pages/home_two.dart';
import 'package:android_sunflower/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AddPlantFab extends StatefulWidget {

  final double defaultTopMargin;
  //pixels from top where scaling should start
  final double scaleStart ;
  final ScrollController scrollController;
  Plant plant;
  bool? isPlantAdded ;
  BuildContext? buildContext;

  AddPlantFab({
    required this.defaultTopMargin ,
    required this.scaleStart,
    required this.scrollController,
    required this.plant ,
    required this.isPlantAdded
  });


  @override
  _AddPlantFabState createState() => _AddPlantFabState();
}

class _AddPlantFabState extends State<AddPlantFab> {

  SharedPreferences? preferences;
  List<Plant> plantedPlants = [];
  String? plantedPlantsString = "";

  

  Future<void> initializePreference() async{
    this.preferences = await SharedPreferences.getInstance();
  }

  Future<void> retrieveSavedPlants() async{
    plantedPlantsString = this.preferences?.getString("plantedPlantsJsonString");
  }

  Future<void> storingPlants(Plant plant) async{

    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    plant.datePlanted = getMonthString(now.month)+" "+now.day.toString()+" , "+now.year.toString();


    if(plantedPlantsString == null){
      print("retrieved plants is null...");
      plantedPlants.add(plant);
      await this.preferences?.setString('plantedPlantsJsonString', jsonEncode(plantedPlants));
    }else{

      var plantsObjsJson = jsonDecode(plantedPlantsString!)as List;
      plantedPlants= plantsObjsJson.map((plantJson) => Plant.fromJson(plantJson)).toList();
      plantedPlants.add(plant);

      await this.preferences?.setString('plantedPlantsJsonString', jsonEncode(plantedPlants));

      print("retrieved plants is not null..."+jsonEncode(plantedPlants));
    }

    Navigator.of(context).pop();

  }

  String getMonthString(int month){
    String monthString = month == 1 ? "Jan"
        : month == 2 ? "Feb"
        : month == 3 ? "March"
        : month == 4 ? "April"
        : month == 5 ? "May"
        : month == 6 ? "June"
        : month == 7 ? "July"
        : month == 8 ? "Aug"
        : month == 9 ? "Sept"
        : month == 10 ? "Oct"
        : month == 11 ? "Nov"
        : month == 12 ? "Dec"
        : "Invalid";
    return monthString;
  }


  @override
  Widget build(BuildContext context) {


   this.initializePreference().whenComplete((){
      print("pref has been initialized...");
      this.retrieveSavedPlants();
   });

   print("isPlantAdded:"+widget.isPlantAdded.toString());

    final double scaleEnd = widget.scaleStart / 2;

    double top = widget.defaultTopMargin;
    double scale = 1.0;
    if (widget.scrollController.hasClients) {
      double offset = widget.scrollController.offset;
      top -= offset;
      if (offset < widget.defaultTopMargin - widget.scaleStart) {
        //offset small => don't scale down
        scale = 1.0;
      } else if (offset < widget.defaultTopMargin - scaleEnd) {
        //offset between scaleStart and scaleEnd => scale down
        scale = (widget.defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        //offset passed scaleEnd => hide fab
        scale = 0.0;
      }
    }


    return new Positioned(
      top: top,
      right: 16.0,
      child: widget.isPlantAdded != true ? new Transform(
        transform: new Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: new FloatingActionButton(
          backgroundColor: Colors.yellow,
          onPressed: () => {
            // addPlantIntoStorage(widget.plant)
            storingPlants(widget.plant)

          },
          child: new Icon(Icons.add , color: Colors.black,),
        ),
      ) : new Transform(transform: new Matrix4.identity()..scale(scale)),
    );
  }
}
