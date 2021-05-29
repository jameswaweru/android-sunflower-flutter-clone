class PlantedPlants {
  String plantId;
  String datePlanted;

  PlantedPlants(this.plantId , this.datePlanted);

  Map toJson() => {
    "plantId": plantId,
    "datePlanted": datePlanted
  };

}