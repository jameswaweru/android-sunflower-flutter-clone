import 'package:android_sunflower/models/plant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:android_sunflower/pages/plant_details.dart';

class PlantListCard extends StatefulWidget {

  Plant plant;
  PlantListCard(this.plant);

  @override
  _PlantListCardState createState() => _PlantListCardState();
}

class _PlantListCardState extends State<PlantListCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            PageTransition(
                duration: Duration(milliseconds: 700),
                type: PageTransitionType.fade,
                child: PlantDetails(widget.plant , true)));
      },
      child: Card(
        elevation: 5,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)
            )
        ),
        child: InkWell(
          child: Column(
            children: [
              Image(
                image: NetworkImage("https://cdn-prod.medicalnewstoday.com/content/images/articles/276/276714/red-and-white-onions.jpg"),
                fit: BoxFit.fitWidth,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Plant Name" , style: TextStyle(color: Colors.black),)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
