import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:android_sunflower/pages/plant_details.dart';

class PlantedPlantDetailsCard extends StatefulWidget {

  int integerType;
  PlantedPlantDetailsCard(this.integerType);

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
                  child: PlantDetails()));
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
                        image: NetworkImage("https://cdn-prod.medicalnewstoday.com/content/images/articles/276/276714/red-and-white-onions.jpg"),
                        fit: BoxFit.cover
                    )
                ),
              ),
              SizedBox(height: 10,),
              Text("Hey" , style: TextStyle(color: Colors.black , fontSize: 16),),
              SizedBox(height: 15,),
              Text("Planted" , style: TextStyle(color: Colors.green[500] , fontSize: 16),),
              Text("May 25, 2021" , style: TextStyle(color: Colors.black , fontSize: 16 , fontWeight: FontWeight.w500),),
              SizedBox(height: 15,),
              Text("Last Watered" , style: TextStyle(color: Colors.green[500] , fontSize: 16),),
              Text("May 25, 2021" , style: TextStyle(color: Colors.black , fontSize: 16 , fontWeight: FontWeight.w500),),
              Text("water in 7 days" , style: TextStyle(color: Colors.black , fontSize: 16 , fontWeight: FontWeight.w500),),
              SizedBox(height: 16,),
            ],
          ),
        ),
      ),
    );
  }
}
