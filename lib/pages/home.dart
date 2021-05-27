import 'package:android_sunflower/constants/colors.dart';
import 'package:android_sunflower/tabs_pages/my_garden_tab.dart';
import 'package:android_sunflower/tabs_pages/plant_list_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
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
  // controller object
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(() {
      setState(() {
        selectedTabIndex = _tabController.index;
      });
      print("Selected Index: " + selectedTabIndex.toString());
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
     body: DefaultTabController(
       length: 2,
       child: Padding(
         padding: const EdgeInsets.only(right: 14.0, left: 12.0, top: 12.0),
         child: NestedScrollView(
           controller: scrollController,
           headerSliverBuilder: (context , value){
             return [
               SliverAppBar(
                 floating: true,
                 snap: false,
                 // title: FadeOnScroll(
                 //   scrollController: scrollController,
                 //   fullOpacityOffset: 180,
                 //   child: Text("I'm going to fade" , style: TextStyle(color: Colors.white),),
                 // ),
                 // centerTitle: true,

                 actions: [
                   selectedTabIndex == 0 ? Text("") :
                   Icon(
                     Icons.filter_list,
                     color: Colors.white,
                   )
                 ],
               flexibleSpace: FlexibleSpaceBar(
                 title: Text("Sunflower"),
                 centerTitle: true,
                 collapseMode: CollapseMode.pin,
               )
               ),
             // SliverPadding(
             //   padding: const EdgeInsets.all(8.0),
             // ),
               SliverPersistentHeader(
                 pinned: true,
                   delegate: _SliverAppBarDelegate(

                 TabBar(
                   controller: _tabController,
                   indicatorColor: Colors.yellow,
                   unselectedLabelColor: Color(0xFF555555),
                   labelColor: Colors.black,
                 onTap: (index){
                     setState(() {
                       selectedTabIndex = index;
                       });
                     },
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

                     )
                   ],
                 )
               ))
             ];
           },
           body: TabBarView(
           controller: _tabController,
           children: myTabs.map((Tab tab) {
             return selectedTabIndex == 0 ?
             Container(
               child: plantedPlants.length > 0 ? MyGardenTab(plantedPlants: plantedPlants,)
                   : Column(mainAxisAlignment: MainAxisAlignment.center,
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
             )
                 : PlantListTab();
           }).toList(),
         ),
         ),
       ),
     ),
    );

    // return DefaultTabController(
    //   length: 2,
    //   initialIndex: selectedTabIndex,
    //
    //   child: Scaffold(
    //     appBar: AppBar(
    //
    //       actions: [
    //         selectedTabIndex == 0 ? Text("") :
    //         Icon(
    //           Icons.filter_list,
    //           color: Colors.white,
    //         )
    //       ],
    //       bottom: TabBar(
    //         controller: _tabController,
    //         indicatorColor: Colors.yellow,
    //         unselectedLabelColor: Color(0xFF555555),
    //         labelColor: Colors.black,
    //         onTap: (index){
    //           setState(() {
    //             selectedTabIndex = index;
    //           });
    //         },
    //         tabs: [
    //           Tab(
    //               icon: Icon(
    //                 Icons.directions_bike,
    //                 color: selectedTabIndex == 0 ? Colors.yellow : Colors.black,
    //                 size: 20,
    //               ),
    //               text: 'MY GARDEN',
    //           ),
    //           Tab(
    //               icon: Icon(
    //                 Icons.directions_transit,
    //                   color: selectedTabIndex == 1 ? Colors.yellow : Colors.black,
    //                  size: 20,
    //               ),
    //             text: 'PLANT LIST',
    //
    //           )
    //         ],
    //       ),
    //       title: Text('Sunflower' , style: TextStyle(color: Colors.white, fontSize: 28),),
    //       centerTitle: true,
    //     ),
    //     body: TabBarView(
    //       controller: _tabController,
    //       children: myTabs.map((Tab tab) {
    //         return selectedTabIndex == 0 ?
    //              Container(
    //                child: plantedPlants.length > 0 ? MyGardenTab(plantedPlants: plantedPlants,)
    //                    : Column(mainAxisAlignment: MainAxisAlignment.center,
    //                  children: [
    //                    Text("Your Garden is empty",
    //                      style: TextStyle(
    //                          fontWeight: FontWeight.w400,
    //                          fontSize: 28,
    //                          color: Colors.black
    //                      ),
    //                    ),
    //
    //                    InkWell(
    //                      onTap: (){
    //                        setState(() {
    //                          selectedTabIndex = 1;
    //                          _tabController.animateTo(1);
    //                        });
    //
    //                      },
    //                      child: Container(
    //                        padding: EdgeInsets.all(13.0),
    //                        decoration: BoxDecoration(
    //                          borderRadius: BorderRadius.only(
    //                              topRight: Radius.circular(20),
    //                              bottomLeft: Radius.circular(20)
    //                          ),
    //                          color: Colors.yellow,),
    //                        child: Text("ADD PLANT" , style: TextStyle(color: sunflower_green_500 , letterSpacing: 2, fontWeight: FontWeight.bold),),
    //                      ),
    //                    )
    //                  ],
    //                ),
    //              )
    //             : PlantListTab();
    //        }).toList(),
    //     ),
    //   ),
    // );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: sunflower_green_300,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}



