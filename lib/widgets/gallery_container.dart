import 'package:android_sunflower/pages/gallery_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class GalleryContainer extends StatefulWidget {

  int integerType;
  GalleryContainer(this.integerType);

  @override
  _GalleryContainerState createState() => _GalleryContainerState();
}

class _GalleryContainerState extends State<GalleryContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: InkWell(
        onTap: (){

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
                height: widget.integerType.isEven ? 200 : 170,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://cdn-prod.medicalnewstoday.com/content/images/articles/276/276714/red-and-white-onions.jpg"),
                    fit: BoxFit.cover
                  )
                ),
              ),
              SizedBox(height: 10,),
              Text("Hey" , style: TextStyle(color: Colors.black , fontSize: 20),),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
