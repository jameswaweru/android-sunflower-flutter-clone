import 'dart:convert';

import 'package:android_sunflower/models/plant.dart';
import 'package:android_sunflower/pages/gallery_page.dart';
import 'package:android_sunflower/widgets/add_plant_fab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlantDetails extends StatefulWidget {

  Plant plant;
  bool? isPlantAdded ;

  PlantDetails(this.plant , this.isPlantAdded);


  @override
  _PlantDetailsState createState() => _PlantDetailsState();
}

class _PlantDetailsState extends State<PlantDetails> {

  var top = 0.0;
  late ScrollController _scrollController;
  SharedPreferences? preferences;


  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController();
    _scrollController.addListener(() => setState(() {}));
    this.initializePreference().whenComplete((){
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> initializePreference() async{
    this.preferences = await SharedPreferences.getInstance();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
            controller:_scrollController ,
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                expandedHeight: 200,
                floating: true,
                pinned: true,
                flexibleSpace: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      top = constraints.biggest.height;
                      return FlexibleSpaceBar(
                        background: Image.network(
                          widget.plant.imageUrl,
                          fit: BoxFit.cover,
                        ),
                        title: top < 85 ? Text(widget.plant.name , style: TextStyle(color: Colors.black),) : Text(""),
                        centerTitle: true,
                      );

                    }
                ),
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Ink(
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        color: Colors.black,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Ink(
                        decoration: const ShapeDecoration(
                          color: Colors.white,
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.share),
                          color: Colors.black,
                          onPressed: () {
                            Share.share("Checkout out the "+widget.plant.name+" plant in the Android Sunflower app", subject: "Share?");
                          },
                        )
                    ),
                  ),
                  SizedBox(width: 12),
                ],
              ),

              SliverFillRemaining(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(widget.plant.name , style: TextStyle(fontSize: 20, color: Colors.black),),
                              SizedBox(height: 15,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("as", style: TextStyle(color: Colors.white),),
                                  Text("Watering needs" ,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.green[300],
                                        fontWeight: FontWeight.w500
                                    )
                                    ,),
                                  InkWell(
                                    child: Icon(
                                      Icons.image_rounded,
                                    ),
                                    onTap: (){
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              duration: Duration(milliseconds: 700),
                                              type: PageTransitionType.fade,
                                              child: GalleryPage(widget.plant.name)));
                                    },
                                  )
                                ],
                              ),

                              Text("every "+widget.plant.wateringInterval.toString()+" days" , style: TextStyle(fontSize: 14, color: Colors.grey[400]),)
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20,),
                              // Text("Roses are red" , style: TextStyle(fontSize: 15, color: Colors.grey[600]),),
                              // Text("Voilet are blue" , style: TextStyle(fontSize: 15, color: Colors.grey[600]),),
                              // Text("Sunflowers have seeds" , style: TextStyle(fontSize: 15, color: Colors.grey[600]),),
                              // Text("That folks" , style: TextStyle(fontSize: 15, color: Colors.grey[600]),),
                              // SizedBox(height: 20,),
                              // Text("That folks" , style: TextStyle(fontSize: 15, color: Colors.grey[600]),),
                              // SizedBox(height: 20,),
                              Text(widget.plant.description ,
                                style: TextStyle(fontSize: 15, color: Colors.grey[600]),),
                            ],
                          ),
                        ],
                      )
                  ),
                ),
              )
            ],
          ),
          // isPlantAdded == true ? AddPlantFab(defaultTopMargin: 200-4, scaleStart: 96, scrollController: _scrollController , plant: widget.plant ,  )
          //     : Container(),
          AddPlantFab(defaultTopMargin: 200-4, scaleStart: 96, scrollController: _scrollController , plant: widget.plant , isPlantAdded: widget.isPlantAdded)

        ],
      ),

    );
  }


  Widget buildImages() => SliverToBoxAdapter(
    child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      primary: false,
      shrinkWrap: true,
      itemCount: 20,
      itemBuilder: (context, index) => Card(),
    ),
  );
}