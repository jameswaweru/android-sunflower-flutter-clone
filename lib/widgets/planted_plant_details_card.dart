import 'dart:convert';

import 'package:android_sunflower/models/plant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:android_sunflower/pages/plant_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlantedPlantDetailsCard extends StatefulWidget {

  int integerType;
  Plant plant;
  PlantedPlantDetailsCard(this.integerType , this.plant);

  @override
  _PlantedPlantDetailsCardState createState() => _PlantedPlantDetailsCardState();
}

class _PlantedPlantDetailsCardState extends State<PlantedPlantDetailsCard> {

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(14.0),
      child: InkWell(
        onTap: (){

          Navigator.push(
              context,
              PageTransition(
                  duration: Duration(milliseconds: 700),
                  type: PageTransitionType.fade,
                  child: PlantDetails(widget.plant , true)));
        },
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20)
              ),
              color: Colors.white
          ),
          child: Column(
            children: [
              Container(
                height: widget.integerType.isEven ? 100 : 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.plant.imageUrl),
                        fit: BoxFit.cover
                    )
                ),
              ),
              // CachedNetworkImage(
              //   imageUrl: widget.plant.imageUrl,
              //   height: widget.integerType.isEven ? 100 : 100,
              //   imageBuilder: (context, imageProvider) => Container(
              //     decoration: BoxDecoration(
              //       image: DecorationImage(
              //           image: NetworkImage(widget.plant.imageUrl),
              //           fit: BoxFit.cover,
              //           colorFilter:
              //           ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
              //     ),
              //   ),
              //   // placeholder: (context, url) => CircularProgressIndicator(),
              //   errorWidget: (context, url, error) => Icon(Icons.error),
              // ),
              SizedBox(height: 10,),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(widget.plant.name , style: TextStyle(color: Colors.black , fontSize: 16, ),textAlign: TextAlign.center,),
                ],
              ),
              SizedBox(height: 15,),
              Text("Planted" , style: TextStyle(color: Colors.green[500] , fontSize: 16), textAlign: TextAlign.center,),
              Text(widget.plant.datePlanted, style: TextStyle(color: Colors.black , fontSize: 16 , fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
              SizedBox(height: 15,),
              Text("Last Watered" , style: TextStyle(color: Colors.green[500] , fontSize: 16),textAlign: TextAlign.center,),
              Text(widget.plant.datePlanted , style: TextStyle(color: Colors.black , fontSize: 16 , fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
              Text("water in "+widget.plant.wateringInterval.toString()+" days" , style: TextStyle(color: Colors.black , fontSize: 16 , fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
              SizedBox(height: 16,),
            ],
          ),
        ),
      ),
    );
  }
}
