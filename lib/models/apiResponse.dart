import 'package:android_sunflower/models/UnplahPhotos.dart';

class ApiResponse{
  int total;
  int total_pages;
  UnplashPhotos unplashPhotos;

  ApiResponse(this.total , this.total_pages , this.unplashPhotos);

}