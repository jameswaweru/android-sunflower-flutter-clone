import 'package:android_sunflower/constants/colors.dart';
import 'package:android_sunflower/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GardenPlant extends StatelessWidget {
  //also replaced
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
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
            tag: 'tag',
            child: Container(
              width: width - fixPadding * 4.0,
              height: 200.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("https://cdn-prod.medicalnewstoday.com/content/images/articles/276/276714/red-and-white-onions.jpg"),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Beet" , style: TextStyle(color: Colors.black,),),
                        SizedBox(height: 10,),
                        Text("Planted" , style: TextStyle(color: sunflower_green_700, fontWeight: FontWeight.w500),),
                        SizedBox(height: 10,),
                        Text("May 25, 2021", style: TextStyle(color: Colors.black , fontWeight: FontWeight.w500),),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Last Watered" , style: TextStyle(color: sunflower_green_700 , fontWeight: FontWeight.w800),),
                        SizedBox(height: 10,),
                        Text("May 25, 2021" , style: TextStyle(color: Colors.black , fontWeight: FontWeight.w500),),
                        SizedBox(height: 10,),
                        Text("water in 7 days" , style: TextStyle(color: Colors.black , fontWeight: FontWeight.w700),),
                      ],
                    )
                  ],
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
