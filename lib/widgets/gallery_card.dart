import 'package:android_sunflower/constants/colors.dart';
import 'package:android_sunflower/constants/constants.dart';
import 'package:android_sunflower/pages/gallery_page.dart';
import 'package:android_sunflower/pages/plant_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class GalleryCard extends StatefulWidget {
  @override
  _GalleryCardState createState() => _GalleryCardState();
}

class _GalleryCardState extends State<GalleryCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

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
