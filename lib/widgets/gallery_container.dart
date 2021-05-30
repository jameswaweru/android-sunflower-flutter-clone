import 'package:android_sunflower/models/Photo.dart';
import 'package:android_sunflower/models/PhotoUrls.dart';
import 'package:android_sunflower/pages/gallery_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';

class GalleryContainer extends StatefulWidget {

  int integerType;
  Photo photo;
  GalleryContainer(this.integerType , this.photo);

  @override
  _GalleryContainerState createState() => _GalleryContainerState();
}

class _GalleryContainerState extends State<GalleryContainer> {

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: InkWell(
        onTap: (){
          _launchInBrowser(widget.photo.userUnsplashAccount);
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
                height: widget.integerType.isEven ? 130 : 140,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    // image: NetworkImage("https://cdn-prod.medicalnewstoday.com/content/images/articles/276/276714/red-and-white-onions.jpg"),
                      image: NetworkImage(widget.photo.url),
                    fit: BoxFit.cover
                  )
                ),
              ),
              SizedBox(height: 10,),
              Text(widget.photo.userName , style: TextStyle(color: Colors.black , fontSize: 17), textAlign: TextAlign.center,),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}


