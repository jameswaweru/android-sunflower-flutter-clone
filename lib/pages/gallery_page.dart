import 'dart:convert';
import 'dart:io';

import 'package:android_sunflower/models/Photo.dart';
import 'package:android_sunflower/models/UnplahPhotos.dart';
import 'package:android_sunflower/widgets/gallery_card.dart';
import 'package:android_sunflower/widgets/gallery_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;

class GalleryPage extends StatefulWidget {

  String plantName;

  GalleryPage(this.plantName);

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {

  List<Photo> photos = [];

  Future<List<Photo>> getPhotos() async {

    var queryParameters = {
      'client_id': 'cKakzKM1cx44BUYBnEIrrgN_gnGqt81UcE7GstJEils',
      'per_page': '30',
      'orientation':'portrait',
      'page':'1',
      'query':widget.plantName,
    };
    var uri =
    Uri.https('api.unsplash.com', '/search/photos', queryParameters);

    var response = await http.get(uri, headers: {
      // HttpHeaders.authorizationHeader: 'Token $token',
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    var jsonData = jsonDecode(response.body);

    var results = jsonData['results'];

    for (var r in results){

      Photo photo = Photo(r["urls"]["small"], r["user"]["first_name"] , r["user"]["links"]["html"]);
      photos.add(photo);
    }

    print("apiResponse length:"+photos.length.toString());
    return photos;
  }


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
        child: FutureBuilder(
            future: getPhotos(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.data == null){
                return Container(
                    child: Center(
                    child: Text("Loading...")
                    )
                );
            }else{

               return StaggeredGridView.countBuilder(
                    scrollDirection: Axis.vertical,
                    physics: ScrollPhysics(),
                    crossAxisCount: 4,
                    itemCount: photos.length,
                    shrinkWrap: true,
                    itemBuilder: (context , index) => GalleryContainer(index , photos[index]),
                    staggeredTileBuilder: (int index) =>
                    new StaggeredTile.fit(2),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
              );

            }
          }
        ),
      ),
    );
  }
}
