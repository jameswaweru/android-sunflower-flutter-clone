import 'package:android_sunflower/widgets/gallery_card.dart';
import 'package:android_sunflower/widgets/gallery_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photos By UnPlash" , style: TextStyle(color: Colors.white),),
        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StaggeredGridView.countBuilder(
          scrollDirection: Axis.vertical,
            physics: ScrollPhysics(),
            crossAxisCount: 4,
            itemCount: 7,
            shrinkWrap: true,
            itemBuilder: (context , index) => GalleryContainer(index),
            staggeredTileBuilder: (int index) =>
            new StaggeredTile.fit(2),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
      ),
    );
  }
}
