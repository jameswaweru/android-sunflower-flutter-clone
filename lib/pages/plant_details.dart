import 'package:android_sunflower/constants/colors.dart';
import 'package:android_sunflower/pages/gallery_page.dart';
import 'package:android_sunflower/pages/home_two.dart';
import 'package:android_sunflower/tabs_pages/my_garden_tab.dart';
import 'package:android_sunflower/tabs_pages/plant_list_tab.dart';
import 'package:android_sunflower/widgets/GetToolBarText.dart';
import 'package:android_sunflower/widgets/add_plant_fab.dart';
import 'package:android_sunflower/widgets/plant_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class PlantDetails extends StatefulWidget {
  @override
  _PlantDetailsState createState() => _PlantDetailsState();
}

class _PlantDetailsState extends State<PlantDetails> {

  // final ScrollController scrollController = ScrollController();
  var top = 0.0;

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController();
    _scrollController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
                          'https://cdn-prod.medicalnewstoday.com/content/images/articles/276/276714/red-and-white-onions.jpg',
                          fit: BoxFit.cover,
                        ),
                        title: top < 85 ? Text("Plant Name" , style: TextStyle(color: Colors.black),) : Text(""),
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
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => HomePageTwo()),
                                (Route<dynamic> route) => false,
                          );
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
                              Text("Sunflower" , style: TextStyle(fontSize: 20, color: Colors.black),),
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
                                              child: GalleryPage()));
                                    },
                                  )
                                ],
                              ),

                              Text("every 3 days" , style: TextStyle(fontSize: 14, color: Colors.grey[300]),)
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20,),
                              Text("Roses are red" , style: TextStyle(fontSize: 15, color: Colors.grey[600]),),
                              Text("Voilet are blue" , style: TextStyle(fontSize: 15, color: Colors.grey[600]),),
                              Text("Sunflowers have seeds" , style: TextStyle(fontSize: 15, color: Colors.grey[600]),),
                              Text("That folks" , style: TextStyle(fontSize: 15, color: Colors.grey[600]),),
                              SizedBox(height: 20,),
                              Text("That folks" , style: TextStyle(fontSize: 15, color: Colors.grey[600]),),
                              SizedBox(height: 20,),
                              Text("Hi! Question. Why does it fully expand to 224 when you've set expandedHeight to 200? And is there any way to get that 224 max number without it changing when you scroll? Right now I'm using it to map the appbar height from 0.0 to 1.0 for a smooth opacity transition throughout (although there's probably an easier way to do it than I am trying)" ,
                                style: TextStyle(fontSize: 15, color: Colors.grey[600]),),
                            ],
                          )
                        ],
                      )
                  ),
                ),
              )
            ],
          ),
          AddPlantFab(defaultTopMargin: 200-4, scaleStart: 96, scrollController: _scrollController)
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
