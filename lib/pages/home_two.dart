import 'package:android_sunflower/constants/colors.dart';
import 'package:android_sunflower/pages/gallery_page.dart';
import 'package:android_sunflower/tabs_pages/my_garden_tab.dart';
import 'package:android_sunflower/tabs_pages/plant_list_tab.dart';
import 'package:android_sunflower/widgets/plant_card.dart';
import 'package:android_sunflower/widgets/plant_list_card.dart';
import 'package:android_sunflower/widgets/planted_plant_details_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:android_sunflower/widgets/gallery_container.dart';

class HomePageTwo extends StatefulWidget  {
  @override
  _HomePageTwoState createState() => _HomePageTwoState();
}

class _HomePageTwoState extends State<HomePageTwo> with SingleTickerProviderStateMixin{

  final ScrollController scrollController = ScrollController();
  final ScrollController customeScrollViewScrollController = ScrollController();
  final ScrollController staggeredListScrollController = ScrollController();
  final ScrollController listViewScrollController = ScrollController();
  late TabController _tabController;
  int selectedTabIndex = 0;


  List<String> plantedPlants = [
    "https://cdn-prod.medicalnewstoday.com/content/images/articles/276/276714/red-and-white-onions.jpg",
    "https://cdn-prod.medicalnewstoday.com/content/images/articles/276/276714/red-and-white-onions.jpg",
    "https://cdn-prod.medicalnewstoday.com/content/images/articles/276/276714/red-and-white-onions.jpg",
    "https://cdn-prod.medicalnewstoday.com/content/images/articles/276/276714/red-and-white-onions.jpg",
    "https://cdn-prod.medicalnewstoday.com/content/images/articles/276/276714/red-and-white-onions.jpg",
    "https://cdn-prod.medicalnewstoday.com/content/images/articles/276/276714/red-and-white-onions.jpg",
    "https://cdn-prod.medicalnewstoday.com/content/images/articles/276/276714/red-and-white-onions.jpg",
    "https://cdn-prod.medicalnewstoday.com/content/images/articles/276/276714/red-and-white-onions.jpg"
  ];
  // List tabsScreens = [
  //   MyGardenTab(plantedPlants: plantedPlants),
  //   PlantListTab()
  // ];
  // List of Tabs
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'tab at 0 index'),
    Tab(text: 'tab at 1 index')
  ];


  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        selectedTabIndex = _tabController.index;
      });
      print("Selected Index: " + selectedTabIndex.toString());
    });

    customeScrollViewScrollController.addListener(() { });


    listViewScrollController.addListener(() {

      if(listViewScrollController.position.userScrollDirection == ScrollDirection.forward){
        print("Scrolling down..");
        customeScrollViewScrollController.animateTo(
          customeScrollViewScrollController.position.minScrollExtent,
          duration: Duration(milliseconds: 500),
          curve: Curves.decelerate,
        );
      }
      if(listViewScrollController.position.userScrollDirection == ScrollDirection.reverse){
        print("Scrolling up..");
        customeScrollViewScrollController.animateTo(
          customeScrollViewScrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 500),
          curve: Curves.decelerate,
        );
      }
    });

    staggeredListScrollController.addListener(() {

      if(staggeredListScrollController.position.userScrollDirection == ScrollDirection.forward){
        print("Scrolling down..");
        customeScrollViewScrollController.animateTo(
          customeScrollViewScrollController.position.minScrollExtent,
          duration: Duration(milliseconds: 500),
          curve: Curves.decelerate,
        );
      }
      if(staggeredListScrollController.position.userScrollDirection == ScrollDirection.reverse){
        print("Scrolling up..");
        customeScrollViewScrollController.animateTo(
          customeScrollViewScrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 500),
          curve: Curves.decelerate,
        );
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    listViewScrollController.dispose();
    customeScrollViewScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: CustomScrollView(
          controller: customeScrollViewScrollController,
          slivers: [
            SliverAppBar(

              floating: true,
              pinned: true,
              snap: false,
              title: Text("Sunflower", style: TextStyle(color: Colors.white , fontSize: 25 , letterSpacing: 1 , fontWeight: FontWeight.normal),),
              centerTitle: true,
              actions: [
                selectedTabIndex == 0 ? Text("") :
                Icon(
                  Icons.filter_list,
                  color: Colors.white,
                )
              ],
              bottom: TabBar(
                controller: _tabController,
                indicatorColor: Colors.yellow,
                unselectedLabelColor: Color(0xFF555555),
                labelColor: Colors.black,
                tabs: [
                  Tab(
                    icon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.directions_bike,
                        color: selectedTabIndex == 0 ? Colors.yellow : Colors.black,
                        size: 20,
                      ),
                    ),
                    text: 'MY GARDEN',
                  ),
                  Tab(
                    icon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.directions_transit,
                        color: selectedTabIndex == 1 ? Colors.yellow : Colors.black,
                        size: 20,
                      ),
                    ),
                    text: 'PLANT LIST',

                  ),
                ],
              ),
            ),

            SliverFillRemaining(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Container(
                    child: plantedPlants.length > 0 ? StaggeredGridView.countBuilder(
                      controller: staggeredListScrollController,
                      scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        crossAxisCount: 4,
                        itemCount: 7,
                        shrinkWrap: true,
                        itemBuilder: (context , index) => PlantedPlantDetailsCard(index),
                        staggeredTileBuilder: (int index) =>
                        new StaggeredTile.fit(2),
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                    ) : Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Your Garden is empty",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 28,
                              color: Colors.black
                          ),
                        ),

                        InkWell(
                          onTap: (){
                            setState(() {
                              selectedTabIndex = 1;
                              _tabController.animateTo(1);
                            });

                          },
                          child: Container(
                            padding: EdgeInsets.all(13.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20)
                              ),
                              color: Colors.yellow,),
                            child: Text("ADD PLANT" , style: TextStyle(color: sunflower_green_500 , letterSpacing: 2, fontWeight: FontWeight.bold),),
                          ),
                        )
                      ],
                    ),
                  ),
                  GridView.count(
                    controller: listViewScrollController,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    padding: EdgeInsets.all(25),
                    children: plantedPlants.map((e) => PlantCard()).toList(),
                  )
                ],

            )
            )

          ],
        ),
      ),
    );
  }
}

