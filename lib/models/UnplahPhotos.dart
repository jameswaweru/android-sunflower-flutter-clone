import 'package:android_sunflower/models/PhotoUrls.dart';

import 'PhotoUser.dart';

class UnplashPhotos {

  String id;
  PhotoUrl urls;
  UnplashUser user;

  UnplashPhotos(this.id, this.urls, this.user);

  factory UnplashPhotos.fromJson(dynamic json) {
    return UnplashPhotos(
        json['id'] as String,
        json['urls'] as PhotoUrl,
        json['user'] as UnplashUser
    );
  }

  Map toJson() => {
    "id": id,
    "urls": urls.toJson(),
    "user":user.toJson()
  };



}