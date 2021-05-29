class Plant {

  String plantId;
  String name;
  String description;
  int growZoneNumber;
  int wateringInterval;
  String imageUrl;
  String wikipediaLink;
  String datePlanted;

  Plant(this.plantId , this.name, this.description, this.growZoneNumber, this.wateringInterval , this.imageUrl, this.wikipediaLink, this.datePlanted);

  Map toJson() => {
    "plantId": plantId,
    "name": name,
    "growZoneNumber": growZoneNumber,
    "wateringInterval": wateringInterval,
    "imageUrl": imageUrl,
    "wikipediaLink":wikipediaLink,
    "datePlanted":datePlanted,
    "description": description,
  };

  factory Plant.fromJson(dynamic json) {
    return Plant(
      json['plantId'] as String,
      json['name'] as String,
      json['description'] as String,
      json['growZoneNumber'] as int,
      json['wateringInterval'] as int,
      json['imageUrl'] as String,
      json['wikipediaLink'] as String,
      json['datePlanted'] as String,
    );
  }

}